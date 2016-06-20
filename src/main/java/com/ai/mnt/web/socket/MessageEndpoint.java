package com.ai.mnt.web.socket;

import java.io.IOException;
import java.util.Map;

import javax.websocket.CloseReason;
import javax.websocket.EndpointConfig;
import javax.websocket.OnClose;
import javax.websocket.OnError;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.ServerEndpoint;

import org.apache.log4j.Logger;

import com.ai.mnt.common.socket.WsSessionMgnt;
import com.ai.mnt.model.priv.Message;
import com.ai.mnt.model.priv.MessageType;
import com.fasterxml.jackson.databind.ObjectMapper;

@ServerEndpoint(value = "/msg")
public class MessageEndpoint {

    private Logger log = Logger.getLogger(MessageEndpoint.class);
    private WsSessionMgnt wsSession = WsSessionMgnt.getInstance();

    @OnOpen
    public void open(final Session session, EndpointConfig config) {
        wsSession.join(session);
        wsSession.sendMessage(" - Joined the chat WsSessionMgnt" + session.getId());
        log.info("==========open================");
    }

    @OnMessage
    public void onMessage(final Session session, final String messageJson) {
        ObjectMapper mapper = new ObjectMapper();
        Message message = null;
        try {
            message = mapper.readValue(messageJson, Message.class);
            log.info("=====messageJson : " + messageJson);
        } catch (IOException e) {
            String messageTxt = "Badly formatted message";
            try {
                session.close(new CloseReason(CloseReason.CloseCodes.CANNOT_ACCEPT, messageTxt));
            } catch (IOException ex) {
                log.error(ex.getMessage());
            }
        }

        Map<String, Object> properties = session.getUserProperties();
        if (message.getMessageType() == MessageType.LOGIN) {
            String name = message.getMessage();
            properties.put("name", name);
            wsSession.join(session);
            wsSession.sendMessage(name + " - Joined the chat WsSessionMgnt");
        } else {
            String name = (String) properties.get("name");
            wsSession.sendMessage(name + " - " + message.getMessage());
        }
    }

    @OnClose
    public void onClose(Session session, CloseReason reason) {
        wsSession.leave(session);
        wsSession.sendMessage((String) session.getUserProperties().get("name")
                + " - Left the WsSessionMgnt");
    }

    @OnError
    public void onError(Session session, Throwable ex) {
        log.info("Error: " + ex.getMessage());
    }

}

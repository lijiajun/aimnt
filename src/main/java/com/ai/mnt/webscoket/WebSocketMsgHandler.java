package com.ai.mnt.webscoket;

import java.util.ArrayList;
import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

public class WebSocketMsgHandler extends TextWebSocketHandler{
    
    private static Logger logger = Logger.getLogger(WebSocketMsgHandler.class);
    
    private static List<WebSocketSession> sessions = new ArrayList<>();
    
    @Override
    public void afterConnectionEstablished(WebSocketSession session)
            throws Exception {
        sessions.add(session);
        logger.info("=====Connection Established=======");
    }
    
    
    @Override
    public void handleTransportError(WebSocketSession session,
            Throwable exception) throws Exception {
        if(session.isOpen()){
            session.close();
        }
        sessions.remove(session);
        logger.info("=====Connection Closed !=======" + exception.getMessage());
    }
    
    @Override
    public void afterConnectionClosed(WebSocketSession session,
            CloseStatus status) throws Exception {
        sessions.remove(session);
        logger.info("=====Connection Closed !=======");
    }
    
    @Override
    public void handleMessage(WebSocketSession session,
            WebSocketMessage<?> message) throws Exception {
        //TextMessage payload = (TextMessage) message.getPayload();
        logger.info("=====HandleMessage!=======");
    }
    
    /**
     * 推送单用户
     * @param userName
     * @param message
     * @throws Exception
     */
    public void sendMessageToUser(String userName, TextMessage message) throws Exception {
        for(WebSocketSession session : sessions) {
            if(session.isOpen()
                    && session.getAttributes().get(userName) != null) {
                session.sendMessage(message);
            }
        }
    }
    
    /**
     * 推送用户群组
     * @param userName
     * @param message
     * @throws Exception
     */
    public void sendMessageToUser(List<String> userNames, TextMessage message) throws Exception {
        for(WebSocketSession session : sessions) {
            if(session.isOpen()) {
                for(String userName : userNames) {
                    if(session.getAttributes().get(userName) != null) {
                        session.sendMessage(message);
                    }
                }
            }
        }
    }
    
    
    /**
     * 推送所有用户
     * @param userName
     * @param message
     * @throws Exception
     */
    public void sendMessageToUsers(TextMessage message) throws Exception {
        for(WebSocketSession session : sessions) {
            if(session.isOpen()) {
                session.sendMessage(message);
            }
        }
    }
}

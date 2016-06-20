package com.ai.mnt.web.socket;

import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.WebSocketHandler;
import org.springframework.web.socket.WebSocketMessage;
import org.springframework.web.socket.WebSocketSession;


public class MessageHandler implements WebSocketHandler {

    @Override
    public void afterConnectionEstablished(WebSocketSession session)
            throws Exception {
        System.out.println("=======session==========");
    }

    @Override
    public void handleMessage(WebSocketSession session,
            WebSocketMessage<?> message) throws Exception {
        
        System.out.println("=======message==========");
        
    }

    @Override
    public void handleTransportError(WebSocketSession session,
            Throwable exception) throws Exception {
        System.out.println("=======exception==========");

    }

    @Override
    public void afterConnectionClosed(WebSocketSession session,
            CloseStatus closeStatus) throws Exception {
        System.out.println("=======CloseStatus==========");

    }

    @Override
    public boolean supportsPartialMessages() {
        return false;
    }

}

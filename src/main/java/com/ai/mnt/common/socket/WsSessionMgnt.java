package com.ai.mnt.common.socket;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.websocket.Session;

public class WsSessionMgnt {
    
    private static WsSessionMgnt instance = null;
    private List<Session> sessions = new ArrayList<Session>();

    public synchronized void join(Session session) {
        sessions.add(session);
    }

    public synchronized void leave(Session session) {
        sessions.remove(session);
    }

    public synchronized void sendMessage(String message) {
        for (Session session : sessions) {
            if (session.isOpen()) {
                try {
                    session.getBasicRemote().sendText(message);
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        }
    }

    public synchronized static WsSessionMgnt getInstance() {
        if (instance == null) {
            instance = new WsSessionMgnt();
        }
        return instance;
    }
}

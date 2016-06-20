package com.ai.mnt.web.socket;

import java.util.HashMap;
import java.util.Map;
import java.util.Random;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.socket.TextMessage;

import com.ai.mnt.common.shiro.UserRealm;
import com.ai.mnt.common.socket.WsSessionMgnt;
import com.ai.mnt.webscoket.WebSocketMsgHandler;

@Controller
@RequestMapping("/ws")
public class WsController {
    
    
    @Autowired
    UserRealm userRealm;
    
    @Bean
    public WebSocketMsgHandler wsHandler() {
        return new WebSocketMsgHandler();
    }
    
    
    @RequestMapping("/page")
    public String indexPage(Model model) {

        return "ws/msg_ws";
    }
    
    @RequestMapping("/push/msg")
    @ResponseBody
    public String pushMsgModel() {

        Random r = new Random();
        int num = r.nextInt(100);
        WsSessionMgnt.getInstance().sendMessage("测试WSocket===========" + num);
        
        return "1";
    }
    
    @RequestMapping("/sp/page")
    public String indexSpPage(Model model) {

        return "ws/sp_msg_ws";
    }
    
    @RequestMapping("/push/sp_msg")
    @ResponseBody
    public Map<String, String> pushSpMsgModel() throws Exception {

        Random r = new Random();
        int num = r.nextInt(100);
//        WsSessionMgnt.getInstance().sendMessage("测试WSocket===========" + num);
        
        //SysUser currentUser = userRealm.getCurrentUser();
        
        wsHandler().sendMessageToUsers(new TextMessage("测试SP WSocket===========" + num));
        
        Map<String, String> map = new HashMap<>();
        map.put("msg", "r = " + num);
        return map;
    }
}

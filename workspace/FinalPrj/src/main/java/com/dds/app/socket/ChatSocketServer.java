package com.dds.app.socket;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.dds.app.chat.dao.ChatDao;
import com.dds.app.member.vo.MemberVo;

import lombok.extern.slf4j.Slf4j;

@Slf4j
public class ChatSocketServer extends TextWebSocketHandler {
	
	private final Map<String, WebSocketSession> sessionMap = new HashMap<>();
    private final ChatDao dao;
    private final SqlSessionTemplate sst;

    @Autowired
    public ChatSocketServer(ChatDao dao, SqlSessionTemplate sst) {
        this.dao = dao;
        this.sst = sst;
    }

    @Override
    public void afterConnectionEstablished(WebSocketSession session) throws Exception {
        MemberVo loginMember = (MemberVo) session.getAttributes().get("loginMember");
        String nick = loginMember.getNick();
        log.info("{} 연결됨", nick);
        sessionMap.put(session.getId(), session);
    }

    @Override
    protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
        Object loginMember = session.getAttributes().get("loginMember");
        MemberVo member = (MemberVo) loginMember;
        String sender = null;
//        String senderNo = member.getNo();
        
        if (loginMember instanceof MemberVo) {
            member = (MemberVo) loginMember;
            sender = member.getNick();
        }

        String msg = message.getPayload();
        TextMessage textMsg = new TextMessage(sender + "<br>" + msg);
        broadcast(textMsg);
        saveChatMessage(sender, msg);
    }

    private void broadcast(TextMessage textMsg) throws IOException {
        for (WebSocketSession session : sessionMap.values()) {
            session.sendMessage(textMsg);
        }
    }

    private void saveChatMessage(String sender, String message) {
        //채팅 메시지를 데이터베이스에 저장
        dao.saveChatMessage(sst , sender, message);
    }

    @Override
    public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
        MemberVo loginMember = (MemberVo) session.getAttributes().get("loginMember");
        String nick = loginMember.getNick();
        log.info("{} 연결 끊김", nick);
        sessionMap.remove(session.getId());
    }
}//class

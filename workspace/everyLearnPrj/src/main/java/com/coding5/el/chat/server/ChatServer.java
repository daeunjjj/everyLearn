package com.coding5.el.chat.server;

import java.util.HashSet;
import java.util.Map;
import java.util.Set;

import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import lombok.extern.slf4j.Slf4j;

@Slf4j
public class ChatServer extends TextWebSocketHandler {
	
	
	private Set<WebSocketSession> sessionSet = new HashSet<WebSocketSession>();
	
	//연결 완료 이후에 동작하는 메소드
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		log.info("[연결] {}", session);
		
		Map map = session.getAttributes();
		log.info(session.toString());
		
		sessionSet.add(session);
	}
	//발신 session.sendMessage(메시지);
	
	//수신
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		//누가 어떤 메시지를 보냈는지 파라미터로 받아오는 중
		log.info("[수신] {} : {}" , session, message);
		
		//메시지 만들기
		String memberId = (String)session.getAttributes().get("memberId");
		TextMessage msg = new TextMessage("[" + memberId + "]"  + message.getPayload());

		//연결된 모든 클라이언트에게 발신
		for(WebSocketSession wsSession : sessionSet) {
			if(!wsSession.isOpen()) continue;	//isOpen이 아니면 작업 이어가기			
			
			wsSession.sendMessage(msg);
		}
		
	}
	
	//닫기
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		log.info("[종료] {} : {}" , session, status);
		sessionSet.remove(session);
	}
	

}

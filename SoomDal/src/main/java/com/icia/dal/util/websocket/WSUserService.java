package com.icia.dal.util.websocket;

import java.util.List;
import java.util.Vector;

import javax.inject.Inject;

import org.springframework.stereotype.Component;
import org.springframework.web.socket.WebSocketSession;

import com.icia.dal.dao.DalinDao;
import com.icia.dal.dao.JejaDao;

// 여러명의 WSUser 관리
@Component
public class WSUserService {
	private List<WSUser> list = new Vector<>();
	@Inject
	private DalinDao dalDao;
	@Inject
	private JejaDao jejaDao;
	// 새로운 웹소켓 세션이 연결되면 기존 유저의 새로운 세션인지
	// 아니면 새로운 유저인지 판단
	public void add(WebSocketSession session) {
		System.out.println("접속:" + session.getPrincipal().getName());
		String username = session.getPrincipal().getName();
		// WSUser에서 리스트에서 username을 찾는다
		for(int i=0; i<list.size(); i++) {
			if(list.get(i).getUsername().equals(username)) {
				// 찾았다 -> 기존 유저이므로 세션만 추가
				list.get(i).add(session);
				return;
			}
		}
		// 못찾았다 ->새로운 유저. WSUser를 추가
		WSUser user = new WSUser(username, session);
		list.add(user);
		System.out.println(list);
	}
	
	// 연결이 끊어진 경우 마지막 연결이 유저를 삭제, 아니면 세션 삭제
	public int delete(WebSocketSession session) {
		System.out.println("웹 소켓 연결 해제 : " + session.getId());
		String username = session.getPrincipal().getName();
		for(int i=0; i<list.size(); i++) {
			// WSUser를 찾았다
			if(list.get(i).getUsername().equals(username)) {
				// WSUser가 가진 세션이 마지막 세션이면 유저 자체 삭제
				if(list.get(i).getSessionCount()==1) {
					list.remove(i);
					return 1;
				} else 
					list.get(i).delete(session);
			}
		}
		return -1;
	}
	
	// 메시지 보내기 1: 보내는 사람, 받는 사람
	public void sendDalinMsg(String sender, String receiver, String msg) {
		System.out.println("보내는 사람 : " + sender);
		System.out.println("받는 사람: " + receiver);
		for(WSUser user:list) {
			System.out.println("리스트에 저장된 유저 : " + user);
			if(user.getUsername().equals(dalDao.findIdByName(receiver))) {
				user.sendMessage(sender+"의 메시지:" + msg);
			}
		}
	}
	
	public void sendMsg(String sender, String receiver, String msg) {
		System.out.println("보내는 사람 : " + sender);
		System.out.println("받는 사람: " + receiver);
		for(WSUser user:list) {
			System.out.println("리스트에 저장된 유저 : " + user);
			if(user.getUsername().equals(receiver)) {
				user.sendMessage(sender+"의 메시지:" + msg);
			}
		}
	}
	
	public void sendJejaMsg(String sender, String receiver, String msg) {
		System.out.println("보내는 사람 : " + sender);
		System.out.println("받는 사람: " + receiver);
		for(WSUser user:list) {
			System.out.println("리스트에 저장된 유저 : " + user);
			if(user.getUsername().equals(jejaDao.findIdByName(receiver))) {
				user.sendMessage(sender+"의 메시지:" + msg);
			}
		}
	}
	
	
	public void sendLoginMsg(String sender, String receiver, String msg) {
		System.out.println("보내는 사람 : " + sender);
		System.out.println("받는 사람: " + receiver);
		for(WSUser user:list) {
			System.out.println("리스트에 저장된 유저 : " + user);
			if(user.getUsername().equals(receiver)) {
				user.sendMessage(sender+"의 메시지:" + msg);
			}
		}
	}
	
	// 메시지 보내기 2: 모든 사람(broadcast)
	public void sendMsgAll(String sender, String msg) {
		for(WSUser user:list) 
			user.sendMessage(sender+"의 메시지:" + msg);
	}
}
package com.icia.dal.util.security;

import java.io.IOException;

import javax.inject.Inject;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.DefaultRedirectStrategy;
import org.springframework.security.web.RedirectStrategy;
import org.springframework.security.web.authentication.SimpleUrlAuthenticationSuccessHandler;
import org.springframework.security.web.savedrequest.HttpSessionRequestCache;
import org.springframework.security.web.savedrequest.RequestCache;
import org.springframework.security.web.savedrequest.SavedRequest;
import org.springframework.stereotype.Component;

import com.icia.dal.dao.DalinDao;
import com.icia.dal.dao.JejaDao;
import com.icia.dal.dao.MemoDao;
import com.icia.dal.entity.Dalin;
import com.icia.dal.entity.Jeja;
import com.icia.dal.util.websocket.MessageWebSocketHandler;

@Component("DalinloginSuccessHandler")
public class DalinLoginSuccessHandler extends SimpleUrlAuthenticationSuccessHandler {
	@Inject
	private DalinDao dalDao;
	@Inject
	private MemoDao memoDao;
	@Inject
	private MessageWebSocketHandler handler;
	
	private RequestCache cache = new HttpSessionRequestCache();
	
	private RedirectStrategy rs = new DefaultRedirectStrategy();
	
	@Override
	public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
			Authentication authentication) throws IOException, ServletException {
		Dalin dalin = Dalin.builder().dEmail(authentication.getName()).dLoginFailureCnt(2).build();
		dalDao.updateToDalin(dalin);
		
		String Id = authentication.getName();
		String dalinPassword = request.getParameter("dPassword");
		HttpSession session = request.getSession();
		if(memoDao.isNotReadMemoExist(Id)==true)
			session.setAttribute("memoMsg", "새로운 메모가 있습니다");
		SavedRequest req = cache.getRequest(request, response);
		if(dalinPassword.length() >= 20) {
			session.setAttribute("msg", "임시비밀번호로 로그인 하셨습니다. 비밀번호를 변경해주세요.");
			rs.sendRedirect(request, response, "/member/resetToDalinPwd");
		}else if(req != null)
			rs.sendRedirect(request, response, req.getRedirectUrl());
		else
			rs.sendRedirect(request, response, "/");
	}
}

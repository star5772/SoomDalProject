package com.icia.dal.util.security;

import java.io.IOException;

import javax.inject.Inject;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.DisabledException;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.web.DefaultRedirectStrategy;
import org.springframework.security.web.RedirectStrategy;
import org.springframework.security.web.authentication.SimpleUrlAuthenticationFailureHandler;
import org.springframework.stereotype.Component;

import com.icia.dal.dao.DalinDao;
import com.icia.dal.dao.JejaDao;
import com.icia.dal.entity.Dalin;
import com.icia.dal.entity.Jeja;



@Component("DalinloginFailureHandler")
public class DalinLoginFailureHandler extends SimpleUrlAuthenticationFailureHandler {
	
	@Inject
	private DalinDao dalDao;
	
	private RedirectStrategy rs = new DefaultRedirectStrategy();
	
	@Override
	public void onAuthenticationFailure(HttpServletRequest request, HttpServletResponse response,
			AuthenticationException exception) throws IOException, ServletException {
		String DalinId = request.getParameter("dEmail");
		HttpSession session = request.getSession();
	
		if(exception instanceof BadCredentialsException) {
			Dalin dalin = dalDao.findByDalin(DalinId);
			if(dalin==null) {
				session.setAttribute("msg", "아이디를 찾을 수 없습니다");
			}else {
				int loginFailureCnt = dalin.getDLoginFailureCnt()+1;
				if(loginFailureCnt<5) {
					dalDao.updateToDalin(Dalin.builder().dEmail(DalinId).dLoginFailureCnt(1).build());
					session.setAttribute("msg", loginFailureCnt + "회 로그인에 실패했습니다");
				} else {
					dalDao.updateToDalin(Dalin.builder().dEmail(DalinId).dLoginFailureCnt(1).enabled(false).build());
					session.setAttribute("msg", "로그인에 5회 실패해 계정이 블록되었습니다 비밀번호 찾기를통해 임시비밀번호를 찾아주세요");
				}				
			}
		} else if(exception instanceof DisabledException) {
			session.setAttribute("msg", "정지된 계정입니다. 관리자에게 문의하세요");
		}
		rs.sendRedirect(request, response, "/member/login");
	}
}

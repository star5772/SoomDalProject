package com.icia.dal.util.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.icia.dal.Exception.JobFailException;


public class AuthenticationInterceptor extends HandlerInterceptorAdapter {
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		if(auth.getPrincipal().toString().equals("anonymousUser")==false)
			throw new JobFailException("로그인한 사용자는 접근할 수 없습니다");
		return super.preHandle(request, response, handler);
	}
	

}

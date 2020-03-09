package com.kh.petmily.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class MemberInterceptor extends HandlerInterceptorAdapter {
	
	// 컨트롤러보다 먼저 수행되는 메서드 : 로그인 하지않고 로그인 서비스를 받을시
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("id");
		if(id != null) {
			return true;		
		}else {
			response.sendRedirect(request.getContextPath()+"/member/login");
			return false;
		}	
	}
}

package com.kh.petmily.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class AdminInterceptor  extends HandlerInterceptorAdapter{
	
	// 컨트롤러보다 먼저 수행되는 메서드 : 관리자 페이지 접속권한
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		HttpSession session = request.getSession();
		String grade = (String) session.getAttribute("grade");
		if(grade.equals("admin")) {
			return true;		
		}else {
			response.sendError(403);
			return false;			
		}		
	}

	
}

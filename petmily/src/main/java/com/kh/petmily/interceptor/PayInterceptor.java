package com.kh.petmily.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.kh.petmily.service.kakao.PayService;

public class PayInterceptor extends HandlerInterceptorAdapter {

	@Autowired
	private PayService payService;
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {		
		String id = request.getParameter("id");
		int reservation_no = Integer.parseInt(request.getParameter("reservation_no"));
		String reservation_id = payService.getReservation_id(reservation_no);		
		if(id.equals(reservation_id)) {
			return true;
		} else {
			response.sendError(403);
			return false;
		}
		
	

	}
}

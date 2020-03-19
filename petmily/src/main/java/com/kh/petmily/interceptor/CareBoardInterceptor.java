package com.kh.petmily.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.kh.petmily.service.board.CareService;
import com.kh.petmily.vo.QnaVO;

public class CareBoardInterceptor extends HandlerInterceptorAdapter {

	@Autowired
	private CareService careService;
	
	@Override
	public boolean preHandle(
			HttpServletRequest request,
			HttpServletResponse response,
			Object handler
			)throws Exception{
		
		int care_board_no = Integer.parseInt(request.getParameter("care_board_no"));			
		String writer = careService.get_writer(care_board_no);	
		String petsitter = careService.get_petsitter(care_board_no);
		
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("id");
		
		String grade = (String) session.getAttribute("grade");	
		
		if(id == null) { 
			response.sendRedirect(request.getContextPath()+"/member/login");
			return false;
		}
		else if(id.equals(writer) || grade.equals("admin")|| id.equals(petsitter)  ) {
			return true;		
		}
		else {
			response.sendError(403);
			return false;
		}	
	
	}

}


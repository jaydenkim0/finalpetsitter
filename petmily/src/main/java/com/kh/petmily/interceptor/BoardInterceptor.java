 package com.kh.petmily.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.kh.petmily.service.board.QnaService;
import com.kh.petmily.vo.QnaVO;

public class BoardInterceptor extends HandlerInterceptorAdapter {
	
	@Autowired
	private QnaService qnaService;
	@Override
	// 컨트롤러보다 먼저 수행되는 메서드 : 문의합니다 의 신고게시판 작성자와 관리자만 볼 수 있도록
	public boolean preHandle(HttpServletRequest request, 
											   HttpServletResponse response, 
											   Object handler
											   )throws Exception {
		// 신고합니다 머리글만 인터셉터해서 검사		
		// 파라미터로 전달된 Qna_no 로 작성자와 맞는지 확인
		int qna_no = Integer.parseInt(request.getParameter("qna_no"));			
		QnaVO qnaVO = qnaService.read(qna_no);		
		// 문의게시판 타이블 확인
		String qna_title = qnaVO.getQna_title();				
		if(qna_title.equals("신고합니다")) { //신고합니다 게시물이면 아래 조건 실행
			// 로그인한 id
			HttpSession session = request.getSession();
			String id = (String) session.getAttribute("id");
			// 관리자가 맞는지 확인
			String grade = (String) session.getAttribute("grade");			
			// 로그인한 사람이 작성자이거나, 관리자만 true 
			if(id == null) { 
				response.sendRedirect(request.getContextPath()+"/member/login");
				return false;
			}else if(id.equals(qnaVO.getQna_writer()) || grade.equals("admin")  ) {
				return true;		
			}else {
				response.sendError(403);
				return false;
			}	
		}else { // 신고합니다 게시물이 아니면 모두 들어갈 수 있음
			return true;		
		}
	}
	

}

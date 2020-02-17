package com.kh.petmily.service;

import javax.mail.MessagingException;

public interface AdminEmailService {

	// 펫시터 승인 반려 이메일 전송
	String sendCancel(String email, String sitter_id);

	// 회원 및 펫시터 경고시 이메일 전송
	String blackListAddEmail(String id, String email, String grade, String black_content);

	// 회원 -> 펫시터 견적 신청시 발송되는 이메일 
	public String estimateEMail(String id, String email, int sitter_no) throws MessagingException;
			// 회원에게 견적요청이 완료되었다고 발송되는 이메일 (이메일 발송시)
			void estimateEMailGo(String id, String email, String result);		

	
	
	
	
	
	
	// 펫시터가 견적(승인, 취소)응답을 발송되는 이메일
	
	// 펫시터가 승인하게되면 회원이 결제할때 발송되는 이메일


}

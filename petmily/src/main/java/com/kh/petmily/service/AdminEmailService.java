package com.kh.petmily.service;

import java.util.List;

import javax.mail.MessagingException;

import com.kh.petmily.entity.PayinfoDto;

public interface AdminEmailService {

	
	// 펫시터 승인 반려 이메일 전송
	String sendCancel(String email, String sitter_id);

	
	// 회원 및 펫시터 경고시 이메일 전송
	String blackListAddEmail(String id, String email, String grade, String black_content);

	
	// 회원 -> 펫시터 견적 신청시 발송되는 이메일 
	String estimateEMail(String id, String sitteremail, int sitter_no,int reservation_no) throws MessagingException;
			
	
	// 펫시터 -> 회원에게 견정 승인시 발송되는 이메일
	String PaymentReqEMail(String id, String memberemail, int sitter_no,  int reservation_no) throws MessagingException;		
	// 펫시터가 견적을 거부하면 반려사유와 함께 취소이메일 전달
	String NoestimateEMail(String id, String memberemail, String content, String sitter_id);
	
	
	// 결제가 완료되면 회원과 펫시터에게 결제 완료 이메일 전달
	String paymentApplyEMail(String id, String memberemail,
	        int total_amount, String sitter_id, String sitteremail, List<PayinfoDto> list);
	
	
	


}

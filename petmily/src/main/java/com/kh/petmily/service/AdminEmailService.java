package com.kh.petmily.service;

public interface AdminEmailService {

	// 펫시터 승인 반려 이메일 전송
	String sendCancel(String email, String sitter_id);

	String memberdeleteemail(String id, String email, String grade);

}

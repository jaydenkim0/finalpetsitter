package com.kh.petmily.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

@Service
public class AdminEmailServiceImpl implements AdminEmailService{

	@Autowired
	private JavaMailSender sender;	
	
	// 펫시터 승인 반려 이메일 전송
	@Override
	public String  sendCancel(String email) {
		try {
			
			// 메세지 객체 생성
			SimpleMailMessage message = new SimpleMailMessage ();
			// 정보설정 : 대상정보(email, 제목, 내용)
			String[] to = {email};
			message.setTo(to);		
			message.setSubject("[PetMily] 펫시터 신청관련하여 내용 전달드립니다");		
			message.setText("반려사유 공지내용 입니다."
					+ "\n 신분증, 자격증 관련자료 미제출,"
					+ "\n 인터뷰 전화 미응답, "
					+ "\n 자격 불충분 등 "
					+ "\n 위와 같은 내용과 자료가 충족되지 않은 관계로"
					+ "\n 펫시터 승인이 반려되었습니다."
					+ "\n 추가적인 내용이 필요하신 회원님께서는 관리자 및 "
					+ "\n 상담센터로 연락주시면 감사하겠습니다.");
			
			sender.send(message);
			return "success";
		}catch (Exception ex) {
			ex.printStackTrace();
			return "fail";
		}
		
	}

}

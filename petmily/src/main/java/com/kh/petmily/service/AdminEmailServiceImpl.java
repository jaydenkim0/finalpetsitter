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
	public String  sendCancel(String email, String sitter_id) {
		try {
			
			// 메세지 객체 생성
			SimpleMailMessage message = new SimpleMailMessage ();
			// 정보설정 : 대상정보(email, 제목, 내용)
			String[] to = {email};
			message.setTo(to);		
			message.setSubject("[PetMily] 펫시터 신청관련하여 내용 전달드립니다");		
			message.setText(
					" 안녕하세요 "+ sitter_id +" 님, 펫밀리 신청해주신 것에 감사드립니다."
					+ "\n 다음과 같은 사유로 인해 펫시터의 신청이 반려되었음을 알려드립니다"
					+ "\n"
					+ "\n - 신분증, 자격증 관련자료 미제출,"
					+ "\n - 인터뷰 전화 미응답, "
					+ "\n - 자격 불충분 등 "
					+ "\n"
					+ "\n 위와 같은 내용과 자료가 충족되지 않은 관계로"
					+ "\n 펫시터 승인이 반려되었습니다."
					+ "\n"
					+ "\n 추가적인 내용이 필요하신 회원님께서는 관리자 및 "
					+ "\n 상담센터로 연락주시면 감사하겠습니다.");			
			sender.send(message);
			return "success";
		}catch (Exception ex) {
			ex.printStackTrace();
			return "fail";
		}
		
	}
	
	// 회원 탈퇴시 이메일 전송
	@Override
	public String memberdeleteemail(String id, String email, String grade) {

		try {
				if (grade.equals("petsitter") ) { // 펫시터라면
					// 메세지 객체 생성
					SimpleMailMessage message = new SimpleMailMessage ();
					// 정보설정 : 대상정보(email, 제목, 내용)
					String[] to = {email};
					message.setTo(to);		
					message.setSubject("[PetMily] 펫시터 권한 해지 내용 전달드립니다");		
					message.setText(
							" 안녕하세요 "+ id +" 펫시터님"
							+ "\n 다음과 같은 사유로 인해 펫시터의 권한이 해지되었음을 알려드립니다"
							+ "\n"
							+ "\n - 펫시터 약관 위반 사항이 있을 시,"
							+ "\n - 회원의 재물손괴죄를 입혔을 시, "
							+ "\n - 펫시터 경고 3회 이상이 있을 시 등등 "
							+ "\n"
							+ "\n 위와 같은 내용과 자료가 충족되지 않은 관계로"
							+ "\n 펫시터 권한이 해지되었습니다."
							+ "\n"
							+ "\n 추가적인 내용이 필요하신 회원님께서는 관리자 및 "
							+ "\n 상담센터로 연락주시면 감사하겠습니다.");			
					sender.send(message);
					return "success";
				}else { // 멤버라면
					// 메세지 객체 생성
					SimpleMailMessage message = new SimpleMailMessage ();
					// 정보설정 : 대상정보(email, 제목, 내용)
					String[] to = {email};
					message.setTo(to);		
					message.setSubject("[PetMily] 회원 강제 탈퇴 내용 전달드립니다");		
					message.setText(
							" 안녕하세요 "+ id +" 회원 님, "
							+ "\n 다음과 같은 사유로 인해 펫시터 회원이 강제 탈퇴 되었음을 알려드립니다"
							+ "\n"
							+ "\n - 펫밀리 회원 약관 위반 사항이 있을 시,"
							+ "\n - 펫밀리 또는 펫시터 직원에게 폭언 및 폭력을 행사했을 시, "
							+ "\n - 풍기 물란 및 그와 유사한 범죄 등등 "
							+ "\n"
							+ "\n 위와 같은 내용과 자료가 충족되지 않은 관계로"
							+ "\n 회원의 강제 탈퇴가 되었습니다."
							+ "\n"
							+ "\n 추가적인 내용이 필요하신 회원님께서는 관리자 및 "
							+ "\n 상담센터로 연락주시면 감사하겠습니다.");			
					sender.send(message);
					return "success";
				}
			
		}catch (Exception ex) {
				ex.printStackTrace();
				return "fail";
		}
	}


}

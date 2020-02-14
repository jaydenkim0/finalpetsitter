package com.kh.petmily.service;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.servlet.support.ServletUriComponentsBuilder;

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
	
	// 펫시터 신고시 이메일 발생
	@Override
	public String blackListAddEmail(String id, String email, String grade, String black_content) {
		try {	
					// 권한 등급
					String gradename;
					if(grade.equals("member")) {
						gradename = "회원";
					}else{
						gradename = "펫시터";
					}					
					// 메세지 객체 생성
					SimpleMailMessage message = new SimpleMailMessage ();
					// 정보설정 : 대상정보(email, 제목, 내용)
					String[] to = {email};
					message.setTo(to);		
					message.setSubject("[PetMily] 신고내용이 접수되어 전달드립니다");		
					message.setText(
							" 안녕하세요 "+ id +" " + gradename +" 님"
							+ "\n 다음과 같은 내용으로 신고가 접수 되었습니다 "
							+ "\n"
							+ "\n - 경고 사유 :  "
							+ "\n " + black_content
							+ "\n "
							+ "\n 경고 3회가 넘을 경우 회원은 예약이 불가하며,"
							+ "\n 펫시터의 경우 권한이 고지 없이 해지될 수 있음을 알려드립니다"
							+ "\n "
							+ "\n 사실과 다른 내용이 기재되어있다면, "
							+ "\n 상담센터로 연락주시면 감사하겠습니다.");			
					sender.send(message);
					return "success";			
			}catch (Exception ex) {
					ex.printStackTrace();
					return "fail";
			}
	}

	
	//////////////////////////////////////////////////////////////////////////////////////////
	// step1 회원이 펫시터에게 예약에 대한 견적요청을 진행 
	// (String id, String email, int sitter_no, String result)
	//////////////////////////////////////////////////////////////////////////////////////////
	
	
	// step1-1 회원이 펫시터에게 견정요청이 되면 펫시터에게 전송되는 이메일
	@Transactional 
	@Override
	public String estimateEMail(String id, String email, int sitter_no) throws MessagingException {			
		try {
					MimeMessage message = sender.createMimeMessage();	
					MimeMessageHelper helper = new MimeMessageHelper(message, true, "UTF-8");				
	
					String[] to = {email};
					helper.setTo(to);					
					helper.setSubject("[PetMily} "+ id + " 회원님이 견적신청을 요청었습니다");					
				
					String url = ServletUriComponentsBuilder
											.fromCurrentContextPath()
											.port(8080)
											.path("/petsitter/estimate")
											.queryParam("id", id)
											.queryParam("sitter_in", sitter_no)
											.toUriString();					
					
					StringBuffer buffer = new StringBuffer();
					buffer.append("<h1> 견적요청의 내용을 보시려면 견적요청 확인을 클릭해주세요  <h1>");
					buffer.append("<h2>");
					buffer.append("<a href='");
					buffer.append(url);
					buffer.append("'>");
					buffer.append("견적요청확인");
					buffer.append("</a>");
					buffer.append("</h2>");			
	
					helper.setText(buffer.toString(), true);								

					sender.send(message);					
					return "success";		
			}catch(Exception e) {				
					e.printStackTrace();
					return "fail";		
			}				
	}
	
	// step1-2 견적요청이 발송되면 같이 회원에게 견적요청이 되었다고 발송되는 이메일 
	@Override
	public void estimateEMailGo(String id, String email, String result) {			
		if(result.equals("success")) {		
					SimpleMailMessage message = new SimpleMailMessage ();				
					String[] to = {email};
					message.setTo(to);		
					message.setSubject("[PetMily] 견적요청이 성공적으로  전달 되었습니다");		
					message.setText(
							" 항상 PetMily를 이용해주셔서 감사합니다.  "+ id +" 회원 님"				
							+ "\n "
							+ "\n 요청하신 견적서가 펫시터에게 정상적으로 전달되었습니다"					
							+ "\n 펫시터가 확인 후 바로 이메일로 확인내용이 전달되니,"
							+ "\n 확인 부탁드립니다."		
							+ "\n "
							+ "\n 24시간 이내에 확인 메일이 발송이 안되면 "
							+ "\n 상담센터로 연락주시면 확인해드리겠습니다.");			
					sender.send(message);
		}else{						
					SimpleMailMessage message = new SimpleMailMessage ();		
					String[] to = {email};
					message.setTo(to);		
					message.setSubject("[PetMily] 견적요청이 통신이상으로 발송되지 않았습니다");		
					message.setText(
							" 항상 PetMily를 이용해주셔서 감사합니다.  "+ id +" 회원 님"
							+ "\n "
							+ "\n 통신장애 및 이메일 서버 지연으로 인해 "
							+ "\n 해당 펫시터에게 견적요청이 중단되었습니다"						
							+ "\n 5분 후에 견적요청을 다시 해주시면 감사하겠습니다"
							+ "\n "					
							+ "\n 지속적인 장애가 발생될 경우에는,  "
							+ "\n 상담센터로 연락주시면 감사하겠습니다.");			
					sender.send(message);
			}
		
		}

	
	
	//////////////////////////////////////////////////////////////////////////////////////////
	// step2 펫시터가 견적요청을 확인하고 답변을 회원에게 보냄
	//////////////////////////////////////////////////////////////////////////////////////////
	
	
	
	
	
	
	// step2-1 견적서가 승인이 되면 회원이 결제를 진행

	
	
	
	
	// step2-2 펫시터가 견적을 거부하면 반려사유와 함께 취소이메일 전달
	
	
	
	
	
	
	
	
	
	//////////////////////////////////////////////////////////////////////////////////////////
	// step3 결제가 완료되면 회원과 펫시터에게 결제완료 이메일 전달
	//////////////////////////////////////////////////////////////////////////////////////////

	
	
	
	
	
}

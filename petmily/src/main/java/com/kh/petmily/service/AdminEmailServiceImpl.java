package com.kh.petmily.service;

import java.util.List;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.servlet.support.ServletUriComponentsBuilder;

import com.kh.petmily.entity.PayinfoDto;

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
	// 회원 -> 펫시터 (펫시터 이메일로 전송)
	//////////////////////////////////////////////////////////////////////////////////////////	
	@Transactional 
	@Override
	public String estimateEMail(String id, String sitteremail, int sitter_no) throws MessagingException {			
		try {
					MimeMessage message = sender.createMimeMessage();	
					MimeMessageHelper helper = new MimeMessageHelper(message, true, "UTF-8");				
	
					String[] to = {sitteremail};
					helper.setTo(to);					
					helper.setSubject("[PetMily} "+ id + " 회원님이 견적신청을 요청었습니다");					
				
					String url = ServletUriComponentsBuilder
											.fromCurrentContextPath()
											.port(8080)
											.path("/petsitter/estimate")
											.queryParam("id", id)
											.queryParam("sitter_no", sitter_no)
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

	
	
	//////////////////////////////////////////////////////////////////////////////////////////
	// step2 펫시터가 견적요청을 확인하고 답변을 회원에게 보냄
	// 회원에게 결제페이지 전송
	// 펫시터 -> 회원 (회원 이메일로 전송)
	//////////////////////////////////////////////////////////////////////////////////////////	
	@Transactional 
	@Override
	public String PaymentReqEMail(String id, String memberemail, int sitter_no) throws MessagingException {			
		try {
					MimeMessage message = sender.createMimeMessage();	
					MimeMessageHelper helper = new MimeMessageHelper(message, true, "UTF-8");				
	
					String[] to = {memberemail};
					helper.setTo(to);					
					helper.setSubject("[PetMily} "+ id + " 회원님 서비스 신청이 완료되었습니다");					
				
					String url = ServletUriComponentsBuilder
											.fromCurrentContextPath()
											.port(8080)
											.path("/petsitter/pament")
											.queryParam("id", id)
											.queryParam("sitter_no", sitter_no)
											.toUriString();					
					
					StringBuffer buffer = new StringBuffer();
					buffer.append("<h1> 서비스에 대한 결제를 진행하시려면 결제하기를 클릭해주세요  <h1>");
					buffer.append("<h2>");
					buffer.append("<a href='");
					buffer.append(url);
					buffer.append("'>");
					buffer.append("서비스 결제하기");
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
	
	
	// step2-2 펫시터가 견적을 거부하면 반려사유와 함께 취소이메일 전달
	public String NoestimateEMail(String id, String memberemail, String content) {
		try {	
							
					// 메세지 객체 생성
					SimpleMailMessage message = new SimpleMailMessage ();
					// 정보설정 : 대상정보(email, 제목, 내용)
					String[] to = {memberemail};
					message.setTo(to);		
					message.setSubject("[PetMily] 신고내용이 접수되어 전달드립니다");		
					message.setText(
							" 안녕하세요 "+ id +" 회원님"
							+ "\n 언제나 펫밀리와 함께 해주셔서 감사합니다"
							+ "\n 신청하신 서비스는 아래와 같은 내용으로 반려가 되었습니다 "
							+ "\n"
							+ "\n - 반려 사유 :  "
							+ "\n " + content
							+ "\n "
							+ "\n 좀더 좋은 반려동물의 돌봄을 위해 노력하겠습니다"
							+ "\n "
							+ "\n 자세한 내용을 원하시는 회원님께서는 "
							+ "\n 상담센터로 연락주시면 감사하겠습니다.");			
					sender.send(message);
					return "success";			
			}catch (Exception ex) {
					ex.printStackTrace();
					return "fail";
			}
	}
	
	
	
	
	//////////////////////////////////////////////////////////////////////////////////////////
	// step3 결제가 완료되면 회원과 펫시터에게 결제완료 이메일 전달
	//////////////////////////////////////////////////////////////////////////////////////////	
	public String paymentApplyEMail(String id, 
													        String email,
													        int total_amount,
													        String sitter_id, 
													        String sitteremail,
													        List<PayinfoDto> list) {
		try {								
					// 회원 메세지 객체 생성
					SimpleMailMessage membermessage = new SimpleMailMessage ();
					// 정보설정 : 대상정보(email, 제목, 내용)
					String[] to = {email};
					membermessage.setTo(to);		
					membermessage.setSubject("[PetMily] "+id+" 님 신청하신 서비스 결제가 완료되었습니다");		
					membermessage.setText(
							" 안녕하세요 "+ id +" 회원님"
							+ "\n 언제나 펫밀리와 함께 해주셔서 감사합니다"
							+ "\n 신청하신 서비스 결제가 완료되었습니다 "
							+ "\n "		
							+ "\n 신청해주신 서비스 금액은 "+ total_amount + " 원 입니다"
							+ "\n "		
							+ "\n 좀더 좋은 반려동물의 돌봄을 위해 노력하겠습니다"		
							+ "\n "
							+ "\n 문의가 있으신 경우는 문의 게시판을 이용해주시거나 "
							+ "\n 상담센터로 연락주시면 감사하겠습니다.");			
					sender.send(membermessage);
					
					// 펫시터 메세지 객체 생성 
					SimpleMailMessage sittermessage = new SimpleMailMessage();
					String[] tositter= {sitteremail};
					sittermessage.setTo(tositter);
					sittermessage.setSubject("[PetMily] "+ sitter_id +" 펫시터님 예약이 완료되었습니다 " );
					
					StringBuffer buffer = new StringBuffer();				
					
					buffer.append(" 안녕하세요  "+ sitter_id +" 펫시터님");
					buffer.append("\n 언제나 펫밀리와 함께 해주셔서 감사합니다");
					buffer.append("\n 견적 승인하신 서비스 결제가 완료되었습니다 ");
					buffer.append("\n ");
					buffer.append("\n "+ id +" 회원님이 요청한 서비스 내역은 아래와 같습니다");					
						for(PayinfoDto service : list) {
							buffer.append(service.getPayment());
						}					
					buffer.append("\n ");
					buffer.append("\n 신청한 이용시간은 "+list.get(0).getUsage_time()+"");
					buffer.append("\n ");
					buffer.append("\n ");
					buffer.append("\n 문의가 있으신 경우는 문의 게시판을 이용해주시거나 ");
					buffer.append("\n 상담센터로 연락주시면 감사하겠습니다.");							
					
					membermessage.setText(buffer.toString());
						
					sender.send(sittermessage);
					
					return "success";			
			}catch (Exception ex) {
					ex.printStackTrace();
					return "fail";
			}
	}


	
	
	
	
}

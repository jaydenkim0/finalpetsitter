package com.kh.petmily.controller.pay;

import java.net.URISyntaxException;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.petmily.entity.PayinfoDto;
import com.kh.petmily.entity.ReservationDto;
import com.kh.petmily.repository.kakao.PayDao;
import com.kh.petmily.service.AdminEmailService;
import com.kh.petmily.service.AdminService;
import com.kh.petmily.service.kakao.PayService;
import com.kh.petmily.service.petsitter.PetsitterService;
import com.kh.petmily.vo.AccountVO;
import com.kh.petmily.vo.MemberVO;
import com.kh.petmily.vo.kakao.KakaoPayReadyVO;
import com.kh.petmily.vo.kakao.KakaoPayRevokeReturnVO;
import com.kh.petmily.vo.kakao.KakaoPaySuccessReadyVO;
import com.kh.petmily.vo.kakao.KakaoPaySuccessReturnVO;
import com.kh.petmily.vo.kakao.PayReadyReturnVO;
import com.kh.petmily.vo.petsitter.PetsitterVO;
import com.kh.petmily.vo.petsitter.ReservationAllVO;
import com.kh.petmily.vo.petsitter.ReservationListVO;

import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/pay")
@Slf4j
public class PayController {
	
	@Autowired
	private PayService payService;

	@Autowired
	private PayDao payDao;
	
	@Autowired
	private PetsitterService petsitterService;	
	
	@Autowired
	private AdminService adminService;
	
	@Autowired
	public AdminEmailService aemailService;

	
	@GetMapping("/account")
	public String account(@RequestParam int reservation_no,
			Model model) {
		   ReservationListVO reservationList = petsitterService.getReservation(reservation_no);
		      //최종 결제 금액 구하기
		      int payMent = 0;
		   
		         List<ReservationAllVO> all = reservationList.getList();
		         int totalTime = all.get(0).getUsage_time();
		         int startTime = all.get(0).getStart_time();
		         
		         for(ReservationAllVO allVO : all) {
		            int usagetime = allVO.getUsage_time();
		            
		            int oneHour = usagetime * 10000;
		            int payment = allVO.getPayment();
		            
		            payMent = oneHour + payment;         
		         }
		      
		      model.addAttribute("reservationList", reservationList)
		         .addAttribute("payMent", payMent)
		         .addAttribute("usageTime", totalTime)
		      .addAttribute("startTime", startTime);
			return "pay/account";
	}
	
	@PostMapping("/account")
	public String account(@ModelAttribute KakaoPayReadyVO kpayReadyVO, HttpSession session) throws URISyntaxException {
		PayReadyReturnVO result = payService.ready(kpayReadyVO);
		//DB에 필요한 내역을 저장하는 절차
		//success에서 쓸 수 있도록 값을 전달
		session.setAttribute("tid", result.getTid()); // trade id 정보 제공
		session.setAttribute("ready", kpayReadyVO); // 결제 요청 정보
		return"redirect: "+result.getNext_redirect_pc_url();
	}
	//성공 , 실패 , 취소 페이지 구현
	@GetMapping("/success")
	public String success(@RequestParam String pg_token, HttpSession session,Model model) throws URISyntaxException {
		//session에서 전달된 값을 꺼내고 session 값 삭제
		String tid = (String)session.getAttribute("tid");
		KakaoPayReadyVO kpayReadyVO = 
				(KakaoPayReadyVO)session.getAttribute("ready");
		session.removeAttribute("tid");
		session.removeAttribute("ready");
		log.info("tid={}",tid);
		log.info("vo={}",kpayReadyVO);		
		log.info("pg_token={}",pg_token);
		
		//PayService를 이용하여 결제 승인 처리를 수행
		//KakaoPaySuccessReadyVO 형태의 매개변수가 필요
		//KaKaoPaySuccessReturnVo 형태의 반환값 저장이 필요
		KakaoPaySuccessReadyVO data = 
				KakaoPaySuccessReadyVO.builder()
				.cid("TC0ONETIME")
				.tid(tid)
				.partner_order_id(kpayReadyVO.getPartner_order_id())
				.partner_user_id(kpayReadyVO.getPartner_user_id())
				.pg_token(pg_token)
				.build();
		KakaoPaySuccessReturnVO result = payService.approve(data);		
		// 결제 이메일 발송지점??
		model.addAttribute("result",result);
		
		// 1. 결제 이메일 보내기위한 파라미터 준비
		String id = kpayReadyVO.getPartner_user_id();// 회원 아이디 
		MemberVO member = adminService.getMemberdetail(id);		
		String email = member.getEmail(); // 회원 이메일
		int total_amount = kpayReadyVO.getTotal_amount(); // 결제 금액
		
		int reservation_no =  Integer.parseInt(kpayReadyVO.getPartner_order_id()); // 예약번호
		AccountVO reservation = adminService.reservationstatusdetail(reservation_no);
		int pet_sitter_no =  reservation.getReservation_sitter_no();		
		PetsitterVO petsitter = adminService.petsitterdetail(pet_sitter_no);
		String sitter_id = petsitter.getSitter_id(); // 펫시터 아이디
		String sitter_email = petsitter.getEmail(); // 펫시터 이메일
		
		model.addAttribute("id",id)
				  .addAttribute("email", email)
				  .addAttribute("total_amount", total_amount)
				  .addAttribute("sitter_id", sitter_id)
				  .addAttribute("sitter_email", sitter_email)
				  .addAttribute("reservation_no", reservation_no);//펫시터에게 보여줄 결제 정보		
		return "pay/success";
	}
	
	@PostMapping("/paysuccessSendEmail")
	public void paysuccessSendEmail(@RequestParam String id, 
			@RequestParam String email,
			@RequestParam int total_amount, 
			@RequestParam  String sitter_id, 
			@RequestParam  String sitter_email, 
			@RequestParam int reservation_no) {
		System.out.println("잘 들어왔나? = "+id);
		System.out.println(email);
		System.out.println(total_amount);
		System.out.println(sitter_id);
		System.out.println(sitter_email);	
		System.out.println("reservation_no = "+reservation_no);
		 List<PayinfoDto> list = adminService.payinfoName(reservation_no);
		aemailService.paymentApplymemberEMail(id, email, total_amount);
		aemailService.paymentApplypetsitterEMail(id, sitter_id, sitter_email, list);
	}
	
	
	@GetMapping("/list")
	public String list(Model model) {
		model.addAttribute("list",payDao.getList());
		return "pay/list";
	}
	
	//결제 후 취소
	@GetMapping("/revoke")
	public String revoke(@RequestParam int pay_no) throws URISyntaxException {
		KakaoPayRevokeReturnVO kpayRevokeReturnVO = payService.revoke(pay_no);
		return "redirect:list";
	}
	

	
}

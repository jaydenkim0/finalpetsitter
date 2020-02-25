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

import com.kh.petmily.repository.kakao.PayDao;
import com.kh.petmily.service.kakao.PayService;
import com.kh.petmily.service.petsitter.PetsitterService;
import com.kh.petmily.vo.kakao.KakaoPayReadyVO;
import com.kh.petmily.vo.kakao.KakaoPayRevokeReturnVO;
import com.kh.petmily.vo.kakao.KakaoPaySuccessReadyVO;
import com.kh.petmily.vo.kakao.KakaoPaySuccessReturnVO;
import com.kh.petmily.vo.kakao.PayReadyReturnVO;
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
		model.addAttribute("result",result);
		return "pay/success";
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

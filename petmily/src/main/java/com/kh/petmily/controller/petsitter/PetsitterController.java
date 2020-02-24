  
package com.kh.petmily.controller.petsitter;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.List;

import javax.mail.MessagingException;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.filefilter.FalseFileFilter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ByteArrayResource;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.petmily.entity.PetDto;
import com.kh.petmily.repository.petsitter.ReservationDao;


import com.kh.petmily.entity.ReviewDto;
import com.kh.petmily.service.AdminEmailService;
import com.kh.petmily.service.AdminService;
import com.kh.petmily.service.MemberService;
import com.kh.petmily.service.board.ReviewService;
import com.kh.petmily.service.petsitter.PetsitterService;
import com.kh.petmily.vo.MemberVO;
import com.kh.petmily.vo.NaviVO;
import com.kh.petmily.vo.petsitter.PetsitterGetListVO;
import com.kh.petmily.vo.petsitter.PetsitterRegistVO;
import com.kh.petmily.vo.petsitter.PetsitterVO;
import com.kh.petmily.vo.petsitter.ReservationAllVO;
import com.kh.petmily.vo.petsitter.ReservationListVO;
import com.kh.petmily.vo.petsitter.ReservationVO;
import com.kh.petmily.vo.petsitter.SitterlocationVO;

@Controller
@RequestMapping("/petsitter")
public class PetsitterController {
	
	//펫시터 서비스
	@Autowired
	private PetsitterService petsitterService;
	//관리자 이메일 서비스
	@Autowired
	private AdminEmailService aemailService;
	//관리자 서비스
	@Autowired
	private AdminService adminService;
	//나중에 수정할  것(펫시터 서비스)
	@Autowired
	private ReservationDao reservationDao;	
	@Autowired
	private MemberService memberService;
	@Autowired
	private ReviewService reviewService;

	

	//펫시터 가입 페이지
	@GetMapping("/regist")
	public String regist() {
		return "petsitter/regist";
	}
	
	@PostMapping("/regist")
	public String regist(@ModelAttribute PetsitterRegistVO vo) throws IllegalStateException, IOException{
		petsitterService.regist(vo);
		return "redirect:../";
	}
	
	//회원이미지 가져오기(src로 주소)
		@GetMapping("/member/image")
		public ResponseEntity<ByteArrayResource> member_image(
				@RequestParam int member_image_no) throws UnsupportedEncodingException,IOException{
			return memberService.member_image(member_image_no);
		}
		
		//펫이미지 가져오기(src로 주소)
		@GetMapping("/pet/image")
		public ResponseEntity<ByteArrayResource> pet_image(
				@RequestParam int pet_no) throws UnsupportedEncodingException,IOException {
			int pet_image_no = memberService.pet_image_no(pet_no);
			return memberService.pet_image(pet_image_no);
		}
	
	//펫시터 검색(조회) 페이지
	@RequestMapping("/list")
	public String list(@RequestParam(defaultValue="",  required = false) String cityKeyword,
						@RequestParam(defaultValue="", required = false) String areaKeyword,
						@RequestParam(defaultValue = "1", required = false) int curPage,
																                            Model model) {
		
		// 레코드의 갯수 계산
		int count = petsitterService.countlocation(cityKeyword, areaKeyword);
		
		// 페이지 나누기 관련 처리
		NaviVO navi = new NaviVO(count, curPage);
		
		int start = navi.getPageBegin();
		int end = navi.getPageEnd();
		
		//펫시터 정보
		List<SitterlocationVO> list = petsitterService.locationListAll(start, end, cityKeyword, areaKeyword);
		
		// 리스트 불러오기
		model.addAttribute("list", list)
				  .addAttribute("count", count)
				  .addAttribute("cityKeyword", cityKeyword)
				  .addAttribute("areaKeyword", areaKeyword)
				  .addAttribute("navi", navi);		
		return "petsitter/list";
	}
	
	//펫시터 (검색 후)상세 조회페이지
	@GetMapping("/content")
	public String content(@RequestParam int pet_sitter_no,
									Model model) throws Exception {
		
		List<ReviewDto>list = reviewService.listSearch(pet_sitter_no);
		double star = reviewService.star(pet_sitter_no);
		List<PetsitterGetListVO> petsitterList = petsitterService.getList(pet_sitter_no);
		model.addAttribute("petsitterList", petsitterList)
			.addAttribute("sitterInfoimageList", adminService.sitterInfoimageAll(pet_sitter_no));
		model.addAttribute("reviewstar",star);
		model.addAttribute("list",list);
		return "petsitter/content";
	}
	
	//회원 정보 페이지
	@GetMapping("/info")
	public String info(HttpSession session,Model model) {
		//세션의 아이디 가져오기
		String id = (String) session.getAttribute("id");
		//아이디로 펫시터 번호 조회
		int pet_sitter_no = petsitterService.idGet(id).getPet_sitter_no();
		//펫시터 번호로 펫시터 정보 조회
		List<PetsitterGetListVO> petsitterList = petsitterService.getList(pet_sitter_no);
		
		model.addAttribute("petsitterList", petsitterList)//펫시터 정보
			.addAttribute("pet_sitter_no", pet_sitter_no)//펫시터 번호
			.addAttribute("sitterInfoimageList", adminService.sitterInfoimageAll(pet_sitter_no));//펫시터 소개 이미지
		
		return "petsitter/info";
	}
	@PostMapping("/info")
	public String info(@RequestParam int pet_sitter_no, @RequestParam String sitter_status) {
		petsitterService.updateStatus(pet_sitter_no, sitter_status);
			return "redirect:info";
	}
	
	//펫시터 정보 수정 페이지
	@GetMapping("/update")
	public String update(@RequestParam int pet_sitter_no,Model model) {
		//펫시터 번호로 펫시터 정보 조회
		List<PetsitterGetListVO> petsitterList = petsitterService.getList(pet_sitter_no);
		
		model.addAttribute("petsitterList", petsitterList)//펫시터 정보
			.addAttribute("pet_sitter_no", pet_sitter_no)//펫시터 번호
			.addAttribute("sitterInfoimageList", adminService.sitterInfoimageAll(pet_sitter_no));//펫시터 소개 이미지
				
		return "petsitter/update";
	}
	@PostMapping("/update")
	public String update(@ModelAttribute PetsitterRegistVO vo) throws IllegalStateException, IOException {
		petsitterService.update(vo);
		return "redirect:info";
	}
	
	//견적 요청 페이지
	@GetMapping("/estimate")
	public String estimate(@RequestParam int pet_sitter_no, 
							HttpSession session,
							Model model) {		
		String id = (String) session.getAttribute("id");
		
		List<PetDto> petList = petsitterService.getPet(id);
		model.addAttribute("petList", petList)
				.addAttribute("reservation_sitter_no", pet_sitter_no);
		return "petsitter/estimate";
	}
	
	@PostMapping("/estimate")
	@ResponseBody()
	public String estimate(@ModelAttribute ReservationVO reservationVO) throws MessagingException {
		//petsitterVO에서 펫시터 이메일 불러오기
		PetsitterVO petsitterVO = petsitterService.noGet(reservationVO.getReservation_sitter_no());
		
		// 이메일 보내기
		String id = reservationVO.getMember_id();
		String sitteremail = petsitterVO.getEmail();
		int sitter_no = reservationVO.getReservation_sitter_no();
		int reservation_no = petsitterService.getSequenceReservation();
		
		String result = aemailService.estimateEMail(id, sitteremail, sitter_no, reservation_no);
		
		petsitterService.reservation(reservation_no, reservationVO);
		return result;
	}
	
	//예약(견적)확인 페이지
	@GetMapping("/confirm")
	public String confirm(@RequestParam int reservation_no,
							Model model) {
		//회원아이디 -펫시터 아이디
		List<ReservationListVO> reservationList = petsitterService.getReservation(reservation_no);		
		//최종 결제 금액 구하기
		int payMent = 0;
		int totalTime =0;
		String date = null;
		for(ReservationListVO vo : reservationList) {
			List<ReservationAllVO> all = vo.getList();
			totalTime = all.get(0).getUsage_time();
			
			for(ReservationAllVO allVO : all) {
				int usagetime = allVO.getUsage_time();
				int oneHour = usagetime * 10000;
				int payment = allVO.getPayment();
				payMent = oneHour + payment;			
			}
		}
		
		model.addAttribute("reservationList", reservationList)
			.addAttribute("payMent", payMent)
			.addAttribute("usageTime", totalTime);
		return "petsitter/confirm";
	}
	
	// 펫시터가 견적신청서를 확인하고 승인 및 반려를 하는 내용
	@PostMapping("/confirm")
	@ResponseBody
	public String confirm(@RequestParam String id, 									
									    @RequestParam(required = false) String content, 
									    @RequestParam int sitter_no,
									    @RequestParam String check,
									    @RequestParam int reservation_no
			) throws MessagingException {
		int pet_sitter_no = sitter_no; 
		PetsitterVO petsitterVO = adminService.petsitterdetail(pet_sitter_no);		
		String sitter_id = petsitterVO.getId();
		MemberVO memberVO = adminService.getMemberdetail(id);
		String memberemail = memberVO.getEmail();
		String result;
		if(check.equals("승인")) {	//승인(회원에게 결제 주소 전달)
				result = aemailService.PaymentReqEMail(id, memberemail, sitter_no, reservation_no);
				// 예약 상태 승인으로 변경
				petsitterService.reservationStatusUpdate(reservation_no);
		}else {	// 거절(content 포함해서 이메일 전송)
				result = aemailService.NoestimateEMail(id, memberemail, content, sitter_id);
				// 예약 내용 삭제
				petsitterService.reservationDelete(reservation_no);
		}
		return result;
	}
	
	
	//펫시터 예약 조회
	@GetMapping("/reservation")
	public String reservation(HttpSession session,Model model) {
		//세션의 아이디 가져오기
		String id = (String) session.getAttribute("id");
		//아이디로 펫시터 번호 조회
		int pet_sitter_no = petsitterService.idGet(id).getPet_sitter_no();
		
		//회원아이디 -펫시터 아이디
		List<ReservationListVO> reservationList = petsitterService.getreservationList(pet_sitter_no);	
		
		System.out.println("예약="+reservationList.toString());
		//최종 결제 금액 구하기
		int payMent = 0;
		int totalTime =0;
		for(ReservationListVO vo : reservationList) {
			List<ReservationAllVO> all = vo.getList();
			totalTime = all.get(0).getUsage_time();
			
			for(ReservationAllVO allVO : all) {
				int usagetime = allVO.getUsage_time();
				int oneHour = usagetime * 10000;
				int payment = allVO.getPayment();
				payMent = oneHour + payment;				
			}
		}
		
		model.addAttribute("reservationList", reservationList)
				.addAttribute("payMent", payMent)
				.addAttribute("usageTime", totalTime);
	
		return "petsitter/reservation";
	}
}
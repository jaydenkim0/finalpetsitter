package com.kh.petmily.controller.petsitter;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.List;

import javax.mail.MessagingException;
import javax.servlet.http.HttpSession;

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

import com.kh.petmily.entity.CareConditionNameDto;
import com.kh.petmily.entity.CarePetTypeNameDto;
import com.kh.petmily.entity.PayDto;
import com.kh.petmily.entity.PayinfoDto;
import com.kh.petmily.entity.PetDto;
import com.kh.petmily.entity.PetImageDto;
import com.kh.petmily.entity.ReviewDto;
import com.kh.petmily.entity.SkillNameDto;
import com.kh.petmily.service.AdminEmailService;
import com.kh.petmily.service.AdminService;
import com.kh.petmily.service.MemberService;
import com.kh.petmily.service.board.ReviewService;
import com.kh.petmily.service.kakao.PayService;
import com.kh.petmily.service.petsitter.PetsitterService;
import com.kh.petmily.vo.AccountVO;
import com.kh.petmily.vo.MemberVO;
import com.kh.petmily.vo.NaviVO;
import com.kh.petmily.vo.petsitter.PetsitterGetListVO;
import com.kh.petmily.vo.petsitter.PetsitterRegistVO;
import com.kh.petmily.vo.petsitter.PetsitterVO;
import com.kh.petmily.vo.petsitter.ReservationAllVO;
import com.kh.petmily.vo.petsitter.ReservationListVO;
import com.kh.petmily.vo.petsitter.ReservationVO;
import com.kh.petmily.vo.petsitter.SitterlocationVO;
import com.kh.petmily.vo.petsitter.SkillsVO;

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
	//회원 서비스
	@Autowired
	private MemberService memberService;
	//리뷰 서비스
	@Autowired
	private ReviewService reviewService;
	//결제 서비스
	@Autowired
	private PayService payService;

	

	//펫시터 가입 페이지
	@GetMapping("/regist")
	public String regist(Model model) {
		model.addAttribute("carepettype", (List<CarePetTypeNameDto>)petsitterService.getCarePetTypeList())
				  .addAttribute("skillname", (List<SkillNameDto>)petsitterService.getSkillNameList())
				  .addAttribute("careconname", (List<CareConditionNameDto>)petsitterService.getCareConditionName());	
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
		
		
	//펫시터 지역 검색(조회) 리스트 페이지
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
		model.addAttribute("list",(List<SitterlocationVO>)petsitterService.locationListAll(start, end, cityKeyword, areaKeyword));
		
		
		// 리스트 불러오기
		model.addAttribute("count", count)
				  .addAttribute("navi", navi);			
		model.addAttribute("city", cityKeyword)
				.addAttribute("area", areaKeyword);			  
		return "petsitter/list";
	}
	
	//펫시터 (검색 후)상세 조회페이지
	@GetMapping("/content")
	public String content(@RequestParam int pet_sitter_no,
							HttpSession session,
							Model model) throws Exception {
		// 세션에서 로그인한 아이디 가지고오기
		String id = (String) session.getAttribute("id");
		int count = petsitterService.petscheck(id);
		
		// 리뷰 리스트 갖고 오는 것
		List<ReviewDto>list = reviewService.listSearch(pet_sitter_no);
		
		System.out.println("펫시터 넘버가 나오는가 ? = "+list);
		
		double star = reviewService.star(pet_sitter_no);
		
		List<PetsitterGetListVO> petsitterList = petsitterService.getList(pet_sitter_no);
		
		model.addAttribute("petsitterList", petsitterList)
			.addAttribute("sitterInfoimageList", adminService.sitterInfoimageAll(pet_sitter_no))
			.addAttribute("reviewstar",star)
			.addAttribute("list",list)
			.addAttribute("petscheck",count);		
		
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
		
			System.out.println("petsitterList 확인 = "+petsitterList);
		
		model.addAttribute("petsitterList", petsitterList)//펫시터 정보
			.addAttribute("pet_sitter_no", pet_sitter_no)//펫시터 번호
			.addAttribute("sitterInfoimageList", adminService.sitterInfoimageAll(pet_sitter_no));//펫시터 소개 이미지
		model.addAttribute("black_petsitter_count", petsitterService.black_petsitter_count(id));
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
			.addAttribute("sitterInfoimageList", adminService.sitterInfoimageAll(pet_sitter_no))//펫시터 소개 이미지
			.addAttribute("carepettype", (List<CarePetTypeNameDto>)petsitterService.getCarePetTypeList())
			.addAttribute("skillname", (List<SkillNameDto>)petsitterService.getSkillNameList())
			.addAttribute("careconname", (List<CareConditionNameDto>)petsitterService.getCareConditionName());	
				
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
		List<PetsitterGetListVO> petsitterList = petsitterService.getList(pet_sitter_no);
		
		List<PayinfoDto> payInfoList = new ArrayList<>();
		List<PayinfoDto> matchingList = new ArrayList<>();
		for(PetsitterGetListVO vo : petsitterList) {
			
			List<PetsitterVO> plist = vo.getPetsitterVO();
			List<SkillsVO> slist = vo.getSkillsVO();
			
			//매칭종류 ->payinfo 번호 구해오기 시도...('둘다가 없어서..')
//			for(PetsitterVO pvo : plist) {
//				String matching_type = pvo.getSitter_matching_type();
//				matchingList.addAll(petsitterService.getPayList(matching_type));
//			}
			
			//펫시터가 가진 스킬 -> 예약 이용 스킬(payinfo) 
			for(SkillsVO svo : slist) {
				String skill_name = svo.getSkill_name();
				payInfoList.addAll(petsitterService.getPayList(skill_name));
			}
		}
		
		List<PetDto> petList = petsitterService.getPet(id);
		model.addAttribute("petList", petList)
				.addAttribute("reservation_sitter_no", pet_sitter_no)
				.addAttribute("petsitterList", petsitterList)
				.addAttribute("carepettype", (List<CarePetTypeNameDto>)petsitterService.getCarePetTypeList())
//				.addAttribute("skillname", (List<SkillNameDto>)petsitterService.getSkillNameList())
				.addAttribute("payInfoList", payInfoList);
		
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
		try {
//			//예약 정보  단일 조회
//			ReservationListVO reservationList = petsitterService.getReservation(reservation_no);			
//			//1시간 당 금액 구하기
//			int hourPayment = payService.getHourPayment();			
//			//거절시 결제금액 구하지 않고 진행 
//			//최종 결제 금액 구하기
//			int payMent = 0;
//				List<ReservationAllVO> all = reservationList.getList();
//				
//				int totalTime = all.get(0).getUsage_time();
//				int startTime = all.get(0).getStart_time();
//				
//				for(ReservationAllVO allVO : all) {
//					
//					int usagetime = allVO.getUsage_time();
//					
//					int oneHour = usagetime * hourPayment;
//					int payment = allVO.getPayment();
//					
//					payMent = oneHour + payment;			
//				}			
//			model.addAttribute("reservationList", reservationList)
//				.addAttribute("payMent", payMent)
//				.addAttribute("usageTime", totalTime)
//				.addAttribute("startTime", startTime);
////////////////////////////////////////////////////////////////////////
			// 결제에 대한 단일 정보 : accountVO
			AccountVO acountVO = adminService.reservationstatusdetail(reservation_no);		
			// 결제 가격이름정보 : payifoDto
			// 펫시터 이름 : petsitterVO
			int pet_sitter_no = acountVO.getReservation_sitter_no();
			PetsitterVO petsitter = adminService.petsitterdetail(pet_sitter_no);
			String sitter_id = petsitter.getSitter_id();		
			List<PayinfoDto> list =  adminService.payinfoName(reservation_no);
			model.addAttribute("reservationList", acountVO)  // 예약정보 및 총 금액				 
			 		  .addAttribute("payinfo", list)	// 금액	 이름, 서비스 이름	
			 		  .addAttribute("sitter_id", sitter_id);	// 펫시터 아이디	
			//	펫 정보 가지고 오기
			String member_id = acountVO.getMember_id();			
			// 회원이 펫 이미지정보 가지고 오기 PET_IMAGE_PET_NO
			List<PetDto> petinfo = adminService.getPetImge(member_id);		
			model.addAttribute("petinfo", petinfo); // 반려동물 정보 및 이미지정보
			// 결제금액 구하기
			//1시간 당 금액 구하기
			int hourPayment = adminService.hourPayment();
			//최종 결제 금액 구하기
			int totalTime = adminService.totalTime(reservation_no);
			int startTime = adminService.startTime(reservation_no);
			int lastTime = startTime + totalTime;			
			int payMent = hourPayment * totalTime;
				model.addAttribute("payMent", payMent) // 총 금액
				.addAttribute("usageTime", totalTime) // 사용시간
				.addAttribute("startTime", startTime) // 시작시간
				.addAttribute("lastTime", lastTime);	// 끝나는 시간	
			return "petsitter/confirm";
		}catch (Exception e){
			e.printStackTrace();	
			return "petsitter/confirm_cancel";
		}
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
		//펫시터 번호로 예약 정보 조회
		List<ReservationListVO> reservationList = petsitterService.getReservationSitter(pet_sitter_no);
		
		//시작시간,총 시간 가져오기
		int totalTime = 0;
		int startTime = 0;
		
		//예약 번호 가져오기
		int partner_order_id = 0;
		List<PayDto> payList = new ArrayList<>();
				
		for(ReservationListVO vo : reservationList) {
			partner_order_id = vo.getReservation_no();
			
			List<ReservationAllVO> all = vo.getList();			
			totalTime = all.get(0).getUsage_time();
			startTime = all.get(0).getStart_time();
			
			//예약 번호로 결제 정보 조회
			payList.addAll(payService.getPay(partner_order_id));					
		}		
		System.out.println("결제 정보:"+payList);
		
		model.addAttribute("reservationList", reservationList)
				.addAttribute("payList", payList)
				.addAttribute("usageTime", totalTime)
				.addAttribute("startTime", startTime);
		
		return "petsitter/reservation";	
 	}
	
	// 펫시터 닉네임, 아이디 검색(조회) 리스트 페이지
	// 기존의 페이지 사용할지 결정 (list 페이지로 model 전달)
		@RequestMapping("/searchlist")
		public String SearchList(@RequestParam(defaultValue="sitter_id") String searchOption,
								   @RequestParam(defaultValue="" ) String keyword,
								   @RequestParam(defaultValue = "1") int curPage,								 
																	                            Model model) {			
			int count = petsitterService.countSearchList(searchOption, keyword);			
			NaviVO navi = new NaviVO(count, curPage);			
			int start = navi.getPageBegin();
			int end = navi.getPageEnd();	
			model.addAttribute("list",(List<SitterlocationVO>)petsitterService.SearchListAll(start, end, searchOption, keyword))			
					  .addAttribute("count", count)
					  .addAttribute("navi", navi)		
					  .addAttribute("city", searchOption)
					  .addAttribute("area", keyword);	
			
			System.out.println("나와라!! = "+(List<SitterlocationVO>)petsitterService.SearchListAll(start, end, searchOption, keyword));
			return "petsitter/list";
		}
	
}
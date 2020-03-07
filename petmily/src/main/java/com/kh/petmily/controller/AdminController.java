package com.kh.petmily.controller;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URISyntaxException;
import java.util.List;

import org.apache.commons.io.filefilter.FalseFileFilter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ByteArrayResource;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.petmily.entity.AccountDto;
import com.kh.petmily.entity.BankImageDto;
import com.kh.petmily.entity.BlackListContentDto;
import com.kh.petmily.entity.BlackListDto;
import com.kh.petmily.entity.CareConditionNameDto;
import com.kh.petmily.entity.CarePetTypeNameDto;
import com.kh.petmily.entity.IdCardFileDto;
import com.kh.petmily.entity.LicenseFileDto;
import com.kh.petmily.entity.LocationDto;
import com.kh.petmily.entity.PayDto;
import com.kh.petmily.entity.PayinfoDto;
import com.kh.petmily.entity.PetDto;
import com.kh.petmily.entity.PetsitterDto;
import com.kh.petmily.entity.SkillNameDto;
import com.kh.petmily.service.AdminEmailService;
import com.kh.petmily.service.AdminService;
import com.kh.petmily.service.MemberService;
import com.kh.petmily.service.kakao.PayService;
import com.kh.petmily.service.petsitter.PetsitterService;
import com.kh.petmily.vo.AccountVO;
import com.kh.petmily.vo.CalculateVO;
import com.kh.petmily.vo.MemberVO;
import com.kh.petmily.vo.NaviVO;
import com.kh.petmily.vo.kakao.KakaoPayRevokeReturnVO;
import com.kh.petmily.vo.petsitter.PetsitterVO;
import com.kh.petmily.vo.petsitter.ReservationAllVO;
import com.kh.petmily.vo.petsitter.ReservationListVO;


@Controller
@RequestMapping("/admin")
public class AdminController {
	
	@Autowired
	private AdminService adminService;
	@Autowired
	private AdminEmailService amailService;
	@Autowired
	private MemberService memberService;
	@Autowired
	private PayService payService;
	@Autowired
	private PetsitterService petsitterService;
	
	// 메인페이지
	@GetMapping("/")
	public String admin(Model model) {	
		// 총 등록수 (회원 + 펫시터 + 관리자)
		model.addAttribute("mtotal", adminService.memberTotal())	
				  .addAttribute("member", adminService.memberTotal() -  
						  adminService.petsitterTotal() - adminService.admimTotal())		
				  .addAttribute("ptotal", adminService.petsitterTotal())		
				  .addAttribute("atotal", adminService.admimTotal())
				  .addAttribute("mlist", adminService.memberJoinall())
				  .addAttribute("slist", adminService.petsitterApplyup())
				  .addAttribute("mlist+slist", adminService.memberJoinall() + 
						  adminService.petsitterApplyup())
				  .addAttribute("listBqna", adminService.blackqnacount())
				  .addAttribute("listBm", adminService.blacklistmembercount())
				  .addAttribute("listBs", adminService.blacklistpetsittercount());	
		return "admin/main";		
	}
	
	//////////////////////////////////////////////////////////////////
	
	
	// 등록 현황으로 이동
	@GetMapping("/registInfo")	
	public String RegistInfo (Model model) {	
		// 총 등록수 (회원 + 펫시터 + 관리자)
		model.addAttribute("mtotal", adminService.memberTotal())	
				  .addAttribute("member", adminService.memberTotal() -  
						  adminService.petsitterTotal() - adminService.admimTotal())		
				  .addAttribute("ptotal", adminService.petsitterTotal())		
				  .addAttribute("atotal", adminService.admimTotal())
				  .addAttribute("mlist", adminService.memberJoinall())
				  .addAttribute("slist", adminService.petsitterApplyup())
				  .addAttribute("mlist+slist", adminService.memberJoinall() + 
						  adminService.petsitterApplyup())
				  .addAttribute("listBqna", adminService.blackqnacount())
				  .addAttribute("listBm", adminService.blacklistmembercount())
				  .addAttribute("listBs", adminService.blacklistpetsittercount());	
		return "admin/registInfo";
	}
	
	//////////////////////////////////////////////////////////////////////
	
	// 예약 디테일 페이지
	@GetMapping("/reservationstatusdetail")
	public String reservationstatusdetail(
			@RequestParam int reservation_no,
			Model model) {
		// 결제에 대한 단일 정보 : accountVO
		AccountVO acountVO = adminService.reservationstatusdetail(reservation_no);
		List<PayDto> payDto = adminService.paydetail(reservation_no);
		// 결제 가격이름정보 : payifoDto
		// 펫시터 이름 : petsitterVO
		int pet_sitter_no = acountVO.getReservation_sitter_no();
		PetsitterVO petsitter = adminService.petsitterdetail(pet_sitter_no);
		String sitter_id = petsitter.getSitter_id();		
		List<PayinfoDto> list =  adminService.payinfoName(reservation_no);
		model.addAttribute("acountOne", acountVO)
				  .addAttribute("payinfomation", payDto)
		 		  .addAttribute("payinfo", list)		 	
		 		  .addAttribute("sitter_id", sitter_id);		
		//예약 정보  단일 조회 (금액정보만 확인하기 위해 가지고 온 구문)
		ReservationListVO reservationList = petsitterService.getReservation(reservation_no);				
		//1시간 당 금액 구하기
		int hourPayment = payService.getHourPayment();		
		//최종 결제 금액 구하기
		int payMent = 0;
			List<ReservationAllVO> all = reservationList.getList();
			// 이용시간
			int totalTime = all.get(0).getUsage_time();
			// 이용 시작 시간
			int startTime = all.get(0).getStart_time();
			
			for(ReservationAllVO allVO : all) {				
				int usagetime = allVO.getUsage_time();				
				int oneHour = usagetime * hourPayment;
				int payment = allVO.getPayment();				
				payMent = oneHour + payment;			
			}
			model.addAttribute("payMent", payMent)
			.addAttribute("usageTime", totalTime)
			.addAttribute("startTime", startTime);
		// 결제 취소 버튼 유무 확인
			model.addAttribute("status", adminService.paymentcanclecheck(reservation_no));		
		return "admin/reservationstatusdetail";		
	}	
	// 결제 취소	(예약 디테일 페이지에서 확인)
	@GetMapping("/revoke")
	public String revoke(@RequestParam int pay_no,
									  @RequestParam int reservation_no) throws URISyntaxException {
		KakaoPayRevokeReturnVO kpayRevokeReturnVO = payService.revoke(pay_no);
		return "redirect:/admin/reservationstatusdetail?reservation_no="+reservation_no;
	}
	
	/////////////////////////////////////////////////////////////////////
	
	// 회원 디테일 페이지 연결
	@GetMapping("/memberdetail")
	public String memberdetail(@RequestParam String id,
												MemberVO memberVO,												 
												 Model model) {				
		Integer member_image_no = memberService.member_image_no(id);
		model.addAttribute("member", memberVO = adminService.getMemberdetail(id))
				  .addAttribute("pets", (List<PetDto>)adminService.getPets(id))		
				  .addAttribute("member_image_no",member_image_no);
		return "admin/member/memberdetail";			
	}
	
		
	// 펫시터관리 페이지 연결
	@GetMapping("/petsitter")
	public String petsitter(Model model) {					
		//		1. 펫시터 리스트
		//		2. 펫시터  신청 리스트	
		//		3 .펫시터 휴면 리스트	
		model.addAttribute("petsitterList", (List<PetsitterVO>) adminService.petsitterList())
				  .addAttribute("petsitterApplyList", (List<PetsitterVO>) adminService.petsitterApplyList())
				  .addAttribute("petsittersleepList", (List<PetsitterVO>) adminService.petsitterSleepList());		
		return "admin/petsitter";		
	}	
	
	// 펫시터 신청한 회원 승인 기능
	@PostMapping("/apply")
	public String petsitterapply(@RequestParam String sitter_id) {					
		// 데이터베이스 member -> petsitter 로변경
		adminService.petsitterapply(sitter_id);
		return "redirect:petsitter";					
	}
	// 펫시터 신청한 회원 거부 기능 ( 펫시터전체삭제 기능 )
	@PostMapping("/negative")
	@ResponseBody
	@Transactional
	public String negative(
		@ModelAttribute PetsitterVO petsitterVO) {
		// petsitter 신청한 회원의 이메일로 거부내용의 이메일을 발송
		String email = petsitterVO.getEmail();
		String sitter_id = petsitterVO.getSitter_id();
		int sitter_no = petsitterVO.getPet_sitter_no();
		String result = amailService.sendCancel(email, sitter_id);
		// pet_sitter 테이블에서 신청한 내용을 삭제
		adminService.petsitterNegative(sitter_id, sitter_no);	
		return result;
	}	
								
				// 펫시터 옵션 등록 페이지
				@GetMapping("/petsitter/option")
				public String petOtion(Model model) {				
					// 1. 펫시터 돌봄 가능 동물 종류 리스트					
					// 2. 펫시터 스킬 종류 리스트					
					// 3. 펫시터 환경 리스트				
					model.addAttribute("CTlist", (List<CarePetTypeNameDto>)adminService.carePetType())
							  .addAttribute("SKlist", (List<SkillNameDto>)adminService.petSkillsName())
							  .addAttribute("CClist", (List<CareConditionNameDto>)adminService.petCareCondition());
					return "admin/petsitter/option";					
				}
				
				// care_pet_type_name
				// 돌봄 가능 동물 종류 등록
				@GetMapping("/petsitter/option/scarePetTypeI")				
				public String carePetTypeI (@RequestParam String care_type) {				
					 adminService.carePetTypeI(care_type);
					 return "redirect:/admin/petsitter/option";	
				}
				// 돌봄 가능 동물 종류 삭제
				@GetMapping("/petsitter/option/carePetTypeD")				
				public String  carePetTypeD(@RequestParam int care_type_no) {				
					adminService.carePetTypeD(care_type_no);
					 return "redirect:/admin/petsitter/option";	
				}
				
				//skill_name
				// 펫시터 스킬 등록
				@GetMapping("/petsitter/option/petSkillNameI")
				public String petSkillNameI(@RequestParam String skill_name) {				
					adminService.petSkillNameI(skill_name);
					return "redirect:/admin/petsitter/option";						
				}
				// 펫시터 스킬 삭제
				@GetMapping("/petsitter/option/petSkillNameD")
				public String petSkillNameD (@RequestParam int skill_no) {			
					adminService.petSkillNameD(skill_no);
					return "redirect:/admin/petsitter/option";		
				}
				
				// care_condition_name
				// 펫시터 돌봄 가능 환경 등록
				@GetMapping("petsitter/option/petCareConditionI")
				public String petCareConditionI (@RequestParam String care_condition_name) {
					adminService.petCareConditionI(care_condition_name);
					return "redirect:/admin/petsitter/option";	
				}
				// 펫시터 돌봄 가능 환경삭제
				@GetMapping("petsitter/option/petCareConditionD")
				public String petCareConditionD(@RequestParam int care_condition_no) {
					adminService.petCareConditionD(care_condition_no);
					return "redirect:/admin/petsitter/option";	
				}
				
				
	// 펫시터 상태 변경 수정		
	@PostMapping("/petstatus")
	public String petstatus (@ModelAttribute PetsitterDto petsitterDto) {		
		adminService.sitter_status(petsitterDto);
		return "redirect:petsitter";	
	}
	
	
	// 소개이미지 가져오기(src로 주소)					
	@GetMapping("/petsitter/sitterInfoimage")
	public 	ResponseEntity<ByteArrayResource> sitterInfoimage(
			@RequestParam int info_image_no) throws UnsupportedEncodingException, IOException {	
		// 펫시터 이미지 다운로드 펫시터가 소개하는 사진이 몇장인지부터 확인하는게 우선
		// 1장씩 여러번 요청		
		return adminService.sitterInfoimage(info_image_no);					
	}
	// 신분증 이미지 가져오기(src 주소)
	@GetMapping("/petsitter/sitteridcardimage")
	public 	ResponseEntity<ByteArrayResource> sitteridcardimage(
			@RequestParam int id_image_no) throws IOException{		
		return adminService.sitteridcardimage(id_image_no);		
	}
	// 라이센스 이미지 가져오기(src 주소)
	@GetMapping("/petsitter/sitterlicenseimage")
	public 	ResponseEntity<ByteArrayResource> sitterlicenseimage(
			@RequestParam int license_image_no) throws IOException{		
		return adminService.sitterlicenseimage(license_image_no);		
	}
	// 통장사본 이미지 가져오기
	@GetMapping("/petsitter/sitterbankimage")
	public ResponseEntity<ByteArrayResource> sitterBankimage(
			@RequestParam int bank_image_no) throws IOException{
		return adminService.sitterbankimage(bank_image_no);
	}
	
	
	
	// 펫시터 정보 디테일 페이지로 연결
	@GetMapping("/petsitter/petsitterdetail")
	public String petsitterdetail(@RequestParam int pet_sitter_no,											
												   Model model)  {		
		// 1. 펫시터 단일조회 조건 펫시터 번호로
		// 2. 펫시터 회원정보 (지역) 
		// 3. 펫시터 회원정보 (돌봄가능동물)		
		// 4. 펫시터 회원정보 (스킬) 		
		// 5. 펫시터 회원정보 (펫시터 환경)
		// 6. 소개이미지 정보(여러장)
		// 7. 신분증 정보 (한장)
		// 8. 라이센스정보 (한장)
		model.addAttribute("petsitter", (PetsitterVO)adminService.petsitterdetail(pet_sitter_no))
		  		.addAttribute("petlocation", 	(List<LocationDto>)adminService.petsitterdetailLocation(pet_sitter_no))
		  		.addAttribute("pettypename", (List<CarePetTypeNameDto>)adminService.petsitterdetailCarePet(pet_sitter_no))
		  		.addAttribute("petskill", (List<SkillNameDto>)adminService.petsitterdetailSkills(pet_sitter_no))
		  		.addAttribute("petcondition", (List<CareConditionNameDto>)adminService.petsitterdetailCareCondition(pet_sitter_no))
		  		.addAttribute("sitterInfoimageList", adminService.sitterInfoimageAll(pet_sitter_no))
				.addAttribute("sitterIdcardimg", (IdCardFileDto)adminService.sitterIdcardimg(pet_sitter_no))
				.addAttribute("sitterLicenseimg", ( LicenseFileDto)adminService.sitterLicenseimge(pet_sitter_no))		
				.addAttribute("sitterBankimg", (BankImageDto)adminService.sitterBankimge(pet_sitter_no));
		
		return "admin/petsitter/petsitterdetail";	
	}	
	
	// 펫시터 신청 승인 디테일 페이지로 이동
	@GetMapping("/petsitter/petsitterdetailapply")
	public String petsitterdetailapply(@RequestParam int pet_sitter_no, 
			Model model) {			
		model.addAttribute("petsitter", (PetsitterVO)adminService.petsitterdetail(pet_sitter_no))
				  .addAttribute("petlocation", (List<LocationDto>)adminService.petsitterdetailLocation(pet_sitter_no))
				  .addAttribute("pettypename", (List<CarePetTypeNameDto>)adminService.petsitterdetailCarePet(pet_sitter_no))
				  .addAttribute("petskill", (List<SkillNameDto>)adminService.petsitterdetailSkills(pet_sitter_no))
				  .addAttribute("petcondition", 	(List<CareConditionNameDto>)adminService.petsitterdetailCareCondition(pet_sitter_no))
			  	  .addAttribute("sitterInfoimageList", adminService.sitterInfoimageAll(pet_sitter_no))
			  	  .addAttribute("sitterIdcardimg", (IdCardFileDto)adminService.sitterIdcardimg(pet_sitter_no))
			  	  .addAttribute("sitterLicenseimg", ( LicenseFileDto)adminService.sitterLicenseimge(pet_sitter_no))
			  	  .addAttribute("sitterBankimg", (BankImageDto)adminService.sitterBankimge(pet_sitter_no));
		return "admin/petsitter/petsitterdetailapply";	
	}
		
	// 휴면 펫시터 디테일 페이지로 이동
	@GetMapping("/petsitter/petsitterdetailsleep")
	public String petsitterdetailsleep(@RequestParam int pet_sitter_no, 
			Model model) {				
		model.addAttribute("petsitter", (PetsitterVO)adminService.petsitterdetail(pet_sitter_no))
				  .addAttribute("petlocation", (List<LocationDto>)adminService.petsitterdetailLocation(pet_sitter_no))
				  .addAttribute("pettypename", (List<CarePetTypeNameDto>)adminService.petsitterdetailCarePet(pet_sitter_no))
				  .addAttribute("petskill", (List<SkillNameDto>)adminService.petsitterdetailSkills(pet_sitter_no))
				  .addAttribute("petcondition", (List<CareConditionNameDto>)adminService.petsitterdetailCareCondition(pet_sitter_no))
				  .addAttribute("sitterInfoimageList", adminService.sitterInfoimageAll(pet_sitter_no))
				  .addAttribute("sitterIdcardimg", (IdCardFileDto)adminService.sitterIdcardimg(pet_sitter_no))
				  .addAttribute("sitterLicenseimg", ( LicenseFileDto)adminService.sitterLicenseimge(pet_sitter_no))
				  .addAttribute("sitterBankimg", (BankImageDto)adminService.sitterBankimge(pet_sitter_no));
		return "admin/petsitter/petsitterdetailsleep";		
	}
		
	
	/////////////////////////////////////////////////////////////////
	
	
	
	// 블랙리스트 펫시터 등록
	// 펫시터는 검색 노출 차단
	@GetMapping("/sitter_blacklist_content")
	public String sitter_blacklist_content(@RequestParam String sitter_id, Model model) {
		model.addAttribute("sitter_id", sitter_id);
		return "admin/sitter_blacklist_content";
	}
				// 펫시터 블랙리스트 등록 메소드(이메일 전송)
				@PostMapping("/sitter_blackListpage")
				@ResponseBody	
				public String sitter_blackListpage(@ModelAttribute PetsitterDto petsitterDto,
						@RequestParam String black_content) {		
					String sitter_id = petsitterDto.getSitter_id();
					PetsitterVO blacksitter =adminService.PetsitterSearchOne(sitter_id);
					String id = blacksitter.getSitter_id();
					String email = blacksitter.getEmail();
					String grade = blacksitter.getGrade();
					String result =amailService.blackListAddEmail(id, email, grade, black_content);					
					adminService.blackSitter(petsitterDto, black_content);
					return result ;		
				}	
				
	// 블랙리스트 회원 등록
	@GetMapping("/member_blacklist_content")
	public String member_blacklist_content(@RequestParam String id, Model model) {		
		model.addAttribute("id", id);
		return "admin/member_blacklist_contetnt";
	}	
				// 회원 블랙리스트 등록 메소드 (이메일 전송)
				@PostMapping("/member_blackListpage")
				@ResponseBody	
				public String member_blackListpage(@RequestParam String id,
						 								@RequestParam String black_content) {						
					MemberVO blackmember =adminService.getMemberdetail(id);
					String email = blackmember.getEmail();
					String grade = blackmember.getGrade();
					String result = amailService.blackListAddEmail(id, email, grade, black_content);		
					adminService.blackMember(id, black_content);			
					return result ;		
				}
								
				
	// 블랙리스트 회원 탈퇴(회원탈퇴)
	// 블랙리스트 + 멤버 테이블에서 완전삭제
	@GetMapping("/member_delete")
	public String member_delete(@RequestParam String id) {		
		adminService.blackListdelete(id);
		adminService.memberdelete(id);		
		return "redirect:blackList";	
	}		
	
	// 블랙리스트 펫시터 탈퇴 (펫시터 탈퇴)
	// 그냥 회원으로 강등되면서 블랙리스에 등록되어있음
	// 펫시터 테이블에서만  삭제
	// petsittersecession -> 등급을 petsitter -> member로 변경
	@GetMapping("/sitter_delete")
	public String sitter_delete (@RequestParam String sitter_id,
												@RequestParam int sitter_no) {	
		adminService.petsitterNegative(sitter_id, sitter_no);	
		adminService.petsittersecession(sitter_id);
		adminService.blackListgradechange(sitter_id);
		return "redirect:blackList";	
	}			
	
				
	// 블랙리스트 불러오기
	@GetMapping("/blackList")
	public String blackListpage (Model model) {
		// 펫시터 블랙리스트 불러오기		
		// 회원 블랙리스트 불러오기			
		model.addAttribute("PBlist", (List<BlackListDto>) adminService.sitterBlackList())
				  .addAttribute("MBlist", (List<BlackListDto>)adminService.memberBlackList());
		return "admin/blackList";		
	}
	
	// 블랙리스트 여부 검사 (요청 파라미터 신청시)
	// 카운터 2회 이상은 탈퇴<?>
	@GetMapping("/blackLsitcheck")	
	public void blackLsitcheck(@RequestParam String id,
												Model model) {
		boolean result = adminService.blackLsitcheck(id);
		model.addAttribute("result", result);		
	}
	
	// 블랙리스트 세부사항 페이지
	@GetMapping("/blackListdetail")
	public String blackListdelete(@RequestParam String id,													
													Model model) {
		// 블랙리스트 디테일 페이지
		// 삭제 및 복귀 가능
		// 블랙리스트 디테일 불러오기 -> view로 쏴주기	
		model.addAttribute("blackListdetail", (PetsitterVO)adminService.blackListdetail(id))
				  .addAttribute("blacklistcontent", (List<BlackListContentDto>)adminService.blacklistcontent(id));
		
		return "admin/blacklistdetail";		
	}
	
	// 펫시터 복귀(블랙리스트에서 삭제)
	@GetMapping("/blackList/comebackPet")
	public String comebackPet(String black_id) {
		adminService.gradeComback(black_id);		
		return "redirect:/admin/petsitter";		
	}
	// 회원 복귀(블랙리스트에서 삭제)
	@GetMapping("/blackList/comebackMember")
	public String comebackMember(String black_id) {
		adminService.gradeComback(black_id);		
		return "redirect:/admin/list/member";		
	}
	
	// 신고게시판에서 신고하기
	@GetMapping("declaration")
	public String declaration(
			@RequestParam String grade,
			@RequestParam String id,
			Model model) {
		// 신고하려는 내용이
		if(grade.equals("member")) {// 회원이라면
			model.addAttribute("id", id);			
			return "admin/member_blacklist_contetnt";
		}else {// 펫시터라면
			model.addAttribute("sitter_id", id);		
			return "admin/sitter_blacklist_content";		
		}		
	}
	
	///////////////////////////////////////////////////////////////	
	
	// 정산관리 페이지 연결
	@RequestMapping("/account")
	public String account(Model model,
			@RequestParam(defaultValue = "1") int type,
			@RequestParam(defaultValue = "오늘") String SearchType,
			@RequestParam(defaultValue = "account_sitter_id") String searchOption,
			@RequestParam(defaultValue = "") String keyword,
			@RequestParam(defaultValue = "1") int curPage
			) {
		// 0. 전체 날자기준으로 통합
		// 1. 토탈 결제금액 (sum)
		// 2. 토탈 취소금액 (sum)
		// 3. 견적 신청 수 : (count)
		// 4. 견적 승인 수 : (count)		
		// 5. 견적 대기 수 : (count)
		// 6. 결제 완료 수 : (count)
		// 7. 결제 취소 수 : (count)		
		model.addAttribute("totalInfo", (CalculateVO) adminService.getCalculateAllinfor(type))
				  .addAttribute("SearchType", SearchType);			
		// 정산리스트 불러오기
			// 레코드의 갯수 계산
			int count = adminService.countAricleAccount(searchOption, keyword);		
			// 페이지 나누기 관련 처리
			NaviVO navi = new NaviVO(count, curPage);	
			int start = navi.getPageBegin();
			int end = navi.getPageEnd();		
			// 리스트 불러오기
			model.addAttribute("list", (List<AccountDto>) adminService.getAccountList(start, end, searchOption, keyword))
					  .addAttribute("count", count)
					  .addAttribute("searchOption", searchOption)
					  .addAttribute("keyword", keyword)
					  .addAttribute("navi", navi);		
		return "admin/account";		
	}

	
	// 가격 정보 페이지 연결
	@GetMapping("/accountoption")
	public String accountOtion(Model model) {	
		model.addAttribute("accountlist", (List<PayinfoDto>)adminService.getAccountlist())
		.addAttribute("feesList", (List<PayinfoDto>)adminService.getFeesList());
		return "admin/accountoption";		
	}
					// 가격 정보 등록
					@PostMapping("/accountoption")
					public String accountOtion(@ModelAttribute PayinfoDto payinfoDto) {	
						adminService.accountOtionAdd(payinfoDto);
						return "redirect:/admin/accountoption";		
					}
					// 가격 정보 삭제
					@GetMapping("/accountoptiondelete")
					public String accountoptiondelete(
							@RequestParam int payinfo_no) {
						adminService.accountoptiondelete(payinfo_no);
						return "redirect:/admin/accountoption";
					}
					// 가격 정보 수정
					@PostMapping("/accountoptionupdate")					
					public String accountoptionupdate(
							@ModelAttribute PayinfoDto payinfoDto	) {						
						adminService.accountoptionupdate(payinfoDto);
						return "redirect:/admin/accountoption";
					}
	

	
	
}

package com.kh.petmily.controller;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.petmily.entity.BlackListDto;
import com.kh.petmily.entity.CareConditionNameDto;
import com.kh.petmily.entity.CarePetTypeNameDto;
import com.kh.petmily.entity.LocationDto;
import com.kh.petmily.entity.MemberDto;
import com.kh.petmily.entity.PetsitterDto;
import com.kh.petmily.entity.SkillNameDto;
import com.kh.petmily.service.AdminEmailService;
import com.kh.petmily.service.AdminService;
import com.kh.petmily.vo.PetsitterVO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/admin")
public class AdminController {
	
	@Autowired
	private AdminService adminService;
	@Autowired
	private AdminEmailService amailService;
	
	// 관리자 메인페이지 연결
	@GetMapping("/")
	public String admin(Model model) {				
		// 총 등록수 (회원 + 펫시터 + 관리자)
		model.addAttribute("mtotal", adminService.memberTotal());	
		// 총 회원 회원수
		model.addAttribute("member", adminService.memberTotal() -  
				adminService.petsitterTotal() - adminService.admimTotal());
		// 총 펫시터 수
		model.addAttribute("ptotal", adminService.petsitterTotal());		
		// 총 관리자 수
		model.addAttribute("atotal", adminService.admimTotal());		
		return "admin/main";		
	}
	
	//////////////////////////////////////////////////////////////////
	
	// 회원관리 페이지 연결
	@GetMapping("/member")
	public String member(MemberDto memberDto,
			Model model) {
		// 가입된 모든 회원 열람 (일반, 펫시터, 관리자)
		List<MemberDto> list = adminService.memberList(memberDto);
		model.addAttribute("memberList", list);
		return  "admin/member";			
	}
	@PostMapping("/member")
	public String member(@RequestParam String id, String sitter_id,
										MemberDto memberDto,
										Model model) {
		// 회원 검색 및 수정(강제탈퇴)	
		
		return "admin/member";		
	}
	
	
	// 펫시터관리 페이지 연결
	@GetMapping("/petsitter")
	public String petsitter(PetsitterVO petsitterVO,
										Model model) {		
		// 펫시터 리스트
		List<PetsitterVO> Plist = adminService.petsitterList();
		// 펫시터  신청 리스트
		List<PetsitterVO> PAlist = adminService.petsitterApplyList();
		// 펫시터 휴면 리스트
		List<PetsitterVO> PSlist = adminService.petsitterSleepList();
		// 펫시터 리스트 전달
		model.addAttribute("petsitterList", Plist);
		// 휴면펫시터 리스트 전달
		model.addAttribute("petsitterSleepList", PSlist);
		// 펫시터 신청 리스트 전달
		model.addAttribute("petsitterApplyList", PAlist);		
		return "admin/petsitter";		
	}
	
				// 펫시터 신청한 회원 승인 기능
				@PostMapping("/apply")
				public String petsitterapply(@RequestParam String sitter_id) {
					
					// 데이터베이스 member -> petsitter 로변경
					adminService.petsitterapply(sitter_id);
					return "redirect:petsitter";					
				}
				// 펫시터 신청한 회원 거부 기능
				@PostMapping("/negative")
				@ResponseBody
				public String negative(
					@ModelAttribute PetsitterVO petsitterVO) {
					// petsitter 신청한 회원의 이메일로 거부내용의 이메일을 발송
					String email = petsitterVO.getEmail();
					String sitter_id = petsitterVO.getSitter_id();
					String result = amailService.sendCancel(email);
					// pet_sitter 테이블에서 신청한 내용을 삭제
					adminService.petsitterNegative(sitter_id);	
					return result;
				}	
				
				
				// 펫시터 옵션 등록 페이지
				@GetMapping("/petsitter/option")
				public String petOtion(Model model) {				
					// 펫시터 돌봄 가능 동물 종류 리스트
					List<CarePetTypeNameDto> SPlist = (List<CarePetTypeNameDto>) adminService.carePetType();
					model.addAttribute("CTlist", SPlist);
					// 펫시터 스킬 종류 리스트
					List<CarePetTypeNameDto> SKlist = (List<CarePetTypeNameDto>) adminService.petSkillsName();
					model.addAttribute("SKlist", SKlist);
					// 펫시터 환경 리스트					
					List<CarePetTypeNameDto> CClist = (List<CarePetTypeNameDto>) adminService.petCareCondition();
					model.addAttribute("CClist", CClist);
					return "admin/petsitter/option";					
				}
				
				// care_pet_type_name
				// 돌봄 가능 동물 종류 등록
				@GetMapping("/petsitter/option/scarePetTypeI")				
				public String carePetTypeI (@RequestParam String care_type) {
					System.out.println("care_type = "+ care_type);
					 adminService.carePetTypeI(care_type);
					 return "redirect:/admin/petsitter/option";	
				}
				// 돌봄 가능 동물 종류 삭제
				@GetMapping("/petsitter/option/carePetTypeD")				
				public String  carePetTypeD(@RequestParam int care_type_no) {
					System.out.println("care_type_no = "+ care_type_no);
					adminService.carePetTypeD(care_type_no);
					 return "redirect:/admin/petsitter/option";	
				}
				
				//skill_name
				// 펫시터 스킬 등록
				@GetMapping("/petsitter/option/petSkillNameI")
				public String petSkillNameI(@RequestParam String skill_name) {
					System.out.println("skill_name = "+ skill_name);
					adminService.petSkillNameI(skill_name);
					return "redirect:/admin/petsitter/option";						
				}
				// 펫시터 스킬 삭제
				@GetMapping("/petsitter/option/petSkillNameD")
				public String petSkillNameD (@RequestParam int skill_no) {
					System.out.println("skill_no = "+ skill_no);
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
	
	// 펫시터 정보 디테일 페이지로 연결
	@GetMapping("/petsitterdetail")
	public String petsitterdetail(@RequestParam int pet_sitter_no, Model model) {
		// 펫시터 단일조회 조건 펫시터 번호로
		PetsitterVO petsitter = adminService.petsitterdetail(pet_sitter_no);
		// 펫시터 회원정보 (지역) 
		LocationDto  petlocation = adminService.petsitterdetailLocation(pet_sitter_no);
		// 펫시터 회원정보 (돌봄가능동물) 
		CarePetTypeNameDto pettypename = adminService.petsitterdetailCarePet(pet_sitter_no);
		// 펫시터 회원정보 (스킬) 
		SkillNameDto petslill = adminService.petsitterdetailSkills(pet_sitter_no);
		// 펫시터 회원정보 (펫시터 환경) 
		CareConditionNameDto petcondition = adminService.petsitterdetailCareCondition(pet_sitter_no);		
		model.addAttribute("petsitterOne", petsitter);
		model.addAttribute("petlocation", petlocation);
		model.addAttribute("pettypename", pettypename);
		model.addAttribute("petslill", petslill);
		model.addAttribute("petcondition", petcondition);
		return "petsitter/petsitterdetail";		
	}
	
	/////////////////////////////////////////////////////////////////
	
	
	// 차단 회원 및 펫시터 관리 페이지 연결
	// 회원은 강제탈퇴( 강제 탈퇴전 해당 내용 이메일 전송 )
	// 펫시터는 검색 노출 차단
	@GetMapping("/blacklist_content")
	public String blacklist_content(@RequestParam String sitter_id, Model model) {
		model.addAttribute("sitter_id", sitter_id);
		return "admin/blacklist_content";
	}
				@PostMapping("/blackListpage")
				public String blackList(@ModelAttribute PetsitterDto petsitterDto,
													  @RequestParam String black_content) {		
					adminService.blackSitter(petsitterDto, black_content);
					return "redirect:blackList";		
				}	
				
	// 블랙리스트 
	@GetMapping("/blackList")
	public String blackListpage (Model model) {
		// 펫시터 블랙리스트 불러오기
		List<BlackListDto> PBlist = adminService.sitterBlackList();
		// 회원 블랙리스트 불러오기
		List<BlackListDto>MBlist = adminService.memberBlackList();
		
		model.addAttribute("PBlist", PBlist);
		model.addAttribute("MBlist", MBlist);
		return "admin/blackList";		
	}
	
	
	///////////////////////////////////////////////////////////////
	
	// 정산관리 페이지 연결
	@GetMapping("/account")
	public String account() {
		return "admin/account";		
	}
	
	

}

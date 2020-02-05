package com.kh.petmily.controller;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.petmily.entity.MemberDto;
import com.kh.petmily.entity.PetsitterDto;
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
		// 총 회원수
		
		// 총 펫시터 수
		model.addAttribute("ptotal", adminService.petsitterTotal());		
		// 총 관리자 수
		model.addAttribute("atotal", adminService.admimTotal());		
		return "admin/main";		
	}
	
	
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
		// 펫시터 리스트 전달
		model.addAttribute("petsitterList", Plist);
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
	
				
	// 정산관리 페이지 연결
	@GetMapping("/account")
	public String account() {
		return "admin/account";		
	}
	
	
	
	// 차단 회원 및 펫시터 관리 페이지 연결
	// 회원은 강제탈퇴( 강제 탈퇴전 해당 내용 이메일 전송 )
	// 펫시터는 검색 노출 차단
	@GetMapping("/blacklist_content")
	public String blacklist_content(@RequestParam String sitter_id, Model model) {
		
//		System.out.println("sitter_id = " + sitter_id);
		model.addAttribute("sitter_id", sitter_id);
		return "admin/blacklist_content";
	}
	@PostMapping("/blackList")
	public String blackList(@ModelAttribute PetsitterDto petsitterDto,
										  @RequestParam String blacklist_centent) {
		
//		System.out.println("blackList" + petsitterDto);
//		System.out.println("blacklist_centent" + blacklist_centent);
		
		adminService.blackSitter(petsitterDto, blacklist_centent);
		return "redirect:blacklist";		
	}
	
	
	
	

}

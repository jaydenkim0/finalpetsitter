package com.kh.petmily.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.petmily.entity.MemberDto;
import com.kh.petmily.entity.PetsitterDto;
import com.kh.petmily.service.AdminService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/admin")
public class AdminController {
	
	@Autowired
	private AdminService adminService;
	
	// 관리자 메인페이지 연결
	@GetMapping("/")
	public String admin(Model model) {		
		
		// 총 회원수 (회원 + 펫시터 + 관리자)
		model.addAttribute("mtotal", adminService.memberTotal());		
		
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
	public String petsitter(PetsitterDto petsitterDto,
										Model model) {		
		// 펫시터 리스트
		List<PetsitterDto> Plist = adminService.petsitterList(petsitterDto);
		// 펫시터 
		List<PetsitterDto> PAlist = adminService.petsitterApplyList(petsitterDto);
		
		// 펫시터 리스트 전달
		model.addAttribute("petsitterList", Plist);
		// 펫시터 신청 리스트 전달
		model.addAttribute("petsitterApplyList", PAlist);
		
		return "admin/petsitter";		
	}
	
				// 펫시터 신청한 회원 승인 기능
				@PostMapping("/apply")
				public String petsitterapply(@RequestParam String sitter_id) {
					System.out.println(sitter_id);
					adminService.petsitterapply(sitter_id);
					return "redirect:petsitter";					
				}
	
	
	// 정산관리 페이지 연결
	@GetMapping("/account")
	public String account() {
		return "admin/account";		
	}
	
	
	// 차단 회원 및 펫시터 관리 페이지 연결
	// 회원은 강제탈퇴( 강제 탈퇴전 해당 내용 이메일 전송 )
	// 펫시터는 검색 노출 차단
	@GetMapping("/blackList")
	public String blackList(String sitter_id) {
		adminService.petsitterapply(sitter_id);
		return "admin/blackList";		
	}
	
	
	

}

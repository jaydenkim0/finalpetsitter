package com.kh.petmily.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.petmily.entity.MemberDto;
import com.kh.petmily.service.AdminService;

@Controller
@RequestMapping("/admin")
public class AdminController {
	
	@Autowired
	private AdminService adminService;
	
	// 관리자 메인페이지 연결
	@GetMapping("/")
	public String admin() {
		return "admin/main";		
	}
	
	
	// 회원관리 페이지 연결
	@GetMapping("/member")
	public String member() {
		return  "admin/member";			
	}
	@PostMapping("/member")
	public String member(MemberDto memberDto) {
		// 
		return "admin/member";		
	}
	
	// 펫시터관리 페이지 연결
	@GetMapping("/petsitter")
	public String petsitter() {
		return "admin/petsitter";
		
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
	public String blackList() {
		return "admin/blackList";
		
	}
	
	
	

}

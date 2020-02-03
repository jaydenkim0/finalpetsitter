package com.kh.petmily.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.petmily.entity.MemberDto;
import com.kh.petmily.service.MemberService;

@Controller
@RequestMapping("/member")
public class MemberController {

	@Autowired
	private MemberService memberService;
	
	//  회원가입
	//  regist로 이동
	@GetMapping("/regist")
	public String regist() {
		return "member/regist";		
	}	
	// 회원가입
	@PostMapping("/regist")
	public String regist(@ModelAttribute MemberDto memberDto) {
		memberService.regist(memberDto);
		return "redirect:member/login";		
	}
	
}

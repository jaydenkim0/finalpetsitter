package com.kh.petmily.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.petmily.entity.MemberDto;
import com.kh.petmily.service.MemberService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
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
	
	//로그인
	// login으로 이동
	@GetMapping("/login")
	public String login() {
		return "member/login";		
	}
	
	@PostMapping("/login")
	public String login(@ModelAttribute MemberDto memberDto, HttpSession session) {
							
		MemberDto find = memberService.login(memberDto);
		
		if(find == null) { //로그인 실패
		return"redirect:/login?error"; 
		
		}
		else { //로그인 성공
		session.setAttribute("id", find.getId());
		session.setAttribute("grade", find.getGrade());
		return "redirect:/";
		}
	}

	
	// 로그아웃
	@GetMapping("/logout")
	public String logout(HttpSession session) {
		session.removeAttribute("id");
		session.removeAttribute("grade");
		return "redirect:/";		
	}

		
}

	
	


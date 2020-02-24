package com.kh.petmily.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.petmily.entity.MemberDto;
import com.kh.petmily.service.MemberService;

@Controller
@RequestMapping("/check")
public class CheckPwController {

	@Autowired
	private MemberService memberService;
	
	@Autowired
	private BCryptPasswordEncoder encoder;
	
	
	// 비밀번호 화인 페이지로 이동
	@GetMapping("/login")
	public String logincheck(			
			@RequestParam String id,				
			@RequestParam(required = false) int reservation_no,
			@RequestParam int sitter_no,
			Model model) {		
		model.addAttribute("id", id)
				  .addAttribute("reservation_no", reservation_no)
				  .addAttribute("sitter_no", sitter_no);
		return"pay/logincheck";
	}
	
	
	// 비밀번호 확인 후 지정된 주소로 전달
	@PostMapping("/login")
	public String logincheck(
			MemberDto memberDto,
			@RequestParam String id,
			@RequestParam String pw,
			@RequestParam(required = false)  int reservation_no,
			@RequestParam int sitter_no,
			@RequestParam String go,
			HttpSession session,		
			Model model
			) {
		// 아이디검색으로 가입된 아이디 확인
		memberDto.setId(id);
		MemberDto find = memberService.login(memberDto);
		if(find == null ) {
			return"redirect:/check/login?error"; 
		}else {
			boolean correct = encoder.matches(pw, find.getPw());
			if(correct == true) {
				session.setAttribute("id", find.getId());
				session.setAttribute("grade", find.getGrade());
				model.addAttribute("reservation_no", reservation_no)
						  .addAttribute("id", id);
				memberService.updatelastlogin(id);
				System.out.println(go);
				return "redirect:"+go;
			}else {
				return"redirect:/check/login?error"; 
			}
		}			
	}
	
	
	
}

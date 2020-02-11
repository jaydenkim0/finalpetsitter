package com.kh.petmily.controller;

import java.util.List;

import javax.mail.MessagingException;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
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
import com.kh.petmily.entity.PetDto;
import com.kh.petmily.repository.CertDao;
import com.kh.petmily.service.EmailService;
import com.kh.petmily.service.MemberService;
import com.kh.petmily.service.RandomService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/member")
public class MemberController {

	@Autowired
	private MemberService memberService;
	
	@Autowired
	private EmailService emailService;
	
	@Autowired
	private RandomService randomService;
		
	@Autowired
	private CertDao certDao;

	
	@GetMapping("/input")
		public String input() {
			return "member/input";	
	}
	
	

	//  회원가입
	//  regist로 이동
	@GetMapping("/regist")
	public String regist() {
		return "member/regist";		
	}	
	
	// 회원가입
	@PostMapping("/regist")
	public String regist(
			@ModelAttribute MemberDto memberDto,
			@RequestParam String pets,
			@ModelAttribute PetDto petDto,
			@RequestParam String id,
			@RequestParam String pet_name,
			@RequestParam String pet_age,
			@RequestParam String pet_type,
			@RequestParam String pet_ect) {
		memberService.regist(memberDto);
		if(pets.equals("예")) {
			int real_pet_age = Integer.parseInt(pet_age);
			petDto.setMember_id(id);
			petDto.setName(pet_name);
			petDto.setAge(real_pet_age);
			petDto.setType(pet_type);
			petDto.setEct(pet_ect);
			
			memberService.pet_regist(petDto);
		}
		return "redirect:login";		
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
		String id = find.getId();
		memberService.updatelastlogin(id);
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

	
	//내정보보기
	@GetMapping("/mylist")
	public String mylist(
			HttpSession session,
			Model model) {
		String id = (String) session.getAttribute("id");
		MemberDto list = memberService.mylist(id);
		model.addAttribute("mylist",list);
		List<PetDto> petlist = memberService.mylistpet(id);
		model.addAttribute("mylistpet",petlist);
		
		return "member/mylist";
	}
	


//	//내정보수정
//	@GetMapping("/mylistchange")
//		public String mylistchange() {
//			return "member/mylistchange";
//		}


	@GetMapping("/send")
	@ResponseBody//내가 반환하는 내용이 곧 결과물
	public String send(@RequestParam String email, HttpSession session) {
//		인증번호를 세션이든 DB든 어디에 저장
//		String cert = "123456";
		String cert = randomService.generateCertificationNumber(6);
		session.setAttribute("cert", cert);
		return emailService.sendCertMessage(email, cert);
	}
	
	//아이디찾기-GetMapping
	@GetMapping("/findid")
	public String findid() {
		return "member/findid";
	}


	//아이디찾기-PostMapping
	@PostMapping("/findid")
	public String findid(
			@RequestParam String name,
			@RequestParam String email,
			@RequestParam String phone,
			Model model,
			MemberDto memberDto) {
		memberDto.setName(name);
		memberDto.setEmail(email);
		memberDto.setPhone(phone);
		String id = memberService.findid(memberDto);
		model.addAttribute("id",id);
		return "member/findid_result";
	}

	
	@GetMapping("/validate")	
	@ResponseBody
	public String validate(
			HttpSession session, @RequestParam String cert) {
		String value = (String)session.getAttribute("cert");
		session.removeAttribute("cert");
		if(value.equals(cert)) {
			return "success";
		}
		else {
			return "fail";
		}
	}
		@PostMapping("/input")
		public String input(@RequestParam String email) throws MessagingException {
			emailService.sendChangePasswordMail(email);
			return "redirect:result";
		}
		
		@GetMapping("/result")
		public String result() {
			return "member/result";
		}
		
		
		@GetMapping("/change")
		public String change(
				@RequestParam() String cert,
				@RequestParam() String email,
				HttpServletResponse response,
				Model model) {
//			필요한 작업
//			- 사용자가 이메일에서 링크를 누르면 이곳으로 들어온다.
//			- 들어오면서 정상적인 링크라면 
//				cert라는 파라미터와 email이라는 파라미터를 가지고 온다
//			- 위의 두 파라미터를 받아서 DB에 검증을 실시
//			- 위의 인증결과와 무관하게 해당 이메일의 인증정보를 모두 삭제
			model.addAttribute("email", email);
			boolean enter = certDao.check(email, cert);
			log.info("enter = {}", enter);
			certDao.delete(email);
			if(!enter) {
				//에러 코드 송출
				response.setStatus(403);
			}
			return "member/change";
		}

		@PostMapping("/change")
		public String change(@ModelAttribute MemberDto memberDto) {		
			memberService.pwchange(memberDto);
			return "/";
		}
		
		// 회원정보수정
		@GetMapping("/mylistchange")	
		public String edit(@RequestParam String id, Model model) {
			MemberDto dto = memberService.mylist(id);			
			model.addAttribute("member", dto);
			System.out.println(dto);
			return "member/mylistchange";
		}
		
		@PostMapping("/mylistchange")
		public String edit(@ModelAttribute MemberDto memberDto) {			
			memberService.mylistchange(memberDto);
			return "redirect:mylist";
		}
		
		
		
		
	}




	
	


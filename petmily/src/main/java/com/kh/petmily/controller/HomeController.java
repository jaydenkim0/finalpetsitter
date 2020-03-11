package com.kh.petmily.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.kh.petmily.entity.ReviewDto;
import com.kh.petmily.service.MemberService;
import com.kh.petmily.service.board.ReviewService;

@Controller
public class HomeController {
	
	@Autowired
	ReviewService reviewService;

	@Autowired
	MemberService memberService;
	
	
	@GetMapping("/")
	public String home(Model model) {
		List<ReviewDto>list = reviewService.reviewlist();
		System.out.println("리스트 = "+list);
		model.addAttribute("list", list);		
		return "home";
	}
	
	@GetMapping("/index")
	public String index() {
		return "index";
	}
	
	
		
	
		

		
		

	
	
	
}

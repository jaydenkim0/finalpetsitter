package com.kh.petmily.controller.board;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.petmily.entity.ReviewDto;
import com.kh.petmily.service.board.ReviewService;

import lombok.extern.slf4j.Slf4j;



@Controller
@Slf4j
@RequestMapping("board/review")
public class ReviewController {
	@Autowired
	ReviewService reviewService;
	
	@Autowired
	ReviewDto reviewDto;
	
	//리뷰 목록
	@GetMapping("/list")
	public String list(Model model) throws Exception {
		List<ReviewDto>list = reviewService.list();
		model.addAttribute("list",list);
		return "board/review/list";
	}
	//리뷰 작성
	@PostMapping("/write")
	public String write() {
		return"board/review/write";
	}
	
	//리뷰 작성처리
	@PostMapping("insert")
	public String write(ReviewDto reviewDto)throws Exception {
		ReviewService.write(reviewDto);
		return "redirect:list";
	}
}

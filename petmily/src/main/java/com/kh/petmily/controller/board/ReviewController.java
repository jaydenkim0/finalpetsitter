package com.kh.petmily.controller.board;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.petmily.entity.CareDto;
import com.kh.petmily.entity.CareReplyDto;
import com.kh.petmily.entity.FaqDto;
import com.kh.petmily.entity.ReviewDto;
import com.kh.petmily.page.FaqPage;
import com.kh.petmily.repository.ReviewDao;
import com.kh.petmily.service.board.ReviewService;
import com.kh.petmily.vo.FaqVO;

import lombok.extern.slf4j.Slf4j;



@Controller
@Slf4j
@RequestMapping("/board/review")
public class ReviewController {
	@Autowired
	ReviewService reviewService;
	
	@Autowired
	ReviewDao reviewDao;
	

	//리뷰 작성
	@PostMapping("/write")
	public String write() {
		return"board/review/write";
	}
	

	
	@GetMapping("/insert")
	public String insert() {
		return"board/review/insert";
	}

	@PostMapping("/insert")
	public String insert(@ModelAttribute ReviewDto reviewDto) throws Exception {
//		System.out.println(reviewDto);
//		reviewService.insert(reviewDto);
		reviewDao.insert(reviewDto);
		return "redirect:/petsitter/info";
	}
	
	//리뷰 목록
	@GetMapping("/list")
	public String list(Model model) {
		List<ReviewDto>list = reviewService.list();
//		List<ReviewDto>list = reviewService.listSearch(review_sitter_no);
		model.addAttribute("list",list);	
		return "board/review/list";     	
	}
	
//리뷰 조회
//	@GetMapping("/list")
//	public String list(Model model, @RequestParam int review_sitter_no) {
////		List<ReviewDto>list = reviewService.list();
//		List<ReviewDto>list = reviewService.listSearch(review_sitter_no);
//		model.addAttribute("list",list);	
//		return "board/review/list";    

		
	//리뷰 변경
	@GetMapping("/update")
	public String select(@RequestParam int review_no,Model model) throws Exception {
		 ReviewDto reviewDto= reviewDao.get(review_no);
		 model.addAttribute("reviewDto",reviewDto);
	 	return "board/review/update";
	}
		
	//리뷰 삭제
	@GetMapping("/delete")
	public String delete(@RequestParam int review_no) throws Exception{
		reviewDao.delete(review_no);
		return "redirect:list";
	
	}
}
	
	
	





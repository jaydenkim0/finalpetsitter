package com.kh.petmily.controller.board;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.petmily.entity.FaqDto;
import com.kh.petmily.service.board.FaqService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/board/faq")
public class FaqController {
	@Autowired
	FaqService faqService;
	
	@Autowired
	FaqDto faqDto;
	
	//게시글 목록
	@GetMapping("/list")
	public String list(Model model) throws Exception {
		List<FaqDto>list = faqService.list();
		model.addAttribute("list",list);
		return "board/faq/list";
	}
	//게시글 작성
	@GetMapping("/write")
	public String write() {
		return"board/faq/write";
	}
	//게시글 작성 처리
	@PostMapping("/insert")
	public String write(FaqDto faqDto)throws Exception{
		faqService.write(faqDto);
		return "redirect:list";
	}
	//게시글 상세보기
	@GetMapping("/view")
	public String view(@RequestParam int faq_no, Model model)throws Exception {
		FaqDto view = faqService.view(faq_no); 
		model.addAttribute("view",view);
		return "board/faq/view";
	}
	//게시글 수정
	@GetMapping("/update")
	public String update(@RequestParam int faq_no, Model model)throws Exception{
		//FaqDto view 내용을 수정
		FaqDto view = faqService.view(faq_no); 
		model.addAttribute("view",view);
		return "board/faq/update";
	}
	
	//게시글 수정 처리
	@PostMapping("/update")
	public String update(FaqDto faqDto)throws Exception{
		faqService.update(faqDto);
		return "redirect:list";
	}
	
	//게시글 삭제 처리
	@GetMapping("/delete")
	public String delete(@RequestParam int faq_no)throws Exception{
		faqService.delete(faq_no);
		return "redirect:list";
	}
}


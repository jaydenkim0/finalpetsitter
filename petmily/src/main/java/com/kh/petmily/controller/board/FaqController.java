package com.kh.petmily.controller.board;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.petmily.entity.FaqDto;
import com.kh.petmily.service.board.FaqService;
import com.kh.petmily.vo.FaqVO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/board/faq")
public class FaqController {
	@Autowired
	FaqService faqService;
	
	//01_1. 작성
	@GetMapping("/write")
	public String write() throws Exception {
		return "board/faq/write";
		}
	//01_2. 작성 처리
	@PostMapping("/insert")
	public String insert(@ModelAttribute FaqVO faqVO) throws Exception{
		faqService.create(faqVO);
		return "rediret:list";
	}
	
	//작성
//	public String write(FaqDto faqDto) throws Exception {
//		log.info("write");
//		faqService.write(faqDto);
//		return "redirect:/";
//		return "redirect:/list";
//	}
	
	//02. 목록
	@RequestMapping("/list")
	public ModelAndView list() throws Exception{
		List<FaqVO> list = faqService.listAll();
		ModelAndView mav = new ModelAndView();
		mav.setViewName("board/faq/list");
		mav.addObject("list",list);
		return mav;
	}
	//03. 글 수정
	@PostMapping("update")
	public String update(@ModelAttribute FaqVO faqVO) throws Exception{
		faqService.update(faqVO);
		return "redircet:list";
	}
	//04. 글 삭제
	@PostMapping("delete")
	public String delete(@RequestParam int faq_no) throws Exception{
		faqService.delete(faq_no);
		return "redirct:list";
	}
}


package com.kh.petmily.controller.board;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.kh.petmily.entity.FaqDto;
import com.kh.petmily.service.board.FaqService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/board/faq")
public class FaqController {
	@Autowired
	FaqService faqService;
	
	//작성
	@GetMapping("/write")
	public String write(FaqDto faqDto) throws Exception {
		log.info("write");
		faqService.write(faqDto);
		return "redirect:/list";
	}
	
	//목록
}


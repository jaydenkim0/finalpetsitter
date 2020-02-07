package com.kh.petmily.controller.board;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.petmily.entity.CareDto;
import com.kh.petmily.entity.CarePetsitterDto;
import com.kh.petmily.service.board.CareService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/board/care")
public class CareController {

	@Autowired
	CareService careService;
	
	@Autowired
	CareDto careDto;
	
	//게시글 목록
	@GetMapping("/list")
	public String list(Model model) {
		List<CarePetsitterDto> list  = careService.pet_sitter_list();
		model.addAttribute("list",list);
		return "board/care/list";
	}
	
	//게시글 작성
	@GetMapping("/write")
	public String write(
			HttpSession session,
			Model model) {
		String id = (String) session.getAttribute("id");
		model.addAttribute("id",id);
		return "board/care/write";
	}
}

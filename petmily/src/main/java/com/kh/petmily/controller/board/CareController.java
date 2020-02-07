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
	
	//게시글 등록
	@PostMapping("/write")
	public String write(
			@RequestParam String care_member_id,
			@RequestParam String care_sitter_id,
			@RequestParam String care_board_content,
			@RequestParam String care_pw,
			Model model) {
		int pet_sitter_no = (int)careService.id_to_number(care_sitter_id);
		careDto.setCare_member_id(care_member_id);
		careDto.setCare_sitter_no(pet_sitter_no);
		careDto.setCare_board_content(care_board_content);
		careDto.setCare_pw(care_pw);
		//아이디 결과값 일치하는 돌봄글만 보여
//		model.addAttribute("care_member_id",care_member_id);
		careService.write(careDto);
		return "redirect:/board/care/list";
	}
	
	//돌봄 방 페이지 연결
	@GetMapping("/content")
	public String content(
			@RequestParam String care_board_no,
			Model model) {
		model.addAttribute("care_board_no",care_board_no);
		CareDto list = careService.list(care_board_no);
		model.addAttribute("list",list);
		String sitter_id  = careService.number_to_id(list.getCare_sitter_no());
		model.addAttribute("sitter_id",sitter_id);
		return "board/care/content";
	}
	
	//돌봄 방 수정 페이지 연결
	@GetMapping("/contentchange")
	public String contentchange(
			@RequestParam String care_board_no,
			Model model) {
		model.addAttribute("care_board_no",care_board_no);
		CareDto list = careService.list(care_board_no);
		model.addAttribute("list",list);
		String sitter_id  = careService.number_to_id(list.getCare_sitter_no());
		model.addAttribute("sitter_id",sitter_id);
		return "board/care/contentchange";
	}
}

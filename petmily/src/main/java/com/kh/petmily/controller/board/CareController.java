package com.kh.petmily.controller.board;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.petmily.entity.CareDto;
import com.kh.petmily.entity.CarePetsitterDto;
import com.kh.petmily.entity.CareReplyDto;
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
	
	@Autowired
	CareReplyDto careReplyDto;
	
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
			HttpSession session,
			Model model) {
		model.addAttribute("care_board_no",care_board_no);
		CareDto list = careService.list(care_board_no);
		model.addAttribute("list",list);
		String sitter_id  = careService.number_to_id(list.getCare_sitter_no());
		model.addAttribute("sitter_id",sitter_id);
		List<CareReplyDto> replylist = careService.replylist(care_board_no);
		model.addAttribute("replylist",replylist);
		String id = (String) session.getAttribute("id");
		model.addAttribute("id",id);
		return "board/care/content";
	}
	
	//돌봄 방 제목 수정
	@GetMapping("/content_edit")
	public void content_edit(
			@RequestParam String board_no,
			@RequestParam String care_board_content,
			Model model) {
		int care_board_no = Integer.parseInt(board_no);
		careDto.setCare_board_no(care_board_no);
		careDto.setCare_board_content(care_board_content);
		careService.content_edit(careDto);
		model.addAttribute("care_board_no",care_board_no);
	}
	
	//돌봄 방 삭제
	@GetMapping("/delete")
	public String delete(
			@RequestParam String care_board_no) {
		careService.delete(care_board_no);
		return "redirect:/board/care/list";
	}
	
	//돌봄 방 댓글 등록
	@PostMapping("/reply_regist")
	public void reply_regist(
			@RequestParam String care_reply_board_no,
			@RequestParam String care_reply_writer,
			@RequestParam String care_reply_content) {
		careReplyDto.setCare_reply_board_no(Integer.parseInt(care_reply_board_no));
		careReplyDto.setCare_reply_writer(care_reply_writer);
		careReplyDto.setCare_reply_content(care_reply_content);
		careService.reply_regist(careReplyDto);
	}
	
	//돌봄 방 댓글 수정
	@PostMapping("/reply_change")
	public void reply_change(
			@RequestParam String care_reply_no,
			@RequestParam String care_reply_content) {
		careReplyDto.setCare_reply_no(Integer.parseInt(care_reply_no));
		careReplyDto.setCare_reply_content(care_reply_content);
		careService.reply_change(careReplyDto);
	}
	
	//돌봄 방 비밀번호 검사 창
	@GetMapping("/password")
	public String password(
			@RequestParam String care_board_no,
			Model model) {
		model.addAttribute("care_board_no",care_board_no);
		return "board/care/password";
	}
	
	//돌봄 방 비밀번호 검사
	@PostMapping("/password")
	public String care_board_password(
			@RequestParam String care_board_no,
			@RequestParam String care_pw,
			Model model) {
		careDto.setCare_pw(care_pw);
		careDto.setCare_board_no(Integer.parseInt(care_board_no));
		int result = careService.care_board_password(careDto);
		model.addAttribute("care_board_no",care_board_no);
		if(result==0) {
			return "redirect:/board/care/list";
		}else{
			return "redirect:/board/care/content";
		}
	}
	
}

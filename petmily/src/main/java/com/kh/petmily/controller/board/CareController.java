package com.kh.petmily.controller.board;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ByteArrayResource;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.petmily.entity.CareDto;
import com.kh.petmily.entity.CareImageDto;
import com.kh.petmily.entity.CarePetsitterDto;
import com.kh.petmily.entity.CareReplyDto;
import com.kh.petmily.entity.CareReplyImageDto;
import com.kh.petmily.entity.PetsitterDto;
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
	
	@Autowired
	CareImageDto careImageDto;
	
	@Autowired
	CareReplyImageDto careReplyImageDto;
	
	//게시글 목록
	@GetMapping("/list")
	public String list(
			Model model,
			HttpSession session,
			HttpServletRequest req,
			HttpServletResponse resp
			) throws Exception{
		
		String id = (String) session.getAttribute("id");
		model.addAttribute("id",id);
		
		String grade = (String) session.getAttribute("grade");
		model.addAttribute("grade",grade);
		
		int pagesize = 20;
		int navsize = 10;
		int pno;
		try {
			pno = Integer.parseInt(req.getParameter("pno"));
			if(pno <= 0) throw new Exception();
		}
		catch(Exception e) {
			pno = 1;
		}
		int finish = pno * pagesize;
		int start = finish - (pagesize -1);
		
		String type = req.getParameter("type");
		String keyword = req.getParameter("keyword");
		
		boolean isSearch = type != null && keyword != null;
		
		List<CarePetsitterDto> list; 
		int count;
		
		if(isSearch) {
			if(type.equals("care_board_no")) {
				list = careService.pet_sitter_list_care_board_no(keyword,start,finish);
				count = careService.getListCount_care_board_no(keyword);
			}else if(type.equals("care_member_id")) {
				list = careService.pet_sitter_list_care_member_id(keyword,start,finish);
				count = careService.getListCount_care_member_id(keyword);
			}else if(type.equals("sitter_id")) {
				list = careService.pet_sitter_list_sitter_id(keyword,start,finish);
				count = careService.getListCount_sitter_id(keyword);
			}else {
				list = careService.pet_sitter_list_care_board_content(keyword,start,finish);
				count = careService.getListCount_care_board_content(keyword);
			}
		}
		else {
			list = careService.pet_sitter_list(start,finish);
			count = careService.getListCount();
		}
		
		model.addAttribute("pno",pno);
		model.addAttribute("count",count);
		model.addAttribute("pagesize",pagesize);
		model.addAttribute("navsize",navsize);
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
		
		List<String> list = careService.offer_id();
		model.addAttribute("list",list);
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
	
	
	//돌봄이미지 가져오기(src로 주소)
	@GetMapping("/image")
	public ResponseEntity<ByteArrayResource>image(
			@RequestParam  int care_image_no) throws UnsupportedEncodingException,IOException {
		return careService.image(care_image_no);
	}
	
	
	
	//돌봄 방 페이지 연결
	@GetMapping("/content")
	public String content(
			@RequestParam String care_board_no,
			HttpSession session,
			Model model,
			HttpServletRequest req,
			HttpServletResponse resp) throws Exception{
		
		model.addAttribute("care_board_no",care_board_no);
		CareDto list = careService.list(care_board_no);
		model.addAttribute("list",list);
		
		String sitter_id  = careService.number_to_id(list.getCare_sitter_no());
		model.addAttribute("sitter_id",sitter_id);

		//세션 값 보내기
		String id = (String) session.getAttribute("id");
		model.addAttribute("id",id);
		String grade = (String) session.getAttribute("grade");
		model.addAttribute("grade",grade);

		int pagesize = 10;
		int navsize = 10;
		int pno;
		try {
			pno = Integer.parseInt(req.getParameter("pno"));
			if(pno <=0) throw new Exception();
		}
		catch(Exception e){
			pno = 1;
		}
		int finish = pno * pagesize;
		int start = finish - (pagesize - 1);
		
		int count = careService.getCount(care_board_no);
		
		List<CareReplyImageDto> replyimagelist = careService.replyimagelist(care_board_no,start,finish);
		model.addAttribute("replyimagelist",replyimagelist);
		model.addAttribute("pagesize",pagesize);
		model.addAttribute("navsize",navsize);
		model.addAttribute("pno",pno);
		model.addAttribute("count",count);
		
		
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
	public String reply_regist(
			@RequestParam String care_reply_board_no,
			@RequestParam String care_reply_writer,
			@RequestParam String care_reply_content,
			@RequestParam MultipartFile care_image,
			Model model) throws IllegalStateException, IOException {
		careReplyDto.setCare_reply_board_no(Integer.parseInt(care_reply_board_no));
		careReplyDto.setCare_reply_writer(care_reply_writer);
		careReplyDto.setCare_reply_content(care_reply_content);
		careService.reply_regist(careReplyDto);
		//댓글번호 구하기
		int care_reply_no = careService.find_care_reply_no();
		if(care_image.isEmpty()==false) {
			careService.care_image_regist(care_reply_no,care_image);
		}
		model.addAttribute("care_board_no",care_reply_board_no);
		return "redirect:/board/care/content";
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
			Model model,
			RedirectAttributes redirectAttributes) {
		careDto.setCare_pw(care_pw);
		careDto.setCare_board_no(Integer.parseInt(care_board_no));
		int result = careService.care_board_password(careDto);
		if(result==0) {
			redirectAttributes.addFlashAttribute("password", "x");
			return "redirect:/board/care/list";
		}else{
//			model.addAttribute("care_board_no",care_board_no);
			return "redirect:/board/care/content?care_board_no="+care_board_no;
		}
	}
	
	//돌봄 방 댓글 삭제
	@PostMapping("/reply_delete")
	public void reply_delete(
			@RequestParam String care_reply_no) {
		careReplyDto.setCare_reply_no(Integer.parseInt(care_reply_no));
		careService.reply_delete(careReplyDto);
	}
	
	//회원이미지 가져오기(src로 주소)
	@GetMapping("/member/image")
	public ResponseEntity<ByteArrayResource> member_image(
			@RequestParam String member_image_member_id) throws UnsupportedEncodingException,IOException{
		return careService.member_image(member_image_member_id);
	}
	
}

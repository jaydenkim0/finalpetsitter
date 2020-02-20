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
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.kh.petmily.repository.StrayDao;
import com.kh.petmily.service.board.StrayReplyService;
import com.kh.petmily.service.board.StrayService;
import com.kh.petmily.vo.QnaReplyVO;
import com.kh.petmily.vo.QnaVO;
import com.kh.petmily.vo.StrayReplyVO;
import com.kh.petmily.vo.StrayVO;
import com.kh.petmily.vo.StrayReplyVO;
import com.kh.petmily.vo.StrayVO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/board/stray")
public class StrayController {
	@Autowired
	StrayService strayService;
	
	@Autowired
	StrayDao strayDao;
	
	@Autowired
	StrayReplyService strayReplyService;
	
	
	private List<MultipartFile>getStray_no;
	
	//게시글 목록
	@RequestMapping("/list")
	public String list(HttpServletRequest req, HttpServletResponse resp,Model model) throws Exception{
		int pagesize = 10;
		int navsize=10;
		int pno;
		try{
			pno =  Integer.parseInt(req.getParameter("pno"));
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
		
		List<StrayVO>list;
		
		if(isSearch) {
			list = strayService.listAll(type,keyword,start,finish);
		}
		else {
			list = strayService.getList(start,finish);
		}
		int count = strayService.getCount(type, keyword);
		
		//뷰에서 필요한 데이터를 첨부(5개)
		//System.out.println(list.size());
		model.addAttribute("pno", pno);
		model.addAttribute("count", count);
		model.addAttribute("list", list);
		model.addAttribute("pagesize", pagesize);
		model.addAttribute("navsize", navsize);
		return "board/stray/list";
	}
	//게시글 작성 화면
		@GetMapping("/write")
		public String write() {
			return "board/stray/write";
	}
		//게시글 작성 처리(+답글)
		@PostMapping("/insert")
		public String insert(@ModelAttribute StrayVO strayVO,
				HttpSession session,
				@RequestParam(required = false, defaultValue = "0") int superno,
				@RequestParam List<MultipartFile> stray_file) throws Exception{
			String stray_writer = (String)session.getAttribute("stray_writer");
			
			int no = strayDao.getSequence();
			
			//새글
			if(superno==0) {
				strayVO.setStray_no(no);
				strayService.create(strayVO);
				strayService.uploadFile(no,stray_file);
			}
			//답글
			else {
				StrayVO target = strayDao.read(superno);
				strayVO.setStray_no(no);
				strayVO.setSuperno(target.getStray_no());
				strayVO.setGroupno(target.getGroupno());
				strayVO.setDepth(target.getDepth());
				strayService.create(strayVO);
				log.info("strayVO={}", strayVO);
				strayService.uploadFile(superno,stray_file);	
			}
			
			return "redirect:list";
		}
		//게시글 상세 내용 조회
		@GetMapping("/view")
		public String view(@ModelAttribute StrayVO strayVO,
				Model model,@RequestParam(required = false) List<MultipartFile> stray_file,
				@RequestParam int stray_no)throws Exception{
			model.addAttribute("strayVO",strayService.read(strayVO.getStray_no()));
			model.addAttribute("strayImageList",strayService.strayImageList(stray_no));
			List<StrayReplyVO> replyList = strayReplyService.readReply(strayVO.getStray_no());
			model.addAttribute("replyList", replyList);
			return "board/stray/view";
		}
		//게시글 이미지 가져오기(사진정보 하나씩)
		@GetMapping("/view/file_view")
		public ResponseEntity<ByteArrayResource> fileview(
				@RequestParam int stray_file_no)throws UnsupportedEncodingException, IOException{
				return strayService.fileview(stray_file_no);
		}
		//게시글 수정
		@GetMapping("/update")
		public String update(@RequestParam int stray_no, Model model)throws Exception{
			//StrayDto view 내용을 수정
			StrayVO view = strayService.read(stray_no); 
			model.addAttribute("strayVO",view);
			return "board/stray/update";
		}
		//게시글 수정 처리
		@PostMapping("/update")
		public String update(StrayVO strayVO,Model model, 
				@RequestParam int stray_no )throws Exception{
			strayService.update(strayVO);
			model.addAttribute("stray_no", stray_no);
			return "redirect:/board/stray/view";
		}
		//게시글 삭제
		@RequestMapping("/delete")
		public String delete(@RequestParam int stray_no) throws Exception{
			strayService.delete(stray_no);
			return "redirect:list";
		}
		//댓글 작성
		@PostMapping("/replywrite")
		public String replywrite(@ModelAttribute StrayReplyVO strayReplyVO,
				Model model, @RequestParam int origin) throws Exception {
			strayReplyService.writeReply(strayReplyVO);
			model.addAttribute("origin",strayReplyVO.getOrigin());
			model.addAttribute("stray_no", origin);
			return "redirect:/board/stray/view";
		}
		//댓글 수정
		@RequestMapping("/replyUpdate")
		@ResponseBody
		public void replyUpdate(@ModelAttribute StrayReplyVO strayReplyVO) {
		strayReplyService.replyUpdate(strayReplyVO);
		}
		//댓글 삭제
		@RequestMapping("/replyDelete")
		public String replyDelete(@ModelAttribute StrayReplyVO strayReplyVO,
				@RequestParam String reply_no,
				@RequestParam int origin,
				Model model) {
			strayReplyVO.setReply_no(Integer.parseInt(reply_no));
			strayReplyService.replyDelete(strayReplyVO);
			model.addAttribute("stray_no", origin);
			return "redirect:/board/stray/view";
		}
		//댓글 카운트
		@RequestMapping("/replyCal")
		@ResponseBody
		public void replyCal(@ModelAttribute StrayReplyVO strayReplyVO) {
		strayReplyService.replyCal(strayReplyVO);
		}
	}
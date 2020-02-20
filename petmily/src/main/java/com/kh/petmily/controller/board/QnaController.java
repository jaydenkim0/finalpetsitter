package com.kh.petmily.controller.board;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.RequestDispatcher;
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
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;


import com.kh.petmily.repository.QnaDao;
import com.kh.petmily.service.board.QnaReplyService;
import com.kh.petmily.service.board.QnaService;
import com.kh.petmily.vo.QnaFileVO;
import com.kh.petmily.vo.QnaReplyVO;
import com.kh.petmily.vo.QnaVO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/board/qna")
public class QnaController {
	@Autowired
	QnaService qnaService;
	
	@Autowired
	QnaDao qnaDao;
	
	@Autowired
	QnaReplyService qnaReplyService;

	private List<MultipartFile> getQna_no;
	//게시글 목록
	@RequestMapping("/list")
	public String list (HttpServletRequest req, HttpServletResponse resp,Model model) throws Exception{
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
		
		List<QnaVO>list;
		
		if(isSearch) {
			list = qnaService.listAll(type,keyword,start,finish);
		}
		else {
			list = qnaService.getList(start,finish);
		}
		int count = qnaService.getCount(type, keyword);
		
		//뷰에서 필요한 데이터를 첨부(5개)
		model.addAttribute("pno", pno);
		model.addAttribute("count", count);
		model.addAttribute("list", list);
		model.addAttribute("pagesize", pagesize);
		model.addAttribute("navsize", navsize);
		return "board/qna/list";
	}
		
	//게시글 작성 화면
	@GetMapping("/write")
	public String write() {
		return "board/qna/write";
		}
	//게시글 작성 처리(+답변 글)
	@PostMapping("/insert")
	public String insert(@ModelAttribute QnaVO qnaVO,
			HttpSession session,
			@RequestParam(required = false, defaultValue = "0") int superno,
			@RequestParam List<MultipartFile> qna_file) throws Exception{
		String qna_writer = (String)session.getAttribute("qna_writer");
	
		int no = qnaDao.getSequence();
		
		if(superno == 0) {
			qnaVO.setQna_no(no);
			qnaService.create(qnaVO);
			qnaService.uploadFile(no,qna_file);
		}
		else {
			QnaVO target = qnaDao.read(superno);
			qnaVO.setQna_no(no);
			qnaVO.setSuperno(target.getQna_no());
			qnaVO.setGroupno(target.getGroupno());
			qnaVO.setDepth(target.getDepth());
			qnaService.create(qnaVO);
			qnaService.uploadFile(superno,qna_file);
		}
		return "redirect:list";
	}
	
	//게시글 상세내용 조회
	@GetMapping("/view")
	public String view(@ModelAttribute QnaVO qnaVO, 
			Model model,
			@RequestParam(required = false) List<MultipartFile> qna_file,
			@RequestParam int qna_no)throws Exception{
		model.addAttribute("qnaVO",qnaService.read(qnaVO.getQna_no()));
		model.addAttribute("qnaImageList",qnaService.qnaImageList(qna_no));
		List<QnaReplyVO> replyList = qnaReplyService.readReply(qnaVO.getQna_no());
		model.addAttribute("replyList", replyList);
		return "board/qna/view";
	}
	//게시글 이미지 가져오기(사진정보 하나씩)
	@GetMapping("/view/file_view")
	public ResponseEntity<ByteArrayResource> fileview(
			@RequestParam int qna_file_no)throws UnsupportedEncodingException, IOException{
			return qnaService.fileview(qna_file_no);
	}
	//게시글 수정
	@GetMapping("/update")
	public String update(@RequestParam int qna_no, Model model)throws Exception{
		//QnaDto view 내용을 수정
		QnaVO view = qnaService.read(qna_no); 
		model.addAttribute("qnaVO",view);
		return "board/qna/update";
	}
	//게시글 수정 처리
	@PostMapping("/update")
	public String update(QnaVO qnaVO,Model model, 
			@RequestParam int qna_no )throws Exception{
		qnaService.update(qnaVO);
		model.addAttribute("qna_no", qna_no);
		return "redirect:/board/qna/view";
	}
	//게시글 삭제
	@RequestMapping("/delete")
	public String delete(@RequestParam int qna_no) throws Exception{
		qnaService.delete(qna_no);
		return "redirect:list";
	}
	//댓글 작성
	@PostMapping("/replywrite")
	public String replywrite(@ModelAttribute QnaReplyVO qnaReplyVO,
			Model model, @RequestParam int origin) throws Exception {
		qnaReplyService.writeReply(qnaReplyVO);
		model.addAttribute("origin",qnaReplyVO.getOrigin());
		model.addAttribute("qna_no", origin);
		return "redirect:/board/qna/view";
	}
	//댓글 수정
	@RequestMapping("/replyUpdate")
	@ResponseBody
	public void replyUpdate(@ModelAttribute QnaReplyVO qnaReplyVO) {
	qnaReplyService.replyUpdate(qnaReplyVO);
	}
	//댓글 삭제
	@RequestMapping("/replyDelete")
	public String replyDelete(@ModelAttribute QnaReplyVO qnaReplyVO,
			@RequestParam String reply_no,
			@RequestParam int origin,
			Model model) {
		qnaReplyVO.setReply_no(Integer.parseInt(reply_no));
		qnaReplyService.replyDelete(qnaReplyVO);
		model.addAttribute("qna_no", origin);
		return "redirect:/board/qna/view";
	}
	//댓글 카운트
	@RequestMapping("/replyCal")
	@ResponseBody
	public void replyCal(@ModelAttribute QnaReplyVO qnaReplyVO) {
	qnaReplyService.replyCal(qnaReplyVO);
	}
}
package com.kh.petmily.controller.board;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
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
		//System.out.println(list.size());
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
	//게시글 작성 처리
	@PostMapping("/insert")
	public String insert(@ModelAttribute QnaVO qnaVO,
			HttpSession session,
			@RequestParam List<MultipartFile> qna_file) throws Exception{
		String qna_writer = (String)session.getAttribute("qna_writer");
		int no = qnaDao.getSequence();
		qnaVO.setQna_no(no);
		qnaService.create(qnaVO);
		qnaService.uploadFile(no,qna_file);
		return "redirect:list";
	}
	//게시글 상세내용 조회
	@GetMapping("/view")
	public String view(@ModelAttribute QnaVO qnaVO, Model model)throws Exception{
		model.addAttribute("qnaVO",qnaService.read(qnaVO.getQna_no()));
		List<QnaReplyVO> replyList = qnaReplyService.readReply(qnaVO.getQna_no());
		model.addAttribute("replyList", replyList);
		return "board/qna/view";
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
	public String update(QnaVO qnaVO)throws Exception{
		qnaService.update(qnaVO);
		return "redirect:list";
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
		model.addAttribute("origin",qnaReplyVO.getOrigin());
		qnaReplyService.writeReply(qnaReplyVO);
		model.addAttribute("qna_no", origin);
		return "redirect:/board/qna/view";
	}
}
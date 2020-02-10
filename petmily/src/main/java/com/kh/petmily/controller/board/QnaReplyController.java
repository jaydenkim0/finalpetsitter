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

import com.kh.petmily.service.board.QnaReplyService;
import com.kh.petmily.vo.QnaReplyVO;
import com.kh.petmily.vo.QnaVO;

@Controller
@RequestMapping("/board/reply")
public class QnaReplyController {
	@Autowired
	QnaReplyService qnaReplyService;
	
	@Autowired
	QnaReplyVO qnaReplyVO;
	
}

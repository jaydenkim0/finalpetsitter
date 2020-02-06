package com.kh.petmily.controller.board;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
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
import com.kh.petmily.page.FaqPage;
import com.kh.petmily.service.board.FaqService;
import com.kh.petmily.service.board.FaqServiceImpl;
import com.kh.petmily.vo.FaqVO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/board/faq")
public class FaqController {
	@Autowired
	FaqService faqService;
	
	@Autowired
	FaqDto faqDto;
	
	//게시글 목록
	@RequestMapping("/list")
	public ModelAndView list(@RequestParam(defaultValue="faq_head")String type,
			@RequestParam(defaultValue="")String keyword) throws Exception{
		List<FaqVO>list = faqService.listAll(type,keyword);
		int count = faqService.countArticle(type,keyword);
		ModelAndView mav = new ModelAndView();
		Map<String,Object>map = new HashMap<>();
		map.put("list",list);
		map.put("count",count);
		map.put("type",type);
		map.put("keyword",keyword);
		mav.setViewName("board/faq/list");
		mav.addObject("map", map);
		return mav;
	}
	//게시글 작성 화면
	@GetMapping("/write")
	public String write() {
		return "board/faq/write";
	}
	//게시글 작성 처리
	@PostMapping("/insert")
	public String insert(@ModelAttribute FaqVO faqVO) throws Exception{
		faqService.create(faqVO);
		return "redirect:list";
	}
	//게시글 상세내용 조회
	@GetMapping("/view")
	public ModelAndView view(@RequestParam int faq_no, HttpSession session)throws Exception{
		ModelAndView mav = new ModelAndView();
		mav.setViewName("board/faq/view");
		mav.addObject("faqVO", faqService.read(faq_no));
		return mav;
	}
	//게시글 수정
	@GetMapping("/update")
	public String update(@RequestParam int faq_no, Model model)throws Exception{
		//FaqDto view 내용을 수정
		FaqVO view = faqService.read(faq_no); 
		model.addAttribute("faqVO",view);
		return "board/faq/update";
	}
	//게시글 수정 처리
	@PostMapping("/update")
	public String update(FaqVO faqVO)throws Exception{
		faqService.update(faqVO);
		return "redirect:list";
	}
	//게시글 삭제
	@RequestMapping("/delete")
	public String delete(@RequestParam int faq_no) throws Exception{
		faqService.delete(faq_no);
		return "redirect:list";
	}
}


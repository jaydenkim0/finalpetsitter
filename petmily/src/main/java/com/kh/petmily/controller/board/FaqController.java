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
	@GetMapping("/list")
	public String list(Model model) throws Exception {
		List<FaqDto>list = faqService.list();
		model.addAttribute("list",list);
		return "board/faq/list";
	}
	//게시글 작성
	@GetMapping("/write")
	public String write() {
		return"board/faq/write";
	}
	//게시글 작성 처리
	@PostMapping("/insert")
	public String write(FaqDto faqDto)throws Exception{
		faqService.write(faqDto);
		return "redirect:list";
	}
	//게시글 상세보기
	@GetMapping("/view")
	public String view(@RequestParam int faq_no, Model model)throws Exception {
		FaqDto view = faqService.view(faq_no); 
		model.addAttribute("view",view);
		return "board/faq/view";
	}
	//게시글 수정
	@GetMapping("/update")
	public String update(@RequestParam int faq_no, Model model)throws Exception{
		//FaqDto view 내용을 수정
		FaqDto view = faqService.view(faq_no); 
		model.addAttribute("view",view);
		return "board/faq/update";
	}
	
	//게시글 수정 처리
	@PostMapping("/update")
	public String update(FaqDto faqDto)throws Exception{
		faqService.update(faqDto);
		return "redirect:list";
	}
	
	//게시글 삭제 처리
	@GetMapping("/delete")
	public String delete(@RequestParam int faq_no)throws Exception{
		faqService.delete(faq_no);
		return "redirect:list";
	}
	
	//게시글 네비게이터
	@RequestMapping("list")
	public ModelAndView list(@RequestParam(defaultValue="1")int curPage,
			 @RequestParam(defaultValue="user_id") String search_option,
	          @RequestParam(defaultValue="") String keyword
			)throws Exception{
		int count = 1000;
		FaqPage faqPage = new FaqPage(count,curPage);
		int start = faqPage.getPageBegin();
		int end = faqPage.getPageEnd();
		
		List<FaqVO>list = faqService.listAll(search_option, keyword,start,end);
				ModelAndView mav = new ModelAndView();
				Map<String,Object>map = new HashMap<>();
				map.put("list",list);
				map.put("faqPage",faqPage);
				map.put("count", count);
		        map.put("search_option", search_option);
		        map.put("keyword", keyword);
		        mav.addObject("map", map);//modelandview에 map를 저장
		        mav.setViewName("board/faq/list");//자료를 넘길 뷰의 이름
		        return mav;    //게시판 페이지로 이동
	}
}


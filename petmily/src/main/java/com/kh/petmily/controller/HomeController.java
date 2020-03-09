package com.kh.petmily.controller;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ByteArrayResource;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.petmily.entity.ReviewDto;

import com.kh.petmily.service.board.ReviewService;

@Controller
public class HomeController {
	@Autowired
	ReviewService reviewService;

	@GetMapping("/")
	public String home() {
		return "home";
	}
	
	@GetMapping("/index")
	public String index() {
		return "index";
	}
	
	@RequestMapping("/")
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
		
		List<ReviewDto>list;
		
		if(isSearch) {
			list = reviewService.listAll(type,keyword,start,finish);
		}
		else {
			list = reviewService.getList(start,finish);
		}
		int count = reviewService.getCount(type, keyword);
		
		//뷰에서 필요한 데이터를 첨부(5개)
		//System.out.println(list.size());
		model.addAttribute("pno", pno);
		model.addAttribute("count", count);
		model.addAttribute("list", list);
		model.addAttribute("pagesize", pagesize);
		model.addAttribute("navsize", navsize);
		return "home";
	}
}

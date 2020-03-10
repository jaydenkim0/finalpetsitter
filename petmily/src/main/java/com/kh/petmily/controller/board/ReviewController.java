package com.kh.petmily.controller.board;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.petmily.entity.ReservationDto;
import com.kh.petmily.entity.ReviewDto;
import com.kh.petmily.repository.ReviewDao;
import com.kh.petmily.service.board.ReviewService;

import lombok.extern.slf4j.Slf4j;



@Controller
@Slf4j
@RequestMapping("/board/review")
public class ReviewController {
	@Autowired
	ReviewService reviewService;
	
	@Autowired
	ReviewDao reviewDao;
	
//-리뷰 작성----------------------------------------------------------------------------	
	@GetMapping("/insert")
	public String insert(@RequestParam int reservation_no, 
									@RequestParam String sitter_id,
								Model model) {
		ReservationDto reservationinfo = reviewService.getReviewInfo(reservation_no);
		
		model.addAttribute("reservation",reservationinfo)
				  .addAttribute("sitter_id", sitter_id);
		return"board/review/insert";
	}

	@PostMapping("/insert")
	public String insert(@ModelAttribute ReviewDto reviewDto) throws Exception {
		reviewDao.insert(reviewDto);
		int review_no = reviewDto.getReview_no();
		
		int isReview =  reviewService.isReview(review_no);
		if (isReview == 0) {
			reviewService.pointplus(reviewDto);
		}
		return "redirect:/board/review/list";
	}

//-리뷰 목록----------------------------------------------------------------------------	

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
		return "board/review/list";
	}
	
	
		
//리뷰 시터조회목록----------------------------------------------------------------------------	
	@GetMapping("/listsearch")
	public String listSearch(Model model, @RequestParam int review_sitter_no) throws Exception {
	    List<ReviewDto>list = reviewService.listSearch(review_sitter_no);
		model.addAttribute("list",list);	
		return "board/review/list";    
   }

	
//-리뷰 변경----------------------------------------------------------------------------	
	@GetMapping("/update")
	public String select(@RequestParam int review_no,Model model) throws Exception {
		 ReviewDto reviewDto= reviewDao.get(review_no);
		 model.addAttribute("reviewDto",reviewDto);
	 	return "board/review/update";
	}
		
	
	@PostMapping("/update")
	public String update(@ModelAttribute ReviewDto reviewDto) throws Exception{
		 reviewDao.update(reviewDto);	
		return "redirect:/board/review/list";
	}
	
//-리뷰 삭제----------------------------------------------------------------------------	
	@GetMapping("/delete")
	public String delete(@RequestParam int review_no) throws Exception{
		reviewDao.delete(review_no);
		return "redirect:list";
	
	}
	
//-리뷰 별점불러오기---------------------------------------------------------------------
//	@GetMapping("/content")
//	public String star(@RequestParam int pet_sitter_no,
//							 Model model) throws Exception{
//		
//		double star =  reviewService.star(pet_sitter_no);
// 
//	    model.addAttribute("reviewstar",star);
//		
//		return "board/review/content";
		
		
	}
	

				



	

	
	
	






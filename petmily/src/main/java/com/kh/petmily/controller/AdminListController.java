package com.kh.petmily.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.petmily.entity.PayDto;
import com.kh.petmily.service.AdminService;
import com.kh.petmily.vo.AccountVO;
import com.kh.petmily.vo.MemberVO;
import com.kh.petmily.vo.NaviVO;
import com.kh.petmily.vo.QnaVO;
import com.kh.petmily.vo.petsitter.PetsitterVO;

@Controller
@RequestMapping("/admin/list")
public class AdminListController {

	@Autowired
	private AdminService adminService;
	
	// 회원리스트
	@RequestMapping("/member")
	public String member(@RequestParam(defaultValue = "id", required = false) String searchOption,
										@RequestParam(defaultValue = "", required = false) String keyword,
										@RequestParam(defaultValue = "1", required = false) int curPage,										
										Model model) {
		// 레코드의 갯수 계산
		int count = adminService.countAricle(searchOption, keyword);
		
		// 페이지 나누기 관련 처리
		NaviVO navi = new NaviVO(count, curPage);
		
		int start = navi.getPageBegin();
		int end = navi.getPageEnd();
		
		// 리스트 불러오기
		model.addAttribute("list", (List<MemberVO>) adminService.memberListAll(start, end, searchOption, keyword))
				  .addAttribute("count", count)
				  .addAttribute("searchOption", searchOption)
				  .addAttribute("keyword", keyword)
				  .addAttribute("navi", navi);
		return  "admin/member/memberlist";		
	}
	
	
	// 펫시터 리스트 
	@RequestMapping("/petsitter")
	public String petsitterList(@RequestParam(defaultValue = "id", required = false) String searchOption,
												@RequestParam(defaultValue = "", required = false) String keyword,
												@RequestParam(defaultValue = "1", required = false) int curPage,										
												Model model) {		
		// 레코드의 갯수 계산
		int count = adminService.countAriclePetsitter(searchOption, keyword);
		
		// 페이지 나누기 관련 처리
		NaviVO navi = new NaviVO(count, curPage);
		
		int start = navi.getPageBegin();
		int end = navi.getPageEnd();
		
		// 리스트 불러오기
		model.addAttribute("list", (List<PetsitterVO>) adminService.petsitterListAll(start, end, searchOption, keyword))
				  .addAttribute("count", count)
				  .addAttribute("searchOption", searchOption)
				  .addAttribute("keyword", keyword)
				  .addAttribute("navi", navi);				
		return "admin/petsitter/petsitterlist";
	}
	
	// 펫시터 신청 리스트
	@RequestMapping("/petsitterapply")
	public String petsitterApplyList(@RequestParam(defaultValue = "id", required = false) String searchOption,
														@RequestParam(defaultValue = "", required = false) String keyword,
														@RequestParam(defaultValue = "1", required = false) int curPage,										
														Model model) {
		// 레코드의 갯수 계산
		int count = adminService.countAriclePetsitterApply(searchOption, keyword);
		
		// 페이지 나누기 관련 처리
		NaviVO navi = new NaviVO(count, curPage);
		
		int start = navi.getPageBegin();
		int end = navi.getPageEnd();
		
		// 리스트 불러오기
		model.addAttribute("list", (List<PetsitterVO>) adminService.petsitterApplyListAll(start, end, searchOption, keyword))
				  .addAttribute("count", count)
				  .addAttribute("searchOption", searchOption)
				  .addAttribute("keyword", keyword)
				  .addAttribute("navi", navi);		
		return "admin/petsitter/petsitterapplylist";
	}
	
	// 휴면 펫시터 리스트
	@RequestMapping("/petsittersleep")
	public String petsitterSleepList(@RequestParam(defaultValue = "id", required = false) String searchOption,
														@RequestParam(defaultValue = "", required = false) String keyword,
														@RequestParam(defaultValue = "1", required = false) int curPage,										
														Model model) {
		// 레코드의 갯수 계산
		int count = adminService.countAriclePetsitterSleep(searchOption, keyword);
		
		// 페이지 나누기 관련 처리
		NaviVO navi = new NaviVO(count, curPage);
		
		int start = navi.getPageBegin();
		int end = navi.getPageEnd();
		
		// 리스트 불러오기
		model.addAttribute("list", (List<PetsitterVO>) adminService.petsitterSleepListAll(start, end, searchOption, keyword))
				  .addAttribute("count", count)
				  .addAttribute("searchOption", searchOption)
				  .addAttribute("keyword", keyword)
				  .addAttribute("navi", navi);		
		return "admin/petsitter/petsittersleeplist";
	}
	
	// 경고 회원 리스트
	@RequestMapping("/blacklistmember")
	public String blackListMemberList (@RequestParam(defaultValue = "black_id", required = false) String searchOption,
															 @RequestParam(defaultValue = "", required = false) String keyword,
														     @RequestParam(defaultValue = "1", required = false) int curPage,										
														 	 Model model) {
		// 레코드의 갯수 계산
		int count = adminService.countAricleBlackMember(searchOption, keyword);
		
		// 페이지 나누기 관련 처리
		NaviVO navi = new NaviVO(count, curPage);
		
		int start = navi.getPageBegin();
		int end = navi.getPageEnd();
		
		// 리스트 불러오기
		model.addAttribute("list", (List<PetsitterVO>) adminService.blackMemberListAll(start, end, searchOption, keyword))
				  .addAttribute("count", count)
				  .addAttribute("searchOption", searchOption)
				  .addAttribute("keyword", keyword)
				  .addAttribute("navi", navi);		
		return "admin/member/blacklistmemberlist";
	}
	
	// 경고 펫시터 리스트
	@RequestMapping("/blacklistsitter")
	public String blackListSitterList(@RequestParam(defaultValue = "black_id", required = false) String searchOption,
														@RequestParam(defaultValue = "", required = false) String keyword,
														@RequestParam(defaultValue = "1", required = false) int curPage,										
														Model model) {
		// 레코드의 갯수 계산
		int count = adminService.countAricleBlackPetsitter(searchOption, keyword);
		
		// 페이지 나누기 관련 처리
		NaviVO navi = new NaviVO(count, curPage);
		
		int start = navi.getPageBegin();
		int end = navi.getPageEnd();
		
		// 리스트 불러오기
		model.addAttribute("list", (List<PetsitterVO>) adminService.blackPetsitterListAll(start, end, searchOption, keyword))
				  .addAttribute("count", count)
				  .addAttribute("searchOption", searchOption)
				  .addAttribute("keyword", keyword)
				  .addAttribute("navi", navi);		
		return "admin/petsitter/blacklistsitterlist";
	}
	
	// 문의 게시판에서 신고게시물만 불러오기
	@RequestMapping("/blackreport")
	public String blackreport(@RequestParam(defaultValue = "qna_writer", required = false) String searchOption,
											  @RequestParam(defaultValue = "", required = false) String keyword,
											  @RequestParam(defaultValue = "1", required = false) int curPage,										
											  Model model) {
		
		// 레코드의 갯수 계산
		int count = adminService.countAriclegetBlackreport(searchOption, keyword);		
		// 페이지 나누기 관련 처리
		NaviVO navi = new NaviVO(count, curPage);	
		int start = navi.getPageBegin();
		int end = navi.getPageEnd();		
		// 리스트 불러오기
		model.addAttribute("list", (List<QnaVO>) adminService.getBlackreport(start, end, searchOption, keyword))
				  .addAttribute("count", count)
				  .addAttribute("searchOption", searchOption)
				  .addAttribute("keyword", keyword)
				  .addAttribute("navi", navi);		
		return "admin/blackreport";
	}
	
	//////////////////////////////////////////////////////////////////
	
	
	// 예약 현황
	@RequestMapping("/reservationstatus")
	public String reservationstatus(@RequestParam(defaultValue = "reservation_no") String searchOption,
			  @RequestParam(defaultValue = "") String keyword,
			  @RequestParam(defaultValue = "1") int curPage,										
			  Model model) {
		// 레코드의 갯수 계산
		int count = adminService.countAriclegetAccount(searchOption, keyword);		
		// 페이지 나누기 관련 처리
		NaviVO navi = new NaviVO(count, curPage);	
		int start = navi.getPageBegin();
		int end = navi.getPageEnd();		
		// 리스트 불러오기
		model.addAttribute("list", (List<AccountVO>) adminService.getAccountreservationList(start, end, searchOption, keyword))
				  .addAttribute("count", count)
				  .addAttribute("searchOption", searchOption)
				  .addAttribute("keyword", keyword)
				  .addAttribute("navi", navi);			
		return "admin/reservationstatus";
	}
	
	
	//////////////////////////////////////////////////////////////////
	
	//	 정산 리스트 불러오기
	
	
	
}

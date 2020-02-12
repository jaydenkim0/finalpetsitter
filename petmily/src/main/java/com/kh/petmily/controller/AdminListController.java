package com.kh.petmily.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.petmily.entity.MemberDto;
import com.kh.petmily.service.AdminService;
import com.kh.petmily.vo.MemberVO;
import com.kh.petmily.vo.NaviVO;

@Controller
@RequestMapping("/admin/list")
public class AdminListController {

	@Autowired
	private AdminService adminService;
	
	// 회원관리 페이지 연결
	@RequestMapping("/member")
	public String member(@RequestParam( required = false) String searchPtion,
										@RequestParam( required = false) String keyword,
										@RequestParam(defaultValue = "1", required = false) int curPage,
										Model model) {
		// 레코드의 갯수 계산
		int count = adminService.countAricle(searchPtion, keyword);
		
		// 페이지 나누기 관련 처리
		NaviVO navi = new NaviVO(count, curPage);
		int start = navi.getPageBegin();
		int end = navi.getPageEnd();
		
		List<MemberVO> list = adminService.memberListAll(start, end, searchPtion, keyword);
		
		model.addAttribute("list", list)
				  .addAttribute("count", count)
				  .addAttribute("searchPtion", searchPtion)
				  .addAttribute("keyword", keyword)
				  .addAttribute("navi", navi);
		return  "admin/member/memberlist";		
	}
	
	
	// 펫시터 리스트
	@GetMapping("/petsitter")
	public String petsitterList() {
		
		return "admin/petsitter/petsitterlist";
	}
	
	// 펫시터 신청 리스트
	@GetMapping("/petsitterapply")
	public String petsitterApplyList() {
		
		return "admin/petsitter/petsitterapplylist";
	}
	
	// 휴면 펫시터 리스트
	@GetMapping("/petsittersleep")
	public String petsitterSleepList() {
		
		return "admin/petsitter/petsittersleeplist";
	}
	
	// 경고 회원 리스트
	@GetMapping("/blacklistmember")
	public String blackListMemberList () {
		
		return "admin/petsitter/blacklistmemberlist";
	}
	
	// 경고 펫시터 리스트
	@GetMapping("/blacklistsitter")
	public String blackListSitterList() {
		
		return "admin/petsitter/blacklistsitterlist";
	}
	
	
}

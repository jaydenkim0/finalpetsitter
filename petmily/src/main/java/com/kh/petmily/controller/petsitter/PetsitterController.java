  
package com.kh.petmily.controller.petsitter;

import java.io.IOException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import com.kh.petmily.service.AdminService;
import com.kh.petmily.service.petsitter.PetsitterService;
import com.kh.petmily.vo.NaviVO;
import com.kh.petmily.vo.petsitter.PetsitterGetListVO;
import com.kh.petmily.vo.petsitter.PetsitterRegistVO;
import com.kh.petmily.vo.petsitter.SitterlocationVO;

@Controller
@RequestMapping("/petsitter")
public class PetsitterController {
	
	@Autowired
	private PetsitterService petsitterService;
	@Autowired
	private AdminService adminService;
	
	
	@GetMapping("/regist")
	public String regist() {
		return "petsitter/regist";
	}
	
	@PostMapping("/regist")
	public String regist(@ModelAttribute PetsitterRegistVO vo) throws IllegalStateException, IOException{
		petsitterService.regist(vo);
		return "redirect:../";
	}
	
	@RequestMapping("/list")
	public String list(@RequestParam(defaultValue="",  required = false) String cityKeyword,
						@RequestParam(defaultValue="", required = false) String areaKeyword,
						@RequestParam(defaultValue = "1", required = false) int curPage,										
									Model model) {
		// 레코드의 갯수 계산
		int count = petsitterService.countlocation(cityKeyword, areaKeyword);
		
		// 페이지 나누기 관련 처리
		NaviVO navi = new NaviVO(count, curPage);
		
		int start = navi.getPageBegin();
		int end = navi.getPageEnd();
		
		// 리스트 불러오기
		model.addAttribute("list", (List<SitterlocationVO>) petsitterService.locationListAll(start, end, cityKeyword, areaKeyword))
				  .addAttribute("count", count)
				  .addAttribute("city", cityKeyword)
				  .addAttribute("area", areaKeyword)
				  .addAttribute("navi", navi);;
		return "petsitter/list";
	}
	
	@GetMapping("/content")
	public String content(@RequestParam int pet_sitter_no, Model model) {
		List<PetsitterGetListVO> petsitterList = petsitterService.getList(pet_sitter_no);
		model.addAttribute("petsitterList", petsitterList)
			.addAttribute("sitterInfoimageList", adminService.sitterInfoimageAll(pet_sitter_no));
		return "petsitter/content";
	}
	
	@GetMapping("/info")
	public String info(@RequestParam int pet_sitter_no, Model model) {
		List<PetsitterGetListVO> petsitterList = petsitterService.getList(pet_sitter_no);
		model.addAttribute("petsitterList", petsitterList)
		.addAttribute("sitterInfoimageList", adminService.sitterInfoimageAll(pet_sitter_no));
		return "petsitter/content";
	}
	
}
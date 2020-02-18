  
package com.kh.petmily.controller.petsitter;

import java.io.IOException;
import java.util.List;

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

import com.kh.petmily.entity.PetDto;
import com.kh.petmily.service.AdminService;
import com.kh.petmily.service.petsitter.PetsitterService;
import com.kh.petmily.vo.NaviVO;
import com.kh.petmily.vo.petsitter.PetsitterGetListVO;
import com.kh.petmily.vo.petsitter.PetsitterRegistVO;
import com.kh.petmily.vo.petsitter.ReservationVO;
import com.kh.petmily.vo.petsitter.SitterlocationVO;

@Controller
@RequestMapping("/petsitter")
public class PetsitterController {
	
	@Autowired
	private PetsitterService petsitterService;
	@Autowired
	private AdminService adminService;
	
	//펫시터 가입 페이지
	@GetMapping("/regist")
	public String regist() {
		return "petsitter/regist";
	}
	
	@PostMapping("/regist")
	public String regist(@ModelAttribute PetsitterRegistVO vo) throws IllegalStateException, IOException{
		petsitterService.regist(vo);
		return "redirect:../";
	}
	
	//펫시터 검색(조회) 페이지
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
				  .addAttribute("cityKeyword", cityKeyword)
				  .addAttribute("areaKeyword", areaKeyword)
				  .addAttribute("navi", navi);
		return "petsitter/list";
	}
	
	//펫시터 (검색 후)상세 조회페이지
	@GetMapping("/content")
	public String content(@RequestParam int pet_sitter_no, Model model) {
		List<PetsitterGetListVO> petsitterList = petsitterService.getList(pet_sitter_no);
		model.addAttribute("petsitterList", petsitterList)
			.addAttribute("sitterInfoimageList", adminService.sitterInfoimageAll(pet_sitter_no));
		return "petsitter/content";
	}
	
	//회원 정보 페이지
	@GetMapping("/info")
	public String info(@RequestParam int pet_sitter_no, Model model) {
		List<PetsitterGetListVO> petsitterList = petsitterService.getList(pet_sitter_no);
		model.addAttribute("petsitterList", petsitterList)
		.addAttribute("sitterInfoimageList", adminService.sitterInfoimageAll(pet_sitter_no));
		return "petsitter/content";
	}
	
	//견적 요청 페이지
	@GetMapping("/estimate")
	public String estimate(@RequestParam int pet_sitter_no, 
							HttpSession session,
							Model model) {
		String id = (String) session.getAttribute("id");
		
		List<PetDto> petList = petsitterService.getPet(id);
		model.addAttribute("petList", petList)
				.addAttribute("pet_sitter_no", pet_sitter_no);
		return "petsitter/estimate";
	}
	
	@PostMapping("/estimate")
	public String estimate(@ModelAttribute ReservationVO reservationVO) {
		petsitterService.reservation(reservationVO);
		//회원 예약 조회 할 수 있는 페이지로 보내기(나중에 변경 할것!!!)
		return "redirect:../";
	}
	
	//예약(견적)확인 페이지
	@GetMapping("/confirm")
	public String confirm() {
		return "petsitter/confirm";
	}
}
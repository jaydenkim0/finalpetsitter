package com.kh.petmily.controller.petsitter;

import java.io.File;
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
import org.springframework.web.multipart.MultipartFile;

import com.kh.petmily.entity.LicenseFileDto;
import com.kh.petmily.entity.LocationDto;
import com.kh.petmily.entity.PetsitterDto;
import com.kh.petmily.entity.SkillsDto;
import com.kh.petmily.repository.petsitter.CareConditionDao;
import com.kh.petmily.repository.petsitter.CarePetTypeDao;
import com.kh.petmily.repository.petsitter.IdCardFileDao;
import com.kh.petmily.repository.petsitter.LicenseFileDao;
import com.kh.petmily.repository.petsitter.PetsitterDao;
import com.kh.petmily.repository.petsitter.SkillsDao;
import com.kh.petmily.service.AdminService;
import com.kh.petmily.service.petsitter.PetsitterService;
import com.kh.petmily.vo.petsitter.PetsitterGetListVO;
import com.kh.petmily.vo.petsitter.PetsitterRegistVO;
import com.kh.petmily.vo.petsitter.PetsitterVO;

@Controller
@RequestMapping("/petsitter")
public class PetsitterController {
	
	@Autowired
	private PetsitterService petsitterService;
	@Autowired
	private PetsitterDao petsitterDao;
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
	
	@GetMapping("/list")
	public String list(Model model) {
		List<PetsitterVO> list = petsitterDao.getListAll();
		model.addAttribute("list", list);
		return "petsitter/list";
	}
	
	@GetMapping("/info")
	public String info(@RequestParam int pet_sitter_no, Model model) {
		List<PetsitterGetListVO> petsitterList = petsitterService.getList(pet_sitter_no);
		model.addAttribute("petsitterList", petsitterList)
			.addAttribute("sitterInfoimageList", adminService.sitterInfoimageAll(pet_sitter_no));
		return "petsitter/info";
	}
	
}

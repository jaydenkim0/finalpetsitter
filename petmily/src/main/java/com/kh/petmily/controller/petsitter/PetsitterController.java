package com.kh.petmily.controller.petsitter;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.petmily.entity.PetsitterDto;
import com.kh.petmily.repository.PetsitterDao;

@Controller
@RequestMapping("/petsitter")
public class PetsitterController {
	@Autowired
	private PetsitterDao petsitterDao;
	
	@GetMapping("/regist")
	public String regist() {
		return "petsitter/regist";
	}
	
	@PostMapping("/regist")
	public String regist(@ModelAttribute PetsitterDto petsitterDto) {
		petsitterDao.regist(petsitterDto);
		return "/";
	}
	
}

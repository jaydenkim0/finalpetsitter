package com.kh.petmily.controller.petsitter;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.petmily.entity.PetsitterDto;

import com.kh.petmily.repository.petsitter.CareConditionDao;
import com.kh.petmily.repository.petsitter.CarePetTypeDao;
import com.kh.petmily.repository.petsitter.PetsitterDao;
import com.kh.petmily.repository.petsitter.SkillsDao;

@Controller
@RequestMapping("/petsitter")
public class PetsitterController {
	
	@Autowired
	private PetsitterDao petsitterDao;
	@Autowired
	private SkillsDao skillsDao;
	@Autowired
	private CarePetTypeDao carePetTypeDao;
	@Autowired
	private CareConditionDao careConditionDao;
	
	
	@GetMapping("/regist")
	public String regist() {
		return "petsitter/regist";
	}
	
	@PostMapping("/regist")
	public String regist(
			@ModelAttribute PetsitterDto petsitterDto,
			@RequestParam List<Integer>skills_name,
			@RequestParam List<Integer>care_name,
			@RequestParam List<Integer>care_condition_name
			) {
		
		//나중에 서비스에서 (파일과 함께)한 번에 받을 예정
		petsitterDao.regist(petsitterDto);
		skillsDao.registSkills(skills_name);
		carePetTypeDao.registType(care_name);
		careConditionDao.registCondition(care_condition_name);
		
		return "redirect:../";
	}
	
}

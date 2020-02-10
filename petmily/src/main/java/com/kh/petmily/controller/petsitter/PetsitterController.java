package com.kh.petmily.controller.petsitter;

import java.io.File;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.kh.petmily.entity.LicenseFileDto;
import com.kh.petmily.entity.PetsitterDto;
import com.kh.petmily.entity.SkillsDto;
import com.kh.petmily.repository.petsitter.CareConditionDao;
import com.kh.petmily.repository.petsitter.CarePetTypeDao;
import com.kh.petmily.repository.petsitter.LicenseFileDao;
import com.kh.petmily.repository.petsitter.PetsitterDao;
import com.kh.petmily.repository.petsitter.SkillsDao;

@Controller
@RequestMapping("/petsitter")
public class PetsitterController {
	
	//서비스로 변경 예정
	@Autowired
	private PetsitterDao petsitterDao;
	@Autowired
	private SkillsDao skillsDao;
	@Autowired
	private CarePetTypeDao carePetTypeDao;
	@Autowired
	private CareConditionDao careConditionDao;
	@Autowired
	private LicenseFileDao licenseFileDao;
	
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
//			@RequestParam List<MultipartFile> license_file
			) {
		//나중에 서비스에서 (파일과 함께)한 번에 받을 예정
		int no = petsitterDao.getSequence();
		petsitterDto.setPet_sitter_no(no);
		
		petsitterDao.regist(petsitterDto);
		
		skillsDao.registSkills(no,skills_name);
		carePetTypeDao.registType(no,care_name);
		careConditionDao.registCondition(no,care_condition_name);
//		licenseFileDao.upload(license_file);
		
		return "redirect:../";
	}
	
	@GetMapping("/info")
	public String info() {
		return "petsitter/info";
	}
	
		
}

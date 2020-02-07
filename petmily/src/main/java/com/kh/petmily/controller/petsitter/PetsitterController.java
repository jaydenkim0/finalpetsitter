package com.kh.petmily.controller.petsitter;

import java.io.File;
import java.io.IOException;
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
import com.kh.petmily.repository.petsitter.IdCardFileDao;
import com.kh.petmily.repository.petsitter.LicenseFileDao;
import com.kh.petmily.repository.petsitter.PetsitterDao;
import com.kh.petmily.repository.petsitter.SkillsDao;
import com.kh.petmily.service.petsitter.PetsitterService;

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
	
	//파일 등록
	@Autowired
	private PetsitterService petsitterService;
	
	
	@GetMapping("/regist")
	public String regist() {
		return "petsitter/regist";
	}
	
	@PostMapping("/regist")
	public String regist(
			@ModelAttribute PetsitterDto petsitterDto,
			@RequestParam List<Integer>skills_name,
			@RequestParam List<Integer>care_name,
			@RequestParam List<Integer>care_condition_name,
			@RequestParam MultipartFile license_file,
			@RequestParam MultipartFile id_card_file,
			@RequestParam List<MultipartFile> info_image
			) throws IllegalStateException, IOException {
		//나중에 서비스에서 (파일과 함께)한 번에 받을 예정
		int no = petsitterDao.getSequence();
		petsitterDto.setPet_sitter_no(no);
		
		//펫시터 기본 정보 등록
		petsitterDao.regist(petsitterDto);
		
		//펫시터 스킬,돌봄 가능 동물종류,돌봄 환경  등록
		skillsDao.registSkills(no,skills_name);
		carePetTypeDao.registType(no,care_name);
		careConditionDao.registCondition(no,care_condition_name);
		
		//펫시터 소개 이미지,신분증,증빙서류 등록
		petsitterService.uploadId(no, id_card_file);
		petsitterService.uploadLicense(no, license_file);
		petsitterService.uploadInfo(no, info_image);
		
		return "redirect:../";
	}
	
}

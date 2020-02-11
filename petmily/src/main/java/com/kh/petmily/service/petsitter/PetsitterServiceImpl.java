package com.kh.petmily.service.petsitter;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.kh.petmily.entity.IdCardFileDto;
import com.kh.petmily.entity.InfoImageDto;
import com.kh.petmily.entity.LicenseFileDto;
import com.kh.petmily.entity.PetsitterDto;
import com.kh.petmily.repository.petsitter.CareConditionDao;
import com.kh.petmily.repository.petsitter.CarePetTypeDao;
import com.kh.petmily.repository.petsitter.IdCardFileDao;
import com.kh.petmily.repository.petsitter.InfoImageDao;
import com.kh.petmily.repository.petsitter.LicenseFileDao;
import com.kh.petmily.repository.petsitter.LocationDao;
import com.kh.petmily.repository.petsitter.PetsitterDao;
import com.kh.petmily.repository.petsitter.SkillsDao;
import com.kh.petmily.vo.petsitter.PetsitterRegistVO;

@Service
public class PetsitterServiceImpl implements PetsitterService {

	//파일
	@Autowired
	private PetsitterFileService petSitterFileService;
	
	//펫시터
	@Autowired
	private PetsitterDao petsitterDao;
	//스킬
	@Autowired
	private SkillsDao skillsDao;
	//돌봄 환경
	@Autowired
	private CareConditionDao careConditionDao;
	//돌봄 가능 동물
	@Autowired
	private CarePetTypeDao carePetTypeDao;
	//지역
	@Autowired
	private LocationDao locationDao;
	
	

	@Override
	public void regist(PetsitterRegistVO vo) throws IllegalStateException, IOException {
		//펫시터 번호 뽑고
		int no = petsitterDao.getSequence();
		//펫시터 번호 설정
		PetsitterDto petsitterDto = PetsitterDto.builder()
												.pet_sitter_no(no)
												.sitter_id(vo.getSitter_id())
												.info(vo.getInfo())
												.sitter_pets(vo.getSitter_pets())
												.sitter_matching_type(vo.getSitter_matching_type())
												.build();
		
		//펫시터 기본 정보 등록
		petsitterDao.regist(petsitterDto);
		
		//펫시터 스킬,돌봄 가능 동물종류,돌봄 환경  등록
		skillsDao.registSkills(no,vo.getSkills_name());
		carePetTypeDao.registType(no,vo.getCare_name());
		careConditionDao.registCondition(no,vo.getCare_condition_name());
		
		//펫시터 소개 이미지,신분증,증빙서류 등록
		petSitterFileService.uploadId(no, vo.getId_card_file());
		petSitterFileService.uploadLicense(no, vo.getLicense_file());
		petSitterFileService.uploadInfo(no, vo.getInfo_image());
		
		
		
		//지역 정보 등록
		locationDao.registLocation(no,vo.getLocation_name());
		
	}
	
	

}

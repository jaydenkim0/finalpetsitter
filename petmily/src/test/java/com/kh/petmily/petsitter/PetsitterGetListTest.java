package com.kh.petmily.petsitter;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import com.kh.petmily.entity.CareConditionDto;
import com.kh.petmily.entity.CarePetTypeDto;
import com.kh.petmily.entity.LocationDto;
import com.kh.petmily.entity.SkillNameDto;
import com.kh.petmily.vo.MemberPetsVO;
import com.kh.petmily.vo.petsitter.PetsitterPetsVO;
import com.kh.petmily.vo.petsitter.PetsitterVO;

import lombok.extern.slf4j.Slf4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {
	"file:src/main/webapp/WEB-INF/spring/root-context.xml",
	"file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml"
})
@WebAppConfiguration
@Slf4j
public class PetsitterGetListTest {
	
	@Autowired
	private SqlSession sqlSession;
	
	//펫시터 기본 정보 조회
//	@Test
	public void getList() {
		List<PetsitterVO> petsitterList = sqlSession.selectList("petsitter.getList", 134);
		log.info("petsitter = {}", petsitterList);
	}
	
	//펫시터 스킬 조회
//	@Test
	public void getSkillsList() {
		List<SkillNameDto> skillsList = sqlSession.selectList("petsitter.getSkillList", 134);
		log.info("skills = {}", skillsList);
	}
	
	//돌봄 가능 동물 종류 조회
//	@Test
	public void getPetTypeList() {
		List<CarePetTypeDto> petTypeList = sqlSession.selectList("petsitter.getPetTypeList", 134);
		log.info("petType = {}", petTypeList);
	}
	
	//돌봄 환경 조회
//	@Test
	public void getCareConditionList() {
		List<CareConditionDto> careConditionList = sqlSession.selectList("petsitter.getCareConditionList", 134);
		log.info("careCondition = {}", careConditionList);
	}
	
	//활동 지역
//	@Test
	public void getLocationList() {
		List<LocationDto> locationList = sqlSession.selectList("petsitter.getLocationList", 134);
		log.info("location = {}", locationList);
	}
	
	//펫 조회
	@Test
	public void getPetList() {
		List<PetsitterPetsVO> petList = sqlSession.selectList("petsitter.getPetList", 134);
		log.info("pet = {}", petList);
	}

}

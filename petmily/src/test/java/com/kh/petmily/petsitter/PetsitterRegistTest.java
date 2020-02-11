package com.kh.petmily.petsitter;

import org.apache.ibatis.session.SqlSession;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import com.kh.petmily.entity.CareConditionDto;
import com.kh.petmily.entity.CarePetTypeDto;
import com.kh.petmily.entity.PetsitterDto;
import com.kh.petmily.entity.SkillsDto;

import lombok.extern.slf4j.Slf4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {
	"file:src/main/webapp/WEB-INF/spring/root-context.xml",
	"file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml"
})
@WebAppConfiguration
@Slf4j
public class PetsitterRegistTest {
	
	@Autowired
	private SqlSession sqlSession;
	
	//펫시터 기본 정보 등록 테스트
//	@Test
	public void registTest() {
		PetsitterDto petsitterDto = PetsitterDto.builder()
												.sitter_id("hello")
												.info("저는 펫시터 테스트중입니다2")
												.sitter_pets("예")											
												.build();
		sqlSession.insert("petsitter.regist", petsitterDto);
	}
	
	//펫시터 스킬 등록 테스트
//	@Test
	public void registSkills() {
		SkillsDto skillsDto = SkillsDto.builder()
										.skills_name(1)
										.skills_sitter_no(21)
										.build();
		sqlSession.insert("petsitter.registSkills", skillsDto);						
	}
	
	//펫시터 돌봄 가능 동물 종류 등록 테스트
//	@Test
	public void registType() {
		CarePetTypeDto carePetTypeDto = CarePetTypeDto.builder()
													.care_name(1)
													.care_sitter_no(21)
													.build();
		sqlSession.insert("petsitter.registType", carePetTypeDto);
	}
	
	//펫시터 돌봄 환경 등록 테스트
//	@Test
	public void registCondition() {
		CareConditionDto careConditionDto = CareConditionDto.builder()
				.care_condition_name(3)
				.condition_sitter_no(21)
				.build();
		sqlSession.insert("petsitter.registCondition", careConditionDto);		
	}
	
	//펫시터 번호 구해오기
	@Test
	public void getSequence() {
		int petsitterNo = sqlSession.selectOne("petsitter.getSequence");
		log.info("petsitterNo = {}", petsitterNo);
	}
}

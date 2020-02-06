package com.kh.petmily.petsitter;

import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import org.apache.ibatis.session.SqlSession;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import com.kh.petmily.entity.MemberDto;
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
public class PetSitterRegistTest {
	@Autowired
	private SqlSession sqlSession;
	
	@Test
	public void test() {
		log.info("sqlSession = {}", sqlSession);
		
		//회원가입
		MemberDto member = MemberDto.builder()
											.id(UUID.randomUUID().toString().substring(0, 12))
											.pw("test")
											.name("몰라")
											.phone("01011111111")
											.email("test@gmail.com")
											.nick("테스트")
											.pets("아니오")
											.post("00000")
											.basic_addr("aaa")
											.extra_addr("aaa")
										.build();
		sqlSession.insert("member.regist", member);
		
		//펫시터 생성
		int seq = sqlSession.selectOne("petsitter.getSequence");
		PetsitterDto sitter = PetsitterDto.builder()
											.pet_sitter_no(seq)
											.sitter_id(member.getId())
											.info("저는 펫시터 테스트중입니다2")
											.sitter_pets("아니오")
											.sitter_matching_type("둘다")
											.build();
		sqlSession.insert("petsitter.testRegist", sitter);
		
		List<SkillsDto> skills = new ArrayList<>();
		skills.add(SkillsDto.builder().skills_name(1).skills_sitter_no(seq).build());
		skills.add(SkillsDto.builder().skills_name(2).skills_sitter_no(seq).build());
		skills.add(SkillsDto.builder().skills_name(3).skills_sitter_no(seq).build());
		skills.add(SkillsDto.builder().skills_name(4).skills_sitter_no(seq).build());
		
//		for(SkillsDto sdto : skills) {
//			sqlSession.insert("petsitter.testSkillRegist", sdto);
//		}
		
		sqlSession.insert("petsitter.testSkillRegist2", skills);
		
	}
}







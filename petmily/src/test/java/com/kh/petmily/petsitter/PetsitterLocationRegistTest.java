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

import com.kh.petmily.entity.LocationDto;
import com.kh.petmily.entity.MemberDto;
import com.kh.petmily.entity.PetsitterDto;

import lombok.extern.slf4j.Slf4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {
	"file:src/main/webapp/WEB-INF/spring/root-context.xml",
	"file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml"
})
@WebAppConfiguration
@Slf4j
public class PetsitterLocationRegistTest {
	@Autowired
	private SqlSession sqlSession;
	
	@Test
	public void locationTest() {
		log.info("sqlSession = {}", sqlSession);
		
		//회원가입
		MemberDto member = MemberDto.builder()
											.id(UUID.randomUUID().toString().substring(0, 12))
											.pw("test1017")
											.name("test1017")
											.phone("01012875964")
											.email("test1017@gmail.com")
											.nick("test1017")
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
											.info("저는 펫시터 지역 테스트중입니다")
											.sitter_pets("아니오")
											.sitter_matching_type("둘다")
											.build();
		sqlSession.insert("petsitter.testRegist", sitter);
		

		List<LocationDto> locationList = new ArrayList<>();
		locationList.add(LocationDto.builder().location_sitter_no(seq).city("울산광역시").area("동구").build());
		locationList.add(LocationDto.builder().location_sitter_no(seq).city("울산광역시").area("중구").build());
		locationList.add(LocationDto.builder().location_sitter_no(seq).city("울산광역시").area("울주군").build());
		
//		for(LocationDto dto : locationList) {
//			sqlSession.insert("petsitter.registLocation1", dto);			
//		}
		
		sqlSession.insert("petsitter.registLocation", locationList);	
		
		log.info("locationList = {}", locationList);
	}
}

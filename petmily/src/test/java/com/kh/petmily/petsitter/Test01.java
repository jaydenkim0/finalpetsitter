package com.kh.petmily.petsitter;

import org.apache.ibatis.session.SqlSession;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import com.kh.petmily.entity.PetsitterDto;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {
	"file:src/main/webapp/WEB-INF/spring/root-context.xml",
	"file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml"
})
@WebAppConfiguration
public class Test01 {
	
	@Autowired
	private SqlSession sqlSession;
	
	@Test
	public void registTest() {
		PetsitterDto petsitterDto = PetsitterDto.builder()
												.sitter_id("hello")
												.info("저는 펫시터 테스트중입니다2")
												.sitter_pets("예")
												.care_condition("원룸")
												.build();
		sqlSession.insert("petsitter.regist", petsitterDto);
	}

}

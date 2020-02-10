package com.kh.petmily.petsitter;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import com.kh.petmily.entity.LocationDto;

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

		List<LocationDto> locationList = new ArrayList<>();
		locationList.add(LocationDto.builder().location_sitter_no(58).city("서울특별시").area("구로구").build());

		sqlSession.insert("petsitter.registLocation", locationList);
	}
}

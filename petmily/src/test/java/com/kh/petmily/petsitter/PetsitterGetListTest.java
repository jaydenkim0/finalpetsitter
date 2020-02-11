package com.kh.petmily.petsitter;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import com.kh.petmily.vo.petsitter.PetsitterGetVO;

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
	
	@Test
	public void getList() {
		List<PetsitterGetVO> petsitterList = sqlSession.selectList("petsitter.regist", "aaaa");
		log.info("petsitter = {}", petsitterList);
	}

}

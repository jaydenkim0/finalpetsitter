package com.kh.petmily.petsitter;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import com.kh.petmily.entity.PetDto;
import com.kh.petmily.repository.MemberDao;

import lombok.extern.slf4j.Slf4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {
	"file:src/main/webapp/WEB-INF/spring/root-context.xml",
	"file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml"
})
@WebAppConfiguration
@Slf4j
public class Test02 {
	@Autowired
	private SqlSession sqlSession;
	@Autowired
	private MemberDao memberDao;
	@Test
	public void Test() {
		String id = "test";
		List<PetDto> list = memberDao.mylistpet(id);
		System.out.println(list);
	}
}

package com.kh.petmily.qna;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.junit.Ignore;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import com.kh.petmily.vo.QnaVO;

import lombok.extern.slf4j.Slf4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {
	"file:src/main/webapp/WEB-INF/spring/root-context.xml",
	"file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml"
})
@WebAppConfiguration
@Slf4j
public class QnaSelectTest {
	
	@Autowired
	private SqlSession sqlSession;
	
	@Test
	public void test() {
		Map<String, Object> param = new HashMap<>();
		param.put("start", 1);
		param.put("finish", 10);
		List<QnaVO> list = sqlSession.selectList("qna.getList", param);
		log.info("list = {}", list.size());
	}
	
//	@Test
	public void select1() {
		List<QnaVO> list = sqlSession.selectList("qna.test_select1");
		for(QnaVO vo : list) {
			log.info("vo = {}", vo.getQna_no());
		}
	}
	
//	@Test
	public void select2() {
		List<QnaVO> list = sqlSession.selectList("qna.test_select2");
		for(QnaVO vo : list) {
			log.info("vo = {}", vo.getQna_no());
		}
	}
	
//	@Test
	public void select3() {
		List<QnaVO> list = sqlSession.selectList("qna.test_select4");
		for(QnaVO vo : list) {
			log.info("vo = {}", vo.getQna_no());
		}
	}
	
}

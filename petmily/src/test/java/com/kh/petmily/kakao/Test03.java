package com.kh.petmily.kakao;

import org.apache.ibatis.session.SqlSession;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import com.kh.petmily.entity.PayDto;

import lombok.extern.slf4j.Slf4j;
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {
	"file:src/main/webapp/WEB-INF/spring/root-context.xml",
	"file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml"
})
@WebAppConfiguration
@Slf4j
public class Test03 {

	@Autowired
	private SqlSession sqlSession;

	@Test
	public void readyTest() {
		com.kh.petmily.entity.PayDto payDto = PayDto.builder()
												.aid("A272131123123")
												.cid("TC0ONETIME")
												.tid("T0123456")
												.partner_order_id("13")
												.partner_user_id("163")
												.process_time("2020-02-18T14:59:01")
												.item_name("죠르디와앙몬드")
												.quantity(1)
												.total_amount(10000)
												.build();
		sqlSession.insert("pay.ready", payDto);
	}

}

package com.kh.petmily.kakao;

import java.net.URISyntaxException;
import java.util.UUID;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import com.kh.petmily.service.kakao.PayService;
import com.kh.petmily.vo.kakao.KakaoPayReadyReturnVO;
import com.kh.petmily.vo.kakao.KakaoPayReadyVO;

import lombok.extern.slf4j.Slf4j;

//스프링 환경을 연동해서 KakaoPayService의 ready가 정상 작동하는지 테스트
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {
	"file:src/main/webapp/WEB-INF/spring/root-context.xml",
	"file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml"
})
@WebAppConfiguration
@Slf4j
public class Test02 {
	
	@Autowired
	private PayService payService;
	
	@Test
	public void test() throws URISyntaxException {
		//KakaoPayReadyVO를 준비해서 결제요청을 진행
		
		KakaoPayReadyVO vo = KakaoPayReadyVO.builder()
									.partner_order_id(String.valueOf("13"))
									.partner_user_id("163")
									.item_name("죠르디")
									.quantity(1)
									.total_amount(9900)
									.vat_amount(990)
									.build();
		
		KakaoPayReadyReturnVO result = 
					(KakaoPayReadyReturnVO) payService.ready(vo);
		log.info("주소 = {}", result.getNext_redirect_pc_url());
	}
	
}

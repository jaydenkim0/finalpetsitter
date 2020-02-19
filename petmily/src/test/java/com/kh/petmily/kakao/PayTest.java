package com.kh.petmily.kakao;

import java.net.URI;
import java.net.URISyntaxException;
import java.util.UUID;

import org.apache.ibatis.session.SqlSession;
import org.junit.Ignore;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.client.RestTemplate;

import com.kh.petmily.vo.kakao.KakaoPayReadyReturnVO;

import lombok.extern.slf4j.Slf4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {
	"file:src/main/webapp/WEB-INF/spring/root-context.xml",
	"file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml"
})
@WebAppConfiguration
@Slf4j
public class PayTest {

	@Autowired
	private SqlSession sqlSession;
	
	@Test
	public void test() throws URISyntaxException {
		//시퀀스 번호 추출
		int partner_order_id = sqlSession.selectOne("pay.getSequence");
		log.info("partner_order_id = {}", partner_order_id);
		
		//결제 준비 요청
		RestTemplate template = new RestTemplate();
		
		HttpHeaders headers = new HttpHeaders();
		headers.add("Authorization","KakaoAK 7caff61c668bf36a40a0a9fa52ebef7d");
		headers.add("Content-Type", "application/x-www-form-urlencoded;charset=utf-8");
		headers.add("Accept", MediaType.APPLICATION_JSON_UTF8_VALUE);
		
		MultiValueMap<String, String> body = new LinkedMultiValueMap<>();
		body.add("cid", "TC0ONETIME");//가맹점 번호 (개발자용 테스트 값)
		body.add("partner_order_id", String.valueOf(partner_order_id));
		body.add("partner_user_id", "1500");//사용자 번호
		body.add("item_name", "죠르디잉");//상품명
		body.add("quantity", "3");//상품 수량
		body.add("total_amount", "100000");//상품판매가
		body.add("vat_amount", "10000");//부가세 (생략 가능)
		body.add("tax_free_amount", "0");//비과세 금액
		body.add("approval_url", "http://localhost:8080/petmily/pay/success");//성공주소
		body.add("fail_url", "http://localhost:8080/petmily/pay//fail");//실패주소
		body.add("cancel_url", "http://localhost:8080/petmily/pay/cancel");//취소 주소
		
		HttpEntity<MultiValueMap<String, String>> entity = 
				new HttpEntity<>(body, headers);
		
		URI uri = new URI("https://kapi.kakao.com/v1/payment/ready");
		
		KakaoPayReadyReturnVO vo = 
				template.postForObject(uri, entity, KakaoPayReadyReturnVO.class);
		log.info("url = {}", vo.getNext_redirect_pc_url());
	}
	
}

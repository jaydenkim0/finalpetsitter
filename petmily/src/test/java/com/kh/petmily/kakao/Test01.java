package com.kh.petmily.kakao;
import java.net.URI;
import java.net.URISyntaxException;
import java.util.UUID;

//PG사에 결제 준비를 요청
// 서버에서 다른 서버를 신호를 보내야 함
import org.junit.Test;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.client.RestTemplate;

import com.kh.petmily.vo.kakao.KakaoPayReadyReturnVO;

import lombok.extern.slf4j.Slf4j;
@Slf4j
public class Test01 {
	@Test
	public void requestPay() throws URISyntaxException {
		log.info("결제 요청 시작 ! ");
		
		//요청 전송 및 응답 수신 도구
		//필요한 모든 정보를 설정한 뒤 전송 (Post)
		RestTemplate template = new RestTemplate();
		
		//헤더 : Authorization 정보 (admin 키 추가)
		HttpHeaders headers = new HttpHeaders();
		headers.add("Authorization","KakaoAK 7caff61c668bf36a40a0a9fa52ebef7d");
		headers.add("Content-Type", "application/x-www-form-urlencoded;charset=utf-8");
		headers.add("Accept", MediaType.APPLICATION_JSON_UTF8_VALUE);
		
		//바디 : 결제와 관련된 정보 (가맹점, 거래번호, 사용자번호, 상품명 ...)
		MultiValueMap<String, String> body = new LinkedMultiValueMap<>();
		body.add("cid", "TC0ONETIME");//가맹점 번호 (개발자용 테스트 값)
		body.add("partner_order_id", UUID.randomUUID().toString());//(주문번호- 현재는 편의상 랜덤 설정)
		body.add("partner_user_id", "1000");//사용자 번호
		body.add("item_name", "죠르디잉");//상품명
		body.add("quantity", "3");//상품 수량
		body.add("total_amount", "100000");//상품판매가
		body.add("vat_amount", "10000");//부가세 (생략 가능)
		body.add("tax_free_amount", "0");//비과세 금액
		body.add("approval_url", "http://localhost:8080/petmily/pay/success");//성공주소
		body.add("fail_url", "http://localhost:8080/petmily/pay//fail");//실패주소
		body.add("cancel_url", "http://localhost:8080/petmily/pay/cancel");//취소 주소
		
		//헤더 + 바디 = HttpEntity
		HttpEntity<MultiValueMap<String, String>> entity = 
				new HttpEntity<>(body, headers);
		
		//요청주소 생성
		URI uri = new URI("https://kapi.kakao.com/v1/payment/ready");
		
//		전송 및 응답 저장(KakaoPayReadyReturnVO)
		KakaoPayReadyReturnVO vo = 
				template.postForObject(uri, entity, KakaoPayReadyReturnVO.class);
		log.info("vo = {}", vo);
		log.info("주소 = {}", vo.getNext_redirect_pc_url());
	}
	
}

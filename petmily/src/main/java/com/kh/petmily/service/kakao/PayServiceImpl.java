package com.kh.petmily.service.kakao;

import java.net.URI;
import java.net.URISyntaxException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Service;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.servlet.support.ServletUriComponentsBuilder;

import com.kh.petmily.entity.PayDto;
import com.kh.petmily.repository.kakao.PayDao;
import com.kh.petmily.vo.kakao.KakaoPayReadyReturnVO;
import com.kh.petmily.vo.kakao.KakaoPayReadyVO;
import com.kh.petmily.vo.kakao.KakaoPayRevokeReturnVO;
import com.kh.petmily.vo.kakao.KakaoPaySuccessReadyVO;
import com.kh.petmily.vo.kakao.KakaoPaySuccessReturnVO;
import com.kh.petmily.vo.kakao.PayReadyReturnVO;
import com.kh.petmily.vo.kakao.PayReadyVO;

@Service
public class PayServiceImpl implements PayService{
	
	@Autowired
	private PayDao payDao;

	@Override
	public PayReadyReturnVO ready(PayReadyVO kpayReadyVO) throws URISyntaxException {
//		요청 전송 및 응답 수신 도구
//		- 필요한 모든 정보를 설정한 뒤 전송(POST)
		RestTemplate template = new RestTemplate();
		
//		- 헤더 : Authorization 정보(admin 키 추가)
		HttpHeaders headers = new HttpHeaders();
		headers.add("Authorization", "KakaoAK 7caff61c668bf36a40a0a9fa52ebef7d");
		headers.add("Content-Type", MediaType.APPLICATION_FORM_URLENCODED_VALUE+"; charset=utf-8");
		headers.add("Accept", MediaType.APPLICATION_JSON_UTF8_VALUE);
		
//		- 바디 : 결제와 관련된 정보(가맹점, 거래번호, 사용자번호, 상품명, ...)
		MultiValueMap<String, String> body = new LinkedMultiValueMap<>();
		body.add("cid", "TC0ONETIME");//가맹점번호(개발자용 테스트값)
		body.add("partner_order_id",kpayReadyVO.getPartner_order_id());//주문번호
		body.add("partner_user_id", kpayReadyVO.getPartner_user_id());//사용자번호
		body.add("item_name", kpayReadyVO.getItem_name());//상품명
		body.add("quantity", String.valueOf(kpayReadyVO.getQuantity()));//상품수량
		body.add("total_amount", String.valueOf(kpayReadyVO.getTotal_amount()));//상품판매가
		body.add("vat_amount", String.valueOf(kpayReadyVO.getVat_amount()));//부가세액(생략가능)
		body.add("tax_free_amount", String.valueOf(kpayReadyVO.getTax_free_amount()));//비과세액
		
		//주소 생성
		String baseUrl = ServletUriComponentsBuilder
									.fromCurrentContextPath()
									.port(8080)
									.path("/pay/")
									.toUriString();
		body.add("approval_url", baseUrl + "success");
		body.add("fail_url", baseUrl + "fail");
		body.add("cancel_url", baseUrl + "cancel");
		
//		헤더+바디
		HttpEntity<MultiValueMap<String, String>> entity
											= new HttpEntity<>(body, headers);
		
//		요청주소 생성
		URI uri = new URI("https://kapi.kakao.com/v1/payment/ready");
		
//		전송 및 응답 저장(KakaoPayReadyReturnVO)
		KakaoPayReadyReturnVO returnVO = 
				template.postForObject(uri, entity, KakaoPayReadyReturnVO.class);
		
// 	DB관련 등록 처리 (카카오페이에 결제준비 요청을 전송한 이후)
		PayDto payDto = PayDto.builder()
				.cid("TC0ONETIME")
				.tid(returnVO.getTid())
				.partner_order_id(String.valueOf(kpayReadyVO.getPartner_order_id()))
				.partner_user_id(kpayReadyVO.getPartner_user_id())
				.process_time(returnVO.getCreated_at())
				.item_name(kpayReadyVO.getItem_name())
				.quantity(kpayReadyVO.getQuantity())
				.total_amount(kpayReadyVO.getTotal_amount())
				.build();
		payDao.insertReady(payDto);
		return returnVO;
	}

	@Override
	public KakaoPaySuccessReturnVO approve(KakaoPaySuccessReadyVO kpaySuccessReadyVO) throws URISyntaxException {
		RestTemplate template = new RestTemplate();
		
//		- 헤더 : Authorization 정보(admin 키 추가)
		HttpHeaders headers = new HttpHeaders();
		headers.add("Authorization", "KakaoAK 7caff61c668bf36a40a0a9fa52ebef7d");
		headers.add("Content-Type", MediaType.APPLICATION_FORM_URLENCODED_VALUE+"; charset=utf-8");
		headers.add("Accept", MediaType.APPLICATION_JSON_UTF8_VALUE);
		
//		- 바디 : 결제와 관련된 정보(가맹점, 거래번호, 사용자번호, 상품명, ...)
		MultiValueMap<String, String> body = new LinkedMultiValueMap<>();
		body.add("cid", kpaySuccessReadyVO.getCid());//가맹점번호(개발자용 테스트값)
		body.add("tid", kpaySuccessReadyVO.getTid());
		body.add("partner_order_id", String.valueOf(kpaySuccessReadyVO.getPartner_order_id()));
		body.add("partner_user_id", kpaySuccessReadyVO.getPartner_user_id());
		body.add("pg_token", kpaySuccessReadyVO.getPg_token());
		
//		헤더+바디
		HttpEntity<MultiValueMap<String, String>> entity
											= new HttpEntity<>(body, headers);
		
//		요청주소 생성
		URI uri = new URI("https://kapi.kakao.com/v1/payment/approve");
		
//		전송 및 응답 저장(KakaoPayReadyReturnVO)
		KakaoPaySuccessReturnVO returnVO = 
				template.postForObject(uri, entity, KakaoPaySuccessReturnVO.class);
		
//		DB 승인 완료 처리
		PayDto payDto = PayDto.builder()
				.aid(returnVO.getAid())
				.tid(returnVO.getTid())
				.cid(returnVO.getCid())
				.partner_order_id(String.valueOf(returnVO.getPartner_order_id()))
				.partner_user_id(returnVO.getPartner_user_id())
				.process_time(returnVO.getCreated_at())
				.item_name(returnVO.getItem_name())
				.quantity(returnVO.getQuantity())
				.total_amount(returnVO.getAmount().getTotal())
				.build();
		payDao.insertSuccess(payDto);
		return returnVO;
	}

	@Override
	public KakaoPayRevokeReturnVO revoke(int pay_no) throws URISyntaxException {
		//		단일 조회
		PayDto payDto = payDao.get(pay_no);
		
		//		취소 요청
		RestTemplate template = new RestTemplate();
		
		HttpHeaders header = new HttpHeaders();
		header.add("Authorization", "KakaoAK 7caff61c668bf36a40a0a9fa52ebef7d");
		header.add("Content-Type", "application/x-www-form-urlencoded; charset=UTF-8");
		header.add("Accept", "application/json; charset=UTF-8");
		
		MultiValueMap<String, String> body = new LinkedMultiValueMap<>();
		body.add("cid", payDto.getCid());
		body.add("tid", payDto.getTid());
		body.add("cancel_amount", String.valueOf(payDto.getTotal_amount()));
		body.add("cancel_tax_free_amount", "0");
//		body.add("cancel_vat_amount", ?);
		body.add("cancel_available_amout", String.valueOf(payDto.getTotal_amount()));
		
		HttpEntity<MultiValueMap<String, String>> entity = 
											new HttpEntity<>(body, header);
		
		URI uri = new URI("https://kapi.kakao.com/v1/payment/cancel");
		
		KakaoPayRevokeReturnVO kpayRevokeReturnVO = 
				template.postForObject(uri, entity, KakaoPayRevokeReturnVO.class);
		
//		취소 등록
		PayDto paycancelDto = PayDto.builder()
				.aid(kpayRevokeReturnVO.getAid())
				.tid(kpayRevokeReturnVO.getTid())
				.cid(kpayRevokeReturnVO.getCid())
				.partner_order_id(String.valueOf(kpayRevokeReturnVO.getPartner_order_id()))
				.partner_user_id(kpayRevokeReturnVO.getPartner_user_id())
				.process_time(kpayRevokeReturnVO.getCanceled_at())
				.item_name(kpayRevokeReturnVO.getItem_name())
				.quantity(kpayRevokeReturnVO.getQuantity())
				.total_amount(-1 * kpayRevokeReturnVO.getCanceled_amount().getTotal())		
				.build();
		payDao.insertRevoke(paycancelDto);
		
		return kpayRevokeReturnVO;
	}

	@Override
	public List<PayDto> getPay(int partner_order_id) {
		return payDao.getPay(partner_order_id);
	}

	@Override
	public int getHourPayment() {
		return payDao.getHourPayment();
	}

	// 결제완료 되었는지 확인
	@Override
	public int check(int reservation_no) {	
		return payDao.check(reservation_no);
	}
}

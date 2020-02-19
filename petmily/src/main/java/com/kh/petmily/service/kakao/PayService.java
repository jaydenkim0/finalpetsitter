package com.kh.petmily.service.kakao;

import java.net.URISyntaxException;

import com.kh.petmily.vo.kakao.KakaoPayRevokeReturnVO;
import com.kh.petmily.vo.kakao.KakaoPaySuccessReadyVO;
import com.kh.petmily.vo.kakao.KakaoPaySuccessReturnVO;
import com.kh.petmily.vo.kakao.PayReadyReturnVO;
import com.kh.petmily.vo.kakao.PayReadyVO;

public interface PayService {

	PayReadyReturnVO ready(PayReadyVO kpayReadyVO) throws URISyntaxException;
	KakaoPaySuccessReturnVO approve(KakaoPaySuccessReadyVO kpaySuccessReadyVO) throws URISyntaxException;
	KakaoPayRevokeReturnVO revoke(int pay_no) throws URISyntaxException;

}

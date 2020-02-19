package com.kh.petmily.vo.kakao;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @Builder
@NoArgsConstructor
@AllArgsConstructor
public class KakaoPayAmountVO {
	private int total, //	전체 결제 금액
	tax_free, //	비과세 금액
	vat, //부가세 금액
	point, //	사용한 포인트 금액
	discount;//	할인 금액
}

package com.kh.petmily.vo.kakao;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @Builder
@NoArgsConstructor
@AllArgsConstructor
public class KakaoPaySuccessReadyVO {
	private String cid, //가맹점 코드
	tid, //	결제 고유 번호
	partner_user_id,//	가맹점 회원 id
	pg_token;//
	private String partner_order_id;//	가맹점 주문번호
}

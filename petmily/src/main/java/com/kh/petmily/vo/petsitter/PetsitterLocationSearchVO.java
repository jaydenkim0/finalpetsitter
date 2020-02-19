package com.kh.petmily.vo.petsitter;

import java.util.List;

import com.kh.petmily.entity.LocationDto;
import com.kh.petmily.entity.MemberImageDto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @Builder @NoArgsConstructor @AllArgsConstructor
public class PetsitterLocationSearchVO {
	private int pet_sitter_no;
	private String nick;
	private String info;
	//회원 프로필 이미지
	private int member_image_no;
	private String member_image_member_id;
	
	private List<LocationDto> list;
}

package com.kh.petmily.vo.petsitter;

import com.kh.petmily.entity.MemberDto;
import com.kh.petmily.entity.PetDto;
import com.kh.petmily.entity.PetsitterDto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data 
@Builder 
@NoArgsConstructor 
@AllArgsConstructor
public class PetsitterGetVO {
	//뷰 이름 : petsitter 
	//회원 정보
	private MemberDto memberDto;
	
	//펫시터 정보 
	private PetsitterDto petsitterDto;
	
	//뷰 이름 : memberpets
	//펫정보
	private PetDto petDto;
	
	//뷰 이름 : petsitter_skills
	//스킬
	private int skills_sitter_no; // pet_sitter 테이블의 pet_sitter_no
	private int skill_no; // 해당 기능을 스킬넘버로 pet_sitter 와 연결
	private String skill_name; // 노령케어, 투약가능 등등
	
	//뷰 이름 : petsitter_care_condition
	//돌봄환경
	private int condition_sitter_no; // pet_sitter 테이블의 pet_sitter_no
	private int care_condition_no;
	private String care_condition_name;
	
	//뷰 이름 : petsitter_care_pet_type
	//돌봄 가능한 동물 종류
	private int care_sitter_no; // pet_sitter 테이블의 pet_sitter_no
	private int care_type_no; // 해당 돌봄 가능한 동물을 no 로 pet_sitter 와 연결
	private String care_type; // 펫시터가 돌봄 가능한 동물들
	
	//뷰 이름 : sitterlocation
	//활동 지역
	private int location_no;
	private int location_sitter_no; // pet_sitter의 pet_sitter_no
	private String city; // 광역시
	private String area; // 자치구 및 구 저장할 공간
	
}

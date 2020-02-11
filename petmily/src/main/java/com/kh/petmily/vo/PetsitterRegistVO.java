package com.kh.petmily.vo;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import com.kh.petmily.entity.IdCardFileDto;
import com.kh.petmily.entity.InfoImageDto;
import com.kh.petmily.entity.LicenseFileDto;
import com.kh.petmily.entity.LocationDto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data 
@NoArgsConstructor 
@AllArgsConstructor 
@Builder
public class PetsitterRegistVO {
	
	//펫시터 기본 
	private int pet_sitter_no; //펫시터 번호
	private String sitter_id; // member 테이블의 id 
	private String info; // 소개글
	private String sitter_pets; // 반려동물 여부 '예', '아니오' 만 등록가능	
	private String sitter_status; // '정상' 또는 '휴면' 만등록가능	
	private String sitter_terms_agree; // 펫시터 이용약관 동의, 무조건 'true' 일때 만 가입가능
	private String sitter_joindate; // 시터 가입일
	private String sitter_matching_type;// '방문서비스', '위탁서비스', '둘다' 만 작성가능
	
	//펫시터 돌봄 환경
	private List<Integer>care_condition_name; // care_condition_name 테이블의 care_condition_no
	private int condition_sitter_no; // pet_sitter 테이블의 pet_sitter_no
	
	//펫시터 스킬
	private List<Integer> skills_name; // skill_name 테이블의 skill_no
	private int skills_sitter_no; // pet_sitter 테이블의 pet_sitter_no
	
	//돌봄가능 동물 종류
	private List<Integer>care_name;// care_pet_type_name 테이블의 care_type_no 
	private int care_sitter_no; // pet_sitter 테이블의 pet_sitter_no
	
	//소개이미지
	private List<MultipartFile>info_image;

	//신분증
	private MultipartFile id_card_file;

	//증빙서류
	private MultipartFile license_file;
	
	//지역
	private List<LocationDto> location_name; //지역 List
						//-> location_name.city/location_name.area
	
	
}

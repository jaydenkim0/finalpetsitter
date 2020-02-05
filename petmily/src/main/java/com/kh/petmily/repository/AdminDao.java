package com.kh.petmily.repository;

import java.util.List;

import com.kh.petmily.entity.MemberDto;
import com.kh.petmily.entity.PetsitterDto;
import com.kh.petmily.vo.PetsitterVO;

public interface AdminDao {

	int getMtotal();
	
	int getPtotal();
	
	int getAtotal();
	
	// 회원 리스트
	List<MemberDto> getMemberList(MemberDto memberDto);

	// 펫시터 리스트
	List<PetsitterVO> getPetsitterList();

	// 펫시터 신청 리스트
	List<PetsitterVO> getPetsitterApplyList();
	
	// 펫시터 승인
	void petsitterApply(String sitter_id);
	
	// 펫시터 거부 (삭제)
	void petsitterNegative(String sitter_id);

	// 펫시터 단일 검색
	List<PetsitterVO> petsitterSearchOne(String sitter_id);

	// 펫시터 차단 (블랙리스트 등록)
	void blackSitter(PetsitterDto petsitterDto, PetsitterVO petsitterVO);

	

}

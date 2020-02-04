package com.kh.petmily.repository;

import java.util.List;

import com.kh.petmily.entity.MemberDto;
import com.kh.petmily.entity.PetsitterDto;

public interface AdminDao {

	int getMtotal();
	
	int getPtotal();
	
	int getAtotal();
	
	// 회원 리스트
	List<MemberDto> getMemberList(MemberDto memberDto);

	// 펫시터 리스트
	List<PetsitterDto> getPetsitterList(PetsitterDto petsitterDto);

	// 펫시터 신청 리스트
	List<PetsitterDto> getPetsitterApplyList(PetsitterDto petsitterDto);
	
	// 펫시터 승인
	void petsitterApply(String sitter_id);
	

}

package com.kh.petmily.service;

import java.util.List;

import com.kh.petmily.entity.MemberDto;
import com.kh.petmily.entity.PetsitterDto;
import com.kh.petmily.vo.PetsitterVO;

public interface AdminService {
	
	// 총 회원수
	int memberTotal();
	// 총 펫시터 수 
	int petsitterTotal();
	// 총 관리자 수
	int admimTotal();

	// 회원 리스트
	List<MemberDto> memberList(MemberDto memberDto);
	
	// 펫시터 리스트
	List<PetsitterVO> petsitterList();
	
	// 펫시터 신청 리스트
	List<PetsitterVO> petsitterApplyList();
	
	// 펫시터 승인
	void petsitterapply(String sitter_id);
	
	// 펫시터 거부
	void petsitterNegative(String sitter_id);
	
	// 펫시터 단일 검색
	List<PetsitterVO> PetsitterSearchOne(String sitter_id);
	
}

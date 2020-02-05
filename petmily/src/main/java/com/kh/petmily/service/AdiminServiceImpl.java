package com.kh.petmily.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.petmily.entity.MemberDto;
import com.kh.petmily.entity.PetsitterDto;
import com.kh.petmily.repository.AdminDao;
import com.kh.petmily.vo.PetsitterVO;

@Service
public class AdiminServiceImpl implements AdminService {

	@Autowired
	private AdminDao adminDao;
	
	// 총 회원 카운트
	@Override
	public int memberTotal() {
		return adminDao.getMtotal();
	}
	
	// 총 펫시터 카운트
	@Override
	public int petsitterTotal() {
		return adminDao.getPtotal();
	}
	
	// 총 관리자 카운트
	@Override
	public int admimTotal() {
		return adminDao.getAtotal();
	}
	
	// member 리스트
	@Override
	public List<MemberDto> memberList(MemberDto memberDto) {		
		return adminDao.getMemberList(memberDto);
	}

	// petsitter 리스트
	@Override
	public List<PetsitterVO> petsitterList( ) {		
		return adminDao.getPetsitterList();
	}
	
	// 펫시터 신청 리스트
	@Override
	public List<PetsitterVO> petsitterApplyList( ) {		
		return adminDao.getPetsitterApplyList();
	}
	
	// 펫시터 승인
	@Override
	public void petsitterapply(String sitter_id) {
		adminDao.petsitterApply(sitter_id);		
	}

	// 펫시터 거부(삭제)
	@Override
	public void petsitterNegative(String sitter_id) {
		adminDao.petsitterNegative(sitter_id);
		
	}

	// 펫시터 단일 검색
	@Override
	public List<PetsitterVO>PetsitterSearchOne(String sitter_id) {
		return adminDao.petsitterSearchOne(sitter_id);
	}

	// 펫시터 차단 기능
	@Override
	public void blackSitter(PetsitterDto petsitterDto, String blacklist_centent) {
		// 펫시터 상태 휴면으로 변경		
		// 펫시터 단일 검색으로 정보 갖고 오기
		String sitter_id = petsitterDto.getSitter_id();
		PetsitterVO petsitterVO = (PetsitterVO) adminDao.petsitterSearchOne(sitter_id);
		petsitterVO.setBlacklist_content(blacklist_centent);
		// 블랙시트 테이블에 등록
		adminDao.blackSitter(petsitterDto, petsitterVO);
	}




}

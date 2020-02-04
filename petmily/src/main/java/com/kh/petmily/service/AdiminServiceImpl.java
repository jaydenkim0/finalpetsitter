package com.kh.petmily.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.petmily.entity.MemberDto;
import com.kh.petmily.entity.PetsitterDto;
import com.kh.petmily.repository.AdminDao;

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
	public List<PetsitterDto> petsitterList(PetsitterDto petsitterDto) {		
		return adminDao.getPetsitterList(petsitterDto);
	}
	
	// 펫시터 신청 리스트
	@Override
	public List<PetsitterDto> petsitterApplyList(PetsitterDto petsitterDto) {		
		return adminDao.getPetsitterApplyList(petsitterDto);
	}
	
	// 펫시터 승인
	@Override
	public void petsitterapply(String sitter_id) {
		adminDao.petsitterApply(sitter_id);		
	}



}

package com.kh.petmily.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.petmily.entity.MemberDto;
import com.kh.petmily.repository.AdminDao;

@Service
public class AdiminServiceImpl implements AdminService {

	@Autowired
	private AdminDao adminDao;
	
	// 회원 리스트
	@Override
	public int memberTotal() {
		return adminDao.getMtotal();
	}
	
	@Override
	public int petsitterTotal() {
		return adminDao.getPtotal();
	}
	
	@Override
	public int admimTotal() {
		return adminDao.getAtotal();
	}
	
	@Override
	public List<MemberDto> memberList(MemberDto memberDto) {		
		return adminDao.getMemberList(memberDto);
	}



}

package com.kh.petmily.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.petmily.entity.MemberDto;
import com.kh.petmily.repository.MemberDao;

@Service
public class MemberServiceImpl implements MemberService {

	@Autowired
	private MemberDao memberDao;
	
	@Override
	public void regist(MemberDto memberDto) {
		memberDao.regist(memberDto);
	}

	@Override	
		public MemberDto login(MemberDto memberDto) {					 
			return memberDao.login(memberDto);	

		}
	
	//내정보조회
	@Override
	public List<MemberDto> mylist(String id) {		
		return memberDao.mylist(id);
	}
	
	}


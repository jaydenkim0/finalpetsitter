package com.kh.petmily.repository;

import java.util.List;

import com.kh.petmily.entity.MemberDto;
import com.kh.petmily.entity.PetsitterDto;

public interface AdminDao {

	int getMtotal();
	
	int getPtotal();
	
	int getAtotal();
	
	List<MemberDto> getMemberList(MemberDto memberDto);

	List<PetsitterDto> getPetsitterList(PetsitterDto petsitterDto);

	
	

}

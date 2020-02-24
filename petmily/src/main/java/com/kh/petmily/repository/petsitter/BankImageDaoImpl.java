package com.kh.petmily.repository.petsitter;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.petmily.entity.BankImageDto;

@Repository
public class BankImageDaoImpl implements BankImageDao {

	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public void uploadBank(BankImageDto bankImageDto) {
		sqlSession.insert("petsitter.registBank", bankImageDto);
	}

	@Override
	public void deleteBankImage(int pet_sitter_no) {
		sqlSession.delete("petsitter.deleteBankImage", pet_sitter_no);
		
	}

}

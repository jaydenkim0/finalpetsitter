package com.kh.petmily.repository.petsitter;

import com.kh.petmily.entity.BankImageDto;

public interface BankImageDao {
	//통장 사본 이미지 등록
	void uploadBank(BankImageDto bankImageDto);
	//통장 사본 이미지 삭제
	void deleteBankImage(int pet_sitter_no);
}

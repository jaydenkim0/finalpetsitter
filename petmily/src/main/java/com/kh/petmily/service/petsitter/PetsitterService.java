package com.kh.petmily.service.petsitter;

import java.io.IOException;

import com.kh.petmily.vo.petsitter.PetsitterRegistVO;

public interface PetsitterService {
	void regist(PetsitterRegistVO vo) throws IllegalStateException, IOException;
}

package com.kh.petmily.service.petsitter;

import java.io.IOException;
import java.util.List;

import com.kh.petmily.vo.petsitter.PetsitterGetListVO;
import com.kh.petmily.vo.petsitter.PetsitterRegistVO;

public interface PetsitterService {
	void regist(PetsitterRegistVO vo) throws IllegalStateException, IOException;
	List<PetsitterGetListVO> getList(String id);
}

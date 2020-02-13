package com.kh.petmily.service.petsitter;

import java.io.IOException;
import java.util.List;

import com.kh.petmily.vo.petsitter.PetsitterGetListVO;
import com.kh.petmily.vo.petsitter.PetsitterRegistVO;
import com.kh.petmily.vo.petsitter.PetsitterVO;
import com.kh.petmily.vo.petsitter.SitterlocationVO;

public interface PetsitterService {
	void regist(PetsitterRegistVO vo) throws IllegalStateException, IOException;
	List<PetsitterGetListVO> getList(int pet_sitter_no);
	
	// 리스트 불러오기
	List<SitterlocationVO> locationListAll(int start, int end, String cityKeyword, String areaKeyword);
	// 카운트
	int countlocation(String cityKeyword, String areaKeyword);
}

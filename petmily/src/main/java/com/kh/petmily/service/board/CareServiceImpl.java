package com.kh.petmily.service.board;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.petmily.entity.CareDto;
import com.kh.petmily.repository.CareDao;

@Service
public class CareServiceImpl implements CareService{

	@Autowired
	private CareDao careDao;

	//게시글 목록
	@Override
	public List<CareDto> list() {
		return careDao.list();
	}

}

package com.kh.petmily.service.petsitter;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class PetsitterServiceImpl implements PetsitterService {

	@Autowired
	private SqlSession sqlSession;
	
	

}

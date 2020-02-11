package com.kh.petmily.service.board;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.petmily.entity.ReviewDto;
import com.kh.petmily.repository.ReviewDao;
@Service
public class ReviewServiceImpl implements ReviewService{
	@Autowired
	private ReviewDao reviewDao;
	
	@Override
	public List<ReviewDto> list() throws Exception{
		return reviewDao.list();
	}

}

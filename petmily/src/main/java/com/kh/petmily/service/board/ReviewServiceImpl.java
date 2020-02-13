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
	
	// 리스트	
	@Override
	public List<ReviewDto> list()  {
		return reviewDao.list();
	}

	@Override
	public void delete(int review_no) throws Exception {
	    reviewDao.delete(review_no);
		
	}





	}

	

	
	

//	// 게시글 조회
//	@Override
//	public List<ReviewDto> listSearch(int review_sitter_no) {	
//		System.out.println("service"+review_sitter_no);
//		return reviewDao.listSearch(review_sitter_no);
//	}

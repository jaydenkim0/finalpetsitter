package com.kh.petmily.service.board;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.kh.petmily.repository.QnaReplyDao;
import com.kh.petmily.vo.QnaReplyVO;

public class QnaReplyServiceImpl implements QnaReplyService{
	
	@Autowired
	QnaReplyService qnaReplyService;
	
	@Autowired
	QnaReplyDao qnaReplyDao;

}

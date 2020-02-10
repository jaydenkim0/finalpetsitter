package com.kh.petmily.service.board;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.petmily.repository.QnaReplyDao;
import com.kh.petmily.vo.QnaReplyVO;
@Service
public class QnaReplyServiceImpl implements QnaReplyService{
	
	@Autowired
	QnaReplyService qnaReplyService;
	
	@Autowired
	QnaReplyDao qnaReplyDao;

	@Override
	public List<QnaReplyVO> readReply(int origin) {
		return qnaReplyDao.readReply(origin);
	}

}

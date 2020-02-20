package com.kh.petmily.service.board;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.kh.petmily.repository.StrayReplyDao;
import com.kh.petmily.vo.StrayReplyVO;

@Service
public class StrayReplyServiceImpl implements StrayReplyService{
	@Autowired
	StrayReplyService strayReplyService;
	
	@Autowired
	StrayReplyDao strayReplyDao;
	
	
	@Override
	public List<StrayReplyVO> readReply(int stray_no) {
		return strayReplyDao.readReply(stray_no);
	}

	@Override
	public void writeReply(StrayReplyVO strayReplyVO) {
		strayReplyDao.writeReply(strayReplyVO);
	}

	@Override
	public void replyUpdate(StrayReplyVO strayReplyVO) {
		strayReplyDao.replyUpdate(strayReplyVO);
	}

	@Override
	public void replyDelete(StrayReplyVO strayReplyVO) {
		strayReplyDao.replyDelete(strayReplyVO);
	}

	@Override
	public void replyCal(StrayReplyVO strayReplyVO) {
		strayReplyDao.replyCal(strayReplyVO);
		
	}

}

package com.kh.petmily.repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

import com.kh.petmily.vo.StrayReplyVO;

public class StrayReplyDaoImpl implements StrayReplyDao {
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public List<StrayReplyVO> readReply(int stray_no) {
		return sqlSession.selectList("stray.readReply",stray_no);
	}

	@Override
	public void writeReply(StrayReplyVO strayReplyVO) {
		sqlSession.insert("stray.writeReply",strayReplyVO);
	}

	@Override
	public void replyUpdate(StrayReplyVO strayReplyVO) {
		sqlSession.update("stray.replyUpdate",strayReplyVO);
	}

	@Override
	public void replyDelete(StrayReplyVO strayReplyVO) {
		sqlSession.delete("stray.replyDelete",strayReplyVO);
	}

}

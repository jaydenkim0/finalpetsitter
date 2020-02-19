package com.kh.petmily.repository.kakao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

import com.kh.petmily.entity.PayDto;

public class PayDaoImpl implements PayDao {

	@Autowired
	private SqlSession sqlSession;

	@Override
	public void insertReady(PayDto payDto) {
		sqlSession.insert("pay.ready",payDto);
		
	}

	@Override
	public void insertSuccess(PayDto payDto) {
		sqlSession.insert("pay.success",payDto);
		
	}

	@Override
	public List<PayDto> getList() {
		return sqlSession.selectList("pay.list");
	}

	@Override
	public PayDto get(int pay_no) {
		return sqlSession.selectOne("pay.get",pay_no);
	}

	@Override
	public void insertRevoke(PayDto paycancelDto) {
		sqlSession.insert("pay.revoke",paycancelDto);
		
	}

}

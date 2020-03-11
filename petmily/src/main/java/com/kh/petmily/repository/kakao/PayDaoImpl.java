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

	@Override
	public List<PayDto> getPay(int partner_order_id) {
		return sqlSession.selectList("pay.getPay", partner_order_id);
	}

	@Override
	public int getHourPayment() {
		return sqlSession.selectOne("pay.getHourPayment");
	}
	// 결제 완료가 있는지 확인
	@Override
	public int check(int reservation_no) {		
		return sqlSession.selectOne("pay.check", reservation_no);
	}
	// 결제 취소가 있는지 확인
	@Override
	public int check1(int reservation_no) {		
		return sqlSession.selectOne("pay.check1", reservation_no);
	}

	@Override
	public String getReservation_id(int reservation_no) {			
		return sqlSession.selectOne("pay.getReservation_id", reservation_no);
	}

}

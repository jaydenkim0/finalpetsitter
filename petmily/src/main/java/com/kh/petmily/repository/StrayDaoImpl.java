package com.kh.petmily.repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.petmily.vo.StrayVO;

@Repository
public class StrayDaoImpl implements StrayDao{
	
	@Autowired
	SqlSession sqlSession;
	
	@Override
	public void create(StrayVO strayVO) {
		sqlSession.insert("stray.strayinsert",strayVO);
	}

	@Override
	public StrayVO read(int stray_no) {
		return sqlSession.selectOne("stray.strayview",stray_no);
	}

	@Override
	public void delete(int stray_no) {
		sqlSession.delete("stray.straydelete",stray_no);
	}

	@Override
	public void update(StrayVO strayVO) {
		sqlSession.update("stray.strayupdate",strayVO);
	}

	@Override
	public List<StrayVO> listAll(String type, String keyword, int start, int finish) {
		Map<String, Object> map = new HashMap<>();
		map.put("type",type);
		map.put("keyword",keyword);
		map.put("start",start);
		map.put("finish",finish);
		return sqlSession.selectList("stray.straylistAll",map);
	}

	@Override
	public List<StrayVO> getList(int start, int finish) {
		Map<String, Object> map = new HashMap<>();
		map.put("start",start);
		map.put("finish",finish);
		return sqlSession.selectList("stray.getList",map);
	}
	@Override
	public int getCount(String type, String keyword) {
		Map<String, String> map = new HashMap<>();
		map.put("type",type);
		map.put("keyword",keyword);
		return sqlSession.selectOne("stray.getCount",map);
	}

	@Override
	public int getSequence() {
		int stray_no = sqlSession.selectOne("stray.getSequence");
		return stray_no;
	}
}

package com.kh.petmily.repository.petsitter;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.petmily.entity.PetsitterDto;
import com.kh.petmily.vo.MemberPetsVO;
import com.kh.petmily.vo.petsitter.PetsitterPetsVO;
import com.kh.petmily.vo.petsitter.PetsitterVO;

@Repository
public class PetsitterDaoImpl implements PetsitterDao {

	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public int getSequence() {
		int sitterNo = sqlSession.selectOne("petsitter.getSequence");
		return sitterNo;
	}
	
	@Override
	public void regist(PetsitterDto petsitterDto) {
		sqlSession.insert("petsitter.regist", petsitterDto);
	}

	@Override
	public List<PetsitterVO> getList(int pet_sitter_no) {
		List<PetsitterVO> petsitterList = sqlSession.selectList("petsitter.getList", pet_sitter_no);
		return petsitterList;
	}

	@Override
	public List<PetsitterPetsVO> getPetList(int pet_sitter_no) {
		List<PetsitterPetsVO> petList = sqlSession.selectList("petsitter.getPetList", pet_sitter_no);
		return petList;
	}

	@Override
	public List<PetsitterVO> getListAll() {
		List<PetsitterVO> petsitterListAll = sqlSession.selectList("petsitter.getListAll");
		return petsitterListAll;
	}
	
}

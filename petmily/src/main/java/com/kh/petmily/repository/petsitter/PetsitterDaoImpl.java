package com.kh.petmily.repository.petsitter;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.petmily.entity.CareConditionNameDto;
import com.kh.petmily.entity.CarePetTypeDto;
import com.kh.petmily.entity.CarePetTypeNameDto;
import com.kh.petmily.entity.PetDto;
import com.kh.petmily.entity.PetsitterDto;
import com.kh.petmily.entity.SkillNameDto;
import com.kh.petmily.vo.MemberPetsVO;
import com.kh.petmily.vo.petsitter.PetsitterPetsVO;
import com.kh.petmily.vo.petsitter.PetsitterVO;
import com.kh.petmily.vo.petsitter.SitterlocationVO;

@Repository
public class PetsitterDaoImpl implements PetsitterDao {

	@Autowired
	private SqlSession sqlSession;
	
	//펫시터 번호 구하기
	@Override
	public int getSequence() {
		int sitterNo = sqlSession.selectOne("petsitter.getSequence");
		return sitterNo;
	}
	
	//펫시터 기본 정보 등록
	@Override
	public void regist(PetsitterDto petsitterDto) {
		sqlSession.insert("petsitter.regist", petsitterDto);
	}

	//펫시터 상세 정보 조회
	@Override
	public List<PetsitterVO> getList(int pet_sitter_no) {
		List<PetsitterVO> petsitterList = sqlSession.selectList("petsitter.getList", pet_sitter_no);
		return petsitterList;
	}

	//펫시터 펫 정보 조회
	@Override
	public List<PetsitterPetsVO> getPetList(int pet_sitter_no) {
		List<PetsitterPetsVO> petList = sqlSession.selectList("petsitter.getPetList", pet_sitter_no);
		return petList;
	}

	//펫시터 전체 조회
	@Override
	public List<PetsitterVO> getListAll() {
		List<PetsitterVO> petsitterListAll = sqlSession.selectList("petsitter.getListAll");
		return petsitterListAll;
	}

	//펫시터 기본 정보 및 지역 정보 조회
	@Override
	public List<SitterlocationVO> locationListAll(int start, int end, String cityKeyword, String areaKeyword) {
		Map<String, Object> param = new HashMap<>();
		param.put("start", start);
		param.put("end", end);
		param.put("cityKeyword", cityKeyword);
		param.put("areaKeyword", areaKeyword);
		return sqlSession.selectList("petsitter.locationListAll", param);
	}

	///펫시터 기본 정보 및 지역 정보 카운트
	@Override
	public int countlocation(String cityKeyword, String areaKeyword) {
		Map<String, Object> param = new HashMap<>();
		param.put("cityKeyword", cityKeyword);
		param.put("areaKeyword", areaKeyword);
		return sqlSession.selectOne("petsitter.countlocation", param);
	}

	
	//펫시터 펫 정보 조회
	@Override
	public List<PetDto> getPet(String id) {
		return sqlSession.selectList("member.mylistpet", id);
	}

	//펫시터 번호로 단일 조회
	@Override
	public PetsitterVO noGet(int pet_sitter_no) {
		PetsitterVO petsitterVO = sqlSession.selectOne("petsitter.noGet", pet_sitter_no);
		return petsitterVO;
	}
	//펫시터 아이디로 단일 조회
	@Override
	public PetsitterVO idGet(String id) {
		PetsitterVO petsitterVO = sqlSession.selectOne("petsitter.idGet", id);
		return petsitterVO;
	}

	//펫시터 기본 정보 수정
	@Override
	public void updatePetsitter(PetsitterDto petsitterDto) {
		sqlSession.update("petsitter.update", petsitterDto);
		
	}

	//펫시터 상태 수정(휴면/정상)
	@Override
	public void updateStatus(int pet_sitter_no, String sitter_status) {
		Map<String, Object> param = new HashMap<>();
		param.put("pet_sitter_no", pet_sitter_no);
		param.put("sitter_status", sitter_status);
		sqlSession.update("petsitter.updateStatus", param);
	}

	// 펫시터 블랙리스트 카운트 여부
	@Override
	public int black_petsitter_count(String id) {		
		return sqlSession.selectOne("petsitter.black_petsitter_count", id) ;
	}
	// 회원이 펫을 갖고 있는지 카운터로 확인
	@Override
	public int petscheck(String id) {	
		return sqlSession.selectOne("petsitter.petscheck", id);
	}

	//펫시터 가입시 체크박스 내용 불러오기
	@Override
	public List<CarePetTypeNameDto> getCarePetTypeList() {	
		return sqlSession.selectList("petsitter.getCarePetTypeList");
	}

	@Override
	public List<SkillNameDto> getSkillNameList() {
		return sqlSession.selectList("petsitter.getSkillNameList");
	}

	@Override
	public List<CareConditionNameDto> getCareConditionName() {
		return sqlSession.selectList("petsitter.getCareConditionName");
	}

	@Override
	public List<SitterlocationVO> SearchListAll(int start, int end, String searchOption, String keyword) {
		Map<String, Object> param = new HashMap<>();
		param.put("start", start);
		param.put("end", end);
		param.put("searchOption", searchOption);
		param.put("keyword", keyword);
		return sqlSession.selectList("petsitter.SearchListAll", param);	
	}

	@Override
	public int countSearchList(String searchOption, String keyword) {
		Map<String, Object> param = new HashMap<>();
		param.put("searchOption", searchOption);
		param.put("keyword", keyword);
		return sqlSession.selectOne("petsitter.countSearchList", param);
	}




}

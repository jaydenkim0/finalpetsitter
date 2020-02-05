package com.kh.petmily.repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.petmily.entity.CarePetTypeNameDto;
import com.kh.petmily.entity.MemberDto;
import com.kh.petmily.entity.PetsitterDto;
import com.kh.petmily.vo.PetsitterVO;

@Repository
public class AdminDaoImpl implements AdminDao {

	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public int getMtotal() {
		return sqlSession.selectOne("admin.membercount");
	}
	
	@Override
	public int getPtotal() {
		return sqlSession.selectOne("admin.petsittercount");
	}
	
	@Override
	public int getAtotal() {
		return sqlSession.selectOne("admin.admincount");
	}
	
	// 회원리스트
	@Override
	public List<MemberDto> getMemberList(MemberDto memberDto) {		
		return sqlSession.selectList("admin.memberList", memberDto);
	}

	// 펫시터 리스트
	@Override
	public List<PetsitterVO> getPetsitterList() {		
		return sqlSession.selectList("admin.petsitterList"); 
	}

	@Override
	public List<PetsitterVO> getPetsitterSleep() {
		return sqlSession.selectList("admin.petsleepList");
	}
	
	// 펫시터 신청한 회원 검색
	@Override
	public List<PetsitterVO> getPetsitterApplyList() {
		return sqlSession.selectList("admin.petsitterApplyList"); 
	}

	// 펫시터 승인
	@Override
	public void petsitterApply(String sitter_id) {
		sqlSession.update("admin.petsitterApply", sitter_id);
		
	}
	// 펫시터 거부 (삭제)
	@Override
	public void petsitterNegative(String sitter_id) {
		sqlSession.delete("admin.petsitterNegative", sitter_id);
		
	}

	// 펫시터 단일 검색
	@Override
	public PetsitterVO petsitterSearchOne(String sitter_id) {
		return sqlSession.selectOne("admin.petsitterSearchOne", sitter_id);
	}

	// 펫시터 차단 (블랙리스트 등록)
	@Override
	public void blackSitter(PetsitterDto petsitterDto, PetsitterVO petsitterVO) {
		// 펫시터 상태 휴면으로 변경
		sqlSession.update("admin.sitter_status", petsitterDto);
		// 블랙리스트 테이블에 등록
		sqlSession.insert("admin.blackList", petsitterVO);
		
	}

	// 펫시터 상태 변환
	@Override
	public void sitter_status(PetsitterDto petsitterDto) {
		System.out.println("DaoImpl = " + petsitterDto);
		sqlSession.update("admin.sitter_status", petsitterDto);
		
	}

	// 펫시터 옵션 등록 : 돌봄가능동물
	// 불러오기
	@Override
	public List<CarePetTypeNameDto> getCarePetType() {
		return sqlSession.selectList("admin.getCarePetType") ;
	}
	// 펫시터 옵션 등록 : 스킬 이름
	// 불러오기
	@Override
	public List<CarePetTypeNameDto> getPetSkills() {		
		return sqlSession.selectList("admin.getPetSkills");
	}
	// 펫시터 옵션 등록 : 환경 목록
	// 불러오기
	@Override
	public List<CarePetTypeNameDto> getPetCareCondition() {		
		return sqlSession.selectList("admin.getPetCareCondition");
	}
	
	
	//등록하기
	@Override
	public void carePetTypeI(String care_type) {
		sqlSession.insert("admin.carePetType", care_type);
	}
	// 삭제하기
	@Override
	public void carePetTypeD(int care_type_no) {	
		sqlSession.delete("admin.carePetTypeDelete", care_type_no);
	}


	// 등록하기
	@Override
	public void petSkillNameI(String skill_name) {
		sqlSession.insert("admin.petSkillNameI", skill_name);	
	}
	// 삭제하기
	@Override
	public void petSkillNameD(int skill_no) {
		sqlSession.delete("admin.petSkillNameD", skill_no);	
	}
	
	
	// 등록하기
	@Override
	public void petCareConditionI(String care_condition_name) {
		sqlSession.insert("admin.petCareConditionI", care_condition_name);
	}
	// 삭제하기
	@Override
	public void petCareConditionD(int care_condition_no) {
		sqlSession.delete("admin.petCareConditionD", care_condition_no)	;
	}





	

}

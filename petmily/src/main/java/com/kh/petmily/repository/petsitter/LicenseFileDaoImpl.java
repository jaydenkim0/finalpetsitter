package com.kh.petmily.repository.petsitter;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.petmily.entity.LicenseFileDto;

@Repository
public class LicenseFileDaoImpl implements LicenseFileDao {

	@Autowired
	SqlSession sqlSession;
	
	@Override
	public void uploadLicense(LicenseFileDto licenseFileDto) {
		sqlSession.insert("petsitter.registLicense", licenseFileDto);
		
	}

}

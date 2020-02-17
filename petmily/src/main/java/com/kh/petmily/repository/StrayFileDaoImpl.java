package com.kh.petmily.repository;

import java.io.File;
import java.io.IOException;
import java.util.List;

import org.apache.commons.io.FileUtils;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.petmily.entity.StrayFileDto;

@Repository
public class StrayFileDaoImpl implements StrayFileDao {

	@Autowired
	SqlSession sqlSession;
	
	@Override
	public void uploadstray(StrayFileDto strayfileDto) {
		sqlSession.insert("stray.strayfile",strayfileDto);
	}

	@Override
	public List<StrayFileDto> strayImageList(int stray_no) {
		return sqlSession.selectList("stray.strayImageList",stray_no);
	}

	@Override
	public StrayFileDto fileview(int stray_file_no) {
		return sqlSession.selectOne("stray.fileview",stray_file_no);
		}

	@Override
	public byte[] physicalStrayImage(String savename) throws IOException {
		File file = new File("D:/upload/stray",savename);
		byte[]data = FileUtils.readFileToByteArray(file);
		return data;
	}
}

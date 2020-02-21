package com.kh.petmily.vo;

import java.text.SimpleDateFormat;
import java.util.Date;

import com.kh.petmily.vo.FaqVO.FaqVOBuilder;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @Builder
@NoArgsConstructor
@AllArgsConstructor
public class QnaVO {
	// pet_sitter 정보도 연결 해야 되지 않는지 확인!
		// 회원과 QnA 관계는 1대다
		// 펫시터오 QnA 관계도 1대다
		private int qna_no;
		private String qna_writer; // member 테이블의 id
		private String qna_title; //질문 게시판 타이틀
		private String qna_head;//질문 게시판 제목
		private String qna_content; // 질문 게시판 내용
		private String wdate; //작성 날짜
		private String writedate; 
		private String replycount; //댓글 수 
		
		//-------------------------------------
		private int groupno, //원글 번호
		superno, //원글에 대한 순서 (답글 포함)
		depth; //답글 계층
		
		public String getWritedateWithFormat()throws Exception{
			SimpleDateFormat read = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss.S");
			Date date = read.parse(wdate);
			SimpleDateFormat write = new SimpleDateFormat("y년 M월 d일");
			String time = write.format(date);
			return time;
		}
}

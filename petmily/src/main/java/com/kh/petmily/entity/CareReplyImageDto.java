package com.kh.petmily.entity;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class CareReplyImageDto {

	//CareImageDto
	private int care_image_no; // 저장되는 파일이름을 care_image_no 변경
	private int care_reply_no; // care_reply 테이블의 care_reply_no 
	private String savename; // DB에 저장되는 이름 = 사용자에게 보여줄이름
	private String filetype;
	private long filesize;
	private String uploadname;
	
	//CareReplyDto
	private int care_reply_board_no; // care_board 테이블의 care_board_no
	private String care_reply_content; // 댓글 내용
	private String wdate; // 댓글 작성 시간
	private String care_reply_writer;//댓글 작성자(member 테이블의 id)
	
	//MemberImageDto
	private int member_image_no;
	
	public String getWdateWithFormat() throws ParseException {
			SimpleDateFormat read = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss.S");
			Date date = read.parse(wdate);
			//변환한 형식을 다시 원하는 형식의 문자열로 변환
			SimpleDateFormat write = new SimpleDateFormat("y년 M월 d일 E요일 HH시 mm분");
			String time = write.format(date);
			return time;
	}
	
}


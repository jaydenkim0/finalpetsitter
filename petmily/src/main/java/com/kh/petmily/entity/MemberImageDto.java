package com.kh.petmily.entity;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class MemberImageDto {

	private int member_image_no;
	private String member_image_member_id;
	private String savename;
	private String filetype;
	private long filesize;
	private String uploadname;
	
}

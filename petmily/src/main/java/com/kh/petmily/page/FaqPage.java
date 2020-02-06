package com.kh.petmily.page;

import com.kh.petmily.vo.FaqVO;
import com.kh.petmily.vo.FaqVO.FaqVOBuilder;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @Builder
@NoArgsConstructor
@AllArgsConstructor
public class FaqPage {
	private int count;
	private int pageNum;
	private int pageCount;
	private int pageBlock;
	private int startPage;
	private int endPage;
}
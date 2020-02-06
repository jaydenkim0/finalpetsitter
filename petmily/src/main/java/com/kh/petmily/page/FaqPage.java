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
	public static final int page_scale = 10;
	public static final int block_scale = 10;
	
	private int curPage;// 현재 페이지
	private int prevPage;// 이전 페이지
	private int nextPage;// 다음 페이지
	private int totPage;// 전체 페이지 갯수
	private int totBlock;// 전체 페이지 블록 갯수
	private int curBlock;// 현재 페이지 블록
	private int prevBlock;// 이전 페이지 블록
	private int nextBlock;// 다음 페이지 블록
	private int pageBegin;// #{start}
	private int pageEnd;//  #{end}
// 	/[이전] blockBegin -> 41 42 43 45 46 47 48 49 50 [다음]
	private int blockBegin;//현재 페이지 블록의 시작 번호
//		/[이전]  41 42 43 45 46 47 48 49 50 <-blockEnd[다음]
	private int blockEnd;// 현재 페이지 블록의 끝번호
	
	//FaqPage 레코드 갯수 , 현재 페이지 번호
	public FaqPage(int count, int curPage) {
		curBlock = 1;
		this.curPage = curPage;
		setTotPage(count);
		setPageRange();
		setTotBlock();
		setBlockRange();
	}
	
	public void setBlockRange() {
		//현재 페이지가 몇번째 블록에 속하는지 
		curBlock = (int) Math.ceil((curPage-1) / block_scale) + 1;
		//현재 페이지 블록 시작, 끝 번호 계산
		blockBegin = (curBlock-1) * (block_scale+1);
		//페이지 블록의 끝 번호
		blockEnd = blockBegin + (block_scale -1);
		//마지막 블록이 범위를 초과하지 않도록 계산
		if(blockEnd > totPage) blockEnd = totPage;
		//이전을 눌렀을 때 이동할 페이지 번호
		prevPage = (curPage == 1)? 1:(curBlock-1) * block_scale;
		//다음을 눌렀을 때 이동할 페이지 번호
		nextPage = curBlock > totBlock ? 
				(curBlock * block_scale) : (curBlock * block_scale)+1;
				//마지막 페이지가 범위를 초과하지 않도록 처리
				if(nextPage >= totPage) nextPage = totPage;
	}

	private void setPageRange() {
		//시작번호
		pageBegin = (curPage-1) *page_scale +1;
		//끝 번호
		pageEnd = pageBegin +page_scale -1;
		
	}

	public void setTotPage (int count) {
		totPage = (int)Math.ceil(count * 1.0 / page_scale);
	}
	public void setTotBlock() {
		totBlock = (int)Math.ceil(totPage / block_scale);
		
	}

}
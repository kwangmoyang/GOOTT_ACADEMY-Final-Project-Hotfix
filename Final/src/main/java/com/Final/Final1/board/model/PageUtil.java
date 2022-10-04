package com.Final.Final1.board.model;

public class PageUtil {
	
	private int curPage;	// 현재 페이지
	private int prevPage;	// 이전 페이지
	private int nextPage;	// 다음 페이지
	private int totPage;	// 전체 페이지 개수
	private int totBlock;	// 전체 페이지의 블록 개수
	private int curBlock;	// 현재 페이지 블록
	private int prevBlock;	// 이전 페이지 블록
	private int nextBlock;	// 다음 페이지 블록
	private int pageBegin;	// 시작
	private int pageEnd;	// 
	private int blockBegin;	// 블록 시작
	private int blockEnd;	// 블록 끝
	public static final int PAGE_SCALE = 5;
	public static final int BLOCK_SCALE =5; 
	


	public int getCurPage() {
		return curPage;
	}

	public void setCurPage(int curPage) {
		this.curPage = curPage;
	}

	public int getPrevPage() {
		return prevPage;
	}

	public void setPrevPage(int prevPage) {
		this.prevPage = prevPage;
	}

	public int getNextPage() {
		return nextPage;
	}

	public void setNextPage(int nextPage) {
		this.nextPage = nextPage;
	}

	public int getTotPage() {
		return totPage;
	}

	public void setTotPage(int count) {
		totPage = (int) Math.ceil(count * 1.0 / PAGE_SCALE);
	}

	public int getTotBlock() {
		return totBlock;
	}

	public void setTotBlock() {
		this.totBlock = (int) Math.ceil(totPage/BLOCK_SCALE);
	}

	public int getCurBlock() {
		return curBlock;
	}

	public void setCurBlock(int curBlock) {
		this.curBlock = curBlock;
	}

	public int getPrevBlock() {
		return prevBlock;
	}

	public void setPrevBlock(int prevBlock) {
		this.prevBlock = prevBlock;
	}

	public int getNextBlock() {
		return nextBlock;
	}

	public void setNextBlock(int nextBlock) {
		this.nextBlock = nextBlock;
	}

	public int getPageBegin() {
		return pageBegin;
	}

	public void setPageBegin(int pageBegin) {
		this.pageBegin = pageBegin;
	}

	public int getPageEnd() {
		return pageEnd;
	}

	public void setPageEnd(int pageEnd) {
		this.pageEnd = pageEnd;
	}

	public int getBlockBegin() {
		return blockBegin;
	}

	public void setBlockBegin(int blockBegin) {
		this.blockBegin = blockBegin;
	}

	public int getBlockEnd() {
		return blockEnd;
	}

	public void setBlockEnd(int blockEnd) {
		this.blockEnd = blockEnd;
	}
	
	public PageUtil(int count, int curPage) {
		curBlock = 1;	// 현재 페이지 블록 번호
		this.curPage = curPage;	// 현재 페이지 설정
		setTotPage(count); // 전체 페이지 개수 계산
		setPageRange();
		setTotBlock();
		setBlockRange();
	}
	
	private void setPageRange() {
		pageBegin = (curPage -1) * PAGE_SCALE + 1;
		pageEnd = pageBegin + PAGE_SCALE -1;
	}

	public void setBlockRange() {
		curBlock = (int) Math.floor((curPage -1) / BLOCK_SCALE)+1;
		blockBegin = (curBlock -1 ) * BLOCK_SCALE +1;
		blockEnd = blockBegin + BLOCK_SCALE -1;
		// 블록 끝이 전체페이지보다 클 경우
		// -> prevPage , nextPage를 다시 세팅
		if(blockEnd > totPage) {
			blockEnd = totPage;
			prevPage = (curBlock == 1) ? 1 : (curBlock - 1) * BLOCK_SCALE; 
			nextPage = (curBlock > totBlock) ? (curBlock * BLOCK_SCALE): (curBlock * BLOCK_SCALE)+1 ;
		}
		if(nextPage >= totPage) {
			nextPage = totPage;
		}
		
	}
	
	
	
	
	
	
}

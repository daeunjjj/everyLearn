package com.coding5.el.notice.service;

import java.util.List;

import com.coding5.el.notice.vo.NoticeVo;
import com.coding5.el.notice.vo.PageVo;

public interface NoticeService {
	
	//글쓰기
	public int write(NoticeVo vo) throws Exception;

	//공지 리스트
	public List<NoticeVo> getNoticeList(PageVo pageVo) throws Exception;

	//공지 삭제
	public int deleteNotice(String str) throws Exception;
	
	//공지 수정
	public int editNotice(NoticeVo vo) throws Exception;

	//공지 갯수
	public int getNoticeCnt() throws Exception;

	//공지 상세 조회
	public NoticeVo selectDetail(String no) throws Exception;

	//조회수 +
	public int increaseHit(String no) throws Exception;

	

}

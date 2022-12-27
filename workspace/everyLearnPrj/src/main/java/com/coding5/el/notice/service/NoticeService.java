package com.coding5.el.notice.service;

import java.util.List;

import com.coding5.el.notice.vo.NoticeVo;
import com.coding5.el.notice.vo.PageVo;

public interface NoticeService {
	
	//글쓰기
	int write(NoticeVo vo) throws Exception;

	//공지 리스트
	List<NoticeVo> getNoticeList(PageVo pageVo) throws Exception;

	//공지 삭제
	int deleteNotice(String str) throws Exception;
	
	//공지 수정
	int editNotice(NoticeVo vo) throws Exception;

	//공지 갯수
	int getNoticeCnt() throws Exception;

	//공지 상세 조회
	NoticeVo selectDetail(String no) throws Exception;

}

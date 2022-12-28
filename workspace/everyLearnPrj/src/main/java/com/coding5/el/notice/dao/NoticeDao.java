package com.coding5.el.notice.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import com.coding5.el.notice.vo.NoticeVo;
import com.coding5.el.notice.vo.PageVo;

public interface NoticeDao {

	//공지 작성
	public int write(SqlSessionTemplate sst, NoticeVo vo) throws Exception;

	//공지 리스트
	public List<NoticeVo> getNoticeList(SqlSessionTemplate sst, PageVo pageVo) throws Exception;

	//공지 삭제
	public int deleteNotice(SqlSessionTemplate sst, String[] delArr) throws Exception;

	//공지 갯수
	public int getNoticeCnt(SqlSessionTemplate sst) throws Exception;
	
	//공지 수정
	public int editNotice(SqlSessionTemplate sst, NoticeVo vo) throws Exception;

	//공지 상세 조회
	public NoticeVo selectDetail(SqlSessionTemplate sst, String no) throws Exception;
	
	//조회수 +
	public int increaseHit(SqlSessionTemplate sst, String no) throws Exception;


}

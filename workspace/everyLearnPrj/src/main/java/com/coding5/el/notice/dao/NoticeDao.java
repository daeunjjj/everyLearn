package com.coding5.el.notice.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import com.coding5.el.common.page.PageVo;
import com.coding5.el.notice.vo.NoticeVo;

public interface NoticeDao {
	
	//공지사항 작성하기
	public int write(SqlSessionTemplate sst, NoticeVo vo);
	
	
	//공지사항 목록 조회
	public List<NoticeVo> selectList(SqlSessionTemplate sst, PageVo pv);

	//공지사항 페이지 카운트
	public int selectListCount(SqlSessionTemplate sst);

	//공지사항 디테일
	public NoticeVo detail(SqlSessionTemplate sst, int noticeNo);



	
}

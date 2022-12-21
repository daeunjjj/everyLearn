package com.coding5.el.notice.service;

import java.util.List;

import com.coding5.el.notice.vo.NoticeVo;

public interface NoticeService {
	
	//공지사항 작성
	public int write(NoticeVo vo);
	
	//공지사항 목록
	public List<NoticeVo> selectList();

}

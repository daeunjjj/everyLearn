package com.coding5.el.notice.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.coding5.el.notice.vo.NoticeVo;

@Repository
public class NoticeDao {
	
	//공지사항 작성
	public int write(SqlSessionTemplate sst, NoticeVo vo) {
		return sst.insert("noticeMapper.write", vo);
	}
	
	//공지사항 갯수 업데이트
	public int updateCnt(SqlSessionTemplate sst) {
		return sst.update("boardMapper.updateCnt");
	}

}

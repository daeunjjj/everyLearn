package com.coding5.el.notice.dao;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.coding5.el.common.page.PageVo;
import com.coding5.el.notice.vo.NoticeVo;

@Repository
public class NoticeDaoImpl implements NoticeDao {
	
	@Override
	public int write(SqlSessionTemplate sst, NoticeVo vo) {
		//공지사항 작성
		return sst.insert("noticeMapper.write", vo);
	}

	@Override
	public List<NoticeVo> selectList(SqlSessionTemplate sst, PageVo pv) {
		//공지사항 목록 조회	
		return sst.selectList("noticeMapper.selectList");
	}

	@Override
	public int selectListCount(SqlSessionTemplate sst) {
		//공지사항 리스트 카운트
		return sst.selectOne("noticeMapper.selectListCount");
	}

	@Override
	public NoticeVo detail(SqlSessionTemplate sst, int noticeNo) {
		// 공지사항 디테일
		return sst.selectOne("noticeMapper.detail", noticeNo);
	}

}

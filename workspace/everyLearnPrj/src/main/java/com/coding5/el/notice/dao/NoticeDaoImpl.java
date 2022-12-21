package com.coding5.el.notice.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.coding5.el.notice.vo.NoticeVo;

@Repository
public class NoticeDaoImpl implements NoticeDao {
	
	@Override
	public int write(SqlSessionTemplate sst, NoticeVo vo) {
		//공지사항 작성
		return sst.insert("noticeMapper.write", vo);
	}
	
	@Override
	public int updateCnt(SqlSessionTemplate sst) {
		//공지사항 갯수 업데이트
		return sst.update("boardMapper.updateCnt");
	}

	@Override
	public List<NoticeVo> selectList(SqlSessionTemplate sst) {
		//공지사항 목록 조회
		return sst.selectList("boradMapper.selectList");
	}

}

package com.coding5.el.admin.report.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.coding5.el.alert.vo.AlertVo;
import com.coding5.el.common.page.PageVo;
import com.coding5.el.common.page.Pagination;
import com.coding5.el.report.vo.ReportVo;

import lombok.extern.slf4j.Slf4j;

@Repository
@Slf4j
public class AdminReportDaoImpl implements AdminReportDao{

	@Override
	public int selectReportCount(SqlSessionTemplate sst, Map<String, String> mapSearch) {
		// 신고 게시글 수
		log.info("디에이오 왔다");
		return sst.selectOne("adminMapper.selectReportCount", mapSearch);
	}

	@Override
	public List<ReportVo> selectReportList(SqlSessionTemplate sst, PageVo pv, Map<String, String> mapSearch) {
		// 신고 모든 게시글
		RowBounds rb = Pagination.getRowBounds(pv);
		
		return sst.selectList("adminMapper.selectReportList", mapSearch,rb);
	}

	@Override
	public int selectReportHandleN(SqlSessionTemplate sst) {
		// 미처리 신고 게시글 수
		return sst.selectOne("adminMapper.selectHandleN");
	}

	@Override
	public ReportVo selectReportOneByNo(SqlSessionTemplate sst, String no) {
		// 신고 게시글 하나
		return sst.selectOne("adminMapper.selectReportOneByNo",no);
	}

	@Override
	public int reportUpdate(SqlSessionTemplate sst, ReportVo reportVo) {
		// 신고처리
		return sst.update("adminMapper.reportUpdate",reportVo);
	}

	@Override
	public int memberUpdate(SqlSessionTemplate sst, ReportVo reportVo) {
		// 멤버 업뎃
		return sst.update("adminMapper.memberUpdate",reportVo);
	}

	@Override
	public int insertAlert(SqlSessionTemplate sst, AlertVo alertVo) {
		// 알림
		return sst.insert("adminMapper.insertAlert",alertVo);
	}

}

package com.coding5.el.admin.report.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import com.coding5.el.alert.vo.AlertVo;
import com.coding5.el.common.page.PageVo;
import com.coding5.el.report.vo.ReportVo;

public interface AdminReportDao {
	// 신고글 수
	public int selectReportCount(SqlSessionTemplate sst, Map<String, String> mapSearch);
	
	// 신고 게시글 리스트 가져오기
	public List<ReportVo> selectReportList(SqlSessionTemplate sst, PageVo pv, Map<String, String> mapSearch);
	
	// 미처리 신고
	public int selectReportHandleN(SqlSessionTemplate sst);
	
	// 신고 게시글 하나
	public ReportVo selectReportOneByNo(SqlSessionTemplate sst, String no);
	
	// 신고 처리
	public int reportUpdate(SqlSessionTemplate sst, ReportVo reportVo);
	
	// 멤버 신고 컬럼 y
	public int memberUpdate(SqlSessionTemplate sst, ReportVo reportVo);

	// 알림
	public int insertAlert(SqlSessionTemplate sst, AlertVo alertVo);
	
}

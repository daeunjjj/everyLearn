package com.coding5.el.admin.report.service;

import java.util.List;
import java.util.Map;

import com.coding5.el.alert.vo.AlertVo;
import com.coding5.el.common.page.PageVo;
import com.coding5.el.report.vo.ReportVo;

public interface AdminReportService {
	// 신고 게시글 수
	public int selectReportCount(Map<String, String> mapSearch);
	// 신고 리스트 수
	public Map<String, Object> selectReportList(PageVo pv, Map<String, String> mapSearch);
	// 신고 게시글 하나 가져오기
	public ReportVo selectReportOne(String no);
	// 신고처리
	public int reportProcess(ReportVo reportVo, AlertVo alertVo);

}

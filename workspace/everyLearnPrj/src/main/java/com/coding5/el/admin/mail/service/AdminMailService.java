package com.coding5.el.admin.mail.service;

import java.util.List;
import java.util.Map;

import com.coding5.el.common.vo.AttachVo;
import com.coding5.el.common.page.PageVo;
import com.coding5.el.email.vo.MailVo;

public interface AdminMailService {

	
	// 메일 보낸 내역 디비에 저장
	public int insertMail(MailVo vo, List<AttachVo> voList);
	
	// 메일 리스트 개수 가져오기
	public int selectMailCount(Map<String, String> mapSearch);
	
	// 메일 리스트들 가져오기
	public List<MailVo> selectMailList(PageVo pv, Map<String, String> mapSearch);
	
	// 보낸 메일 내역 삭제
	public int deleteSendMail(String[] arrNo);
	
	// 메일 상세보기
	public Map<String, Object> mailDetail(String no);

}

package com.coding5.el.qna.service;

import java.util.List;

import com.coding5.el.notice.vo.PageVo;
import com.coding5.el.qna.vo.QnaVo;

public interface QnaService {

	//문의하기
	int memberWrite(QnaVo vo) throws Exception;

	//관리자 답변
	int answerAdminWrite(QnaVo vo) throws Exception;

	//글 갯수
	int getQnaCnt() throws Exception;

	//qna리스트
	List<QnaVo> getQnaList(PageVo pageVo) throws Exception;

	//qna 디테일
	QnaVo selectDetail(String no) throws Exception;

}

package com.coding5.el.qna.service;

import java.util.List;

import com.coding5.el.notice.vo.PageVo;
import com.coding5.el.qna.vo.QnaVo;

public interface QnaService {

	int memberWrite(QnaVo vo) throws Exception;

	int adminWrite(QnaVo vo) throws Exception;

	int getQnaCommCnt() throws Exception;

	List<QnaVo> getQnaList(PageVo pageVo) throws Exception;

}

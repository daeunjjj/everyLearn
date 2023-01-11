package com.coding5.el.qna.service;

import com.coding5.el.qna.vo.QnaVo;

public interface QnaService {

	int memberWrite(QnaVo vo) throws Exception;

	int adminWrite(QnaVo vo) throws Exception;

}

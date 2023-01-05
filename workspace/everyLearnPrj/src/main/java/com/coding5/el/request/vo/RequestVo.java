package com.coding5.el.request.vo;

import java.util.List;

import lombok.Data;

@Data
public class RequestVo {
	private String no;
	private String memberNo;
	private String id;
	private String type;
	private String content;
	private String checkYn;
	private List<RequestVo> voList;
}

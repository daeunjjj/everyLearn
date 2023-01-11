package com.coding5.el.admin.intercepter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.coding5.el.admin.vo.AdminVo;

import lombok.extern.slf4j.Slf4j;
@Slf4j
public class AdminCheckIntercepter implements HandlerInterceptor{

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		log.info("@@@관리자 체크 인터셉터 실행@@@");
		
		HttpSession session = request.getSession();
		AdminVo loginAdmin = (AdminVo) session.getAttribute("loginAdmin");
		
		if(loginAdmin == null) {
			log.info("권한없음");
			response.sendRedirect(request.getContextPath()+"/signin");
			return false;
		}
		
		
		return true;
		
	}
	
	
	
	
	
	
}

package com.coding5.el.admin.intercepter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;

import com.coding5.el.admin.vo.AdminVo;

import lombok.extern.slf4j.Slf4j;
@Slf4j
public class AdminMasterCheckIntercepter implements HandlerInterceptor{

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler )
			throws Exception {
		HttpSession session = request.getSession();
		AdminVo loginAdmin = (AdminVo) session.getAttribute("loginAdmin");
		
		if(!"마스터".equals(loginAdmin.getPermission())) {

			request.setAttribute("resultMsg", "권한이 없습니다.");
			request.getRequestDispatcher("/WEB-INF/views/admin/dashboard.jsp").forward(request, response);;
			
			return false;
		}
		
		return true;
	}
	
	
	
}

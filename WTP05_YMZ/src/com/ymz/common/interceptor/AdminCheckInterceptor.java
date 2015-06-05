package com.ymz.common.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.ModelAndViewDefiningException;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.ymz.member.vo.Member;

public class AdminCheckInterceptor extends HandlerInterceptorAdapter {
	
	@Override
	public boolean preHandle(HttpServletRequest request,
			HttpServletResponse response, Object handler) throws Exception {
		Member member = (Member)request.getSession().getAttribute("login_info");
		if(!member.getGrade().equals("master")) {
			throw new ModelAndViewDefiningException(new ModelAndView("/WEB-INF/view/not_admin.jsp"));
		}
		return super.preHandle(request, response, handler);
	}
}

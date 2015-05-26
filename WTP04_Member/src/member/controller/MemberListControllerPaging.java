package member.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.model.service.MemberService;
import member.model.service.MemberServiceImpl;
import common.controller.AttributeAndView;
import common.controller.Controller;

public class MemberListControllerPaging implements Controller{

	@Override
	public AttributeAndView handle(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		AttributeAndView av = null;
		int pageNo = 1;
		try {
			pageNo = Integer.parseInt(request.getParameter("page"));
		} catch (Exception e) {
			// 예외 발생 시 - page=1
		}
		
		try {
			MemberService ms = MemberServiceImpl.getInstance();
			Map<String, Object> map = ms.getMemberListPaging(pageNo);
			av = new AttributeAndView("/WEB-INF/view/member/member_list_paging.jsp", false, map);
		} catch (Exception e) {
			e.printStackTrace();
			av = new AttributeAndView("/WEB-INF/view/error.jsp", false, "error_message", e.getMessage());
		}
		return av;
	}
}

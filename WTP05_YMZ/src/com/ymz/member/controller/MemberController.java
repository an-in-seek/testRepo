package com.ymz.member.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.ymz.common.validator.MemberValidator;
import com.ymz.member.service.MemberService;
import com.ymz.member.vo.Member;

@Controller
@RequestMapping("/member/")
public class MemberController {
	
	@Autowired
	private MemberService service;
	
	//회원 가입
	@RequestMapping(value="join.do", method=RequestMethod.POST)
	public String joinMember(@ModelAttribute Member member, Errors errors, HttpServletRequest request) throws Exception{
		//요청파라미터 Validator를 이용해 검증
		new MemberValidator().validate(member, errors);
		if(errors.hasErrors()){
			return "member/join_form.tiles";
		}
		String post1 = (String) request.getParameter("postcode1");
		System.out.println(post1);
		String post2 = (String) request.getParameter("postcode2");
		String zipcode = post1+"-"+post2;
		member.setZipcode(zipcode);
		System.out.println(member.getAddress());
		member.setGrade("일반");
		String recommend = (String)request.getParameter("recommend");
		
		if(service.getMemberById(recommend)!=null){
			Member rm =service.getMemberById(recommend);
			String id =rm.getId();
			String password = rm.getPassword();
			String name = rm.getPassword();
			String nickname = rm.getNickname();
			String birth = rm.getBirth();
			String sex = rm.getSex();
			String zipcode2 = rm.getZipcode();
			String address = rm.getAddress();
			String detailAddress = rm.getDetailAddress();
			String email = rm.getEmail();
			String phoneNo = rm.getPhoneNo();
			String favoriteFood = rm.getFavoriteFood();
			int mileage = rm.getMileage()+100;
			String grade = rm.getGrade();
			String joinDate = rm.getJoinDate();
			Member newRm = new Member(id,password,name,nickname,birth,sex,zipcode2,address,detailAddress,email,phoneNo,favoriteFood,mileage,grade,joinDate);
			
			service.modifyMember(newRm);
			member.setMileage(10);
			service.joinMember(member);
		}else{
			member.setMileage(0);
			service.joinMember(member);
		}
		return "redirect:/member/joinSuccess.do?id="+member.getId();
	}

	
	// 등록 성공
	@RequestMapping("joinSuccess.do")
	public String joinSuccess(@RequestParam String id, ModelMap map) throws Exception{
		Member member = service.getMemberById(id);
		System.out.println(member);
		map.addAttribute("member", member);
		return "member/join_success.tiles";
	}
	
	// 로그인
	@RequestMapping(value="login.do", method=RequestMethod.POST)
	public String login(String id, String password, HttpSession session, HttpServletResponse response, ModelMap map){
		Member m = service.getMemberById(id);
		String url = null;
		if(m!=null){
			if(password.equals(m.getPassword())){
				session.setAttribute("login_info", m);
				url = "main.tiles";
			}else{
				url = "member/login_form.tiles";
				map.addAttribute("error_message", "Password를 확인하세요");
			}
		}else{
			url = "member/login_form.tiles";
			map.addAttribute("error_message", "ID를 확인하세요");
		}
		return url;
	}
	//회원정보수정
	

	
	// 전체 정보 조회1
	@RequestMapping("memberList.do")
	public ModelAndView memberList(@RequestParam(defaultValue="1")int page){
		Map map = service.getMemberListPaging(page);
		return new ModelAndView("member/member_list.tiles",  map);
	}
	
	// 전체 정보 조회2
	@RequestMapping("memberListPaging.do")
	public ModelAndView memberListPaging(@RequestParam(defaultValue="1")int page){
		Map map = service.getMemberListPaging(page);
		return new ModelAndView("member/member_list_paging.tiles", map);
	}
	
	
	/*************로그인이 필요한 서비스 - interceptor에서 로그인 체크**********************/
	@RequestMapping(value="login/modifyMemberInfo", method=RequestMethod.POST)
	public String modifyMemberInfo(@ModelAttribute Member member, Errors errors, HttpSession session,  HttpServletRequest request, ModelMap map)
																																					throws Exception{
		Member loginInfo = (Member)session.getAttribute("login_info");
		//Validation check
		new MemberValidator().validate(member, errors);
		if(errors.hasErrors()){
			return "member/modify_form.tiles";
		}

		//로그인 체크 - interceptor가 처리
		service.modifyMember(member);//수정 처리
		
		//session의 login_info 속성의 property들을  수정된 정보로 변경(id, joinDate는 변경 안한다.)
		loginInfo.setName(member.getName());
		loginInfo.setEmail(member.getEmail());
		loginInfo.setPassword(member.getPassword());

		return "member/member_info.tiles";
	}
	
	// 정보 제거하기
	@RequestMapping("login/removeMember.do")
	public String removeMember(HttpSession session, ModelMap map){
		//로그인 처리는 interceptor가 처리
		Member loginInfo = (Member)session.getAttribute("login_info");
		service.removeMemberById(loginInfo.getId());
		//session 제거
		session.invalidate();
		return "main.tiles";//삭제후 메인페이지로 이동
	}
	
	// 로그아웃
	@RequestMapping("login/logout")
	public String logout(HttpSession session, HttpServletResponse response){
		session.invalidate();
		return "redirect:/index.do";
	}
	
	/**********************ID 중복검사 -Ajax 요청처리***********************/
	@RequestMapping("idDuplicateCheck")
	@ResponseBody
	public Map<String , Boolean> idDuplicateCheck(@RequestParam String id){
		HashMap<String , Boolean> result = new HashMap<String , Boolean>();
		result.put("result", service.getMemberById(id)==null ? true:false);
		return result;
	}
	
	/**********************리스트에서 id로 회원정보 요청한 것 처리 -Ajax 요청처리***********************/
	@RequestMapping("findMemberById")
	@ResponseBody
	public Member findMemberById(@RequestParam String id){
		return service.getMemberById(id);
	}
	
	/**********************리스트에서 id로 회원정보 존재 유무 요청 처리 -Ajax 요청처리********************/
	@RequestMapping("idExistCheck.do")
	@ResponseBody
	public String idExistCheck(@RequestParam String recommend2){
		String result = null;
		if(recommend2=="" || service.getMemberById(recommend2)!=null){
			result = "true";
			System.out.println(result);
		}else{
			result = "false";
			System.out.println(result);
		}
		return result;
	}
	/**********************기존비밀번호 확인********************///비밀번호수정
	@RequestMapping("passwordCheck.do")
	@ResponseBody
	public String passwordCheck(@RequestParam String current_password,HttpSession session){
		Member m = (Member)session.getAttribute("login_info");
		String password = m.getPassword();
		String result = null;
		if(current_password==password){
			result = "true";
			System.out.println(result);
		}else{
			result = "false";
			System.out.println(result);	
		}
		return result;
	}
	
	/**********************비밀번호 수정********************///비밀번호수정
	@RequestMapping(value="login/modifyPassword", method=RequestMethod.POST)
	@ResponseBody
	public String modifyPassword(){
		return "member/info/modify_password_success.tiles";
	}
	
	

}

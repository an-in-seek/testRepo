package com.ymz.member.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
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
	public String joinMember(@ModelAttribute Member member, Errors errors, HttpServletRequest request,ModelMap map) throws Exception{
		//요청파라미터 Validator를 이용해 검증
		new MemberValidator().validate(member, errors);
		if(errors.hasErrors()){
			return "member/join_form.tiles";
		}
		String exId = (String) request.getParameter("id");
		String exNickname = (String) request.getParameter("nickname");
		String exName = (String) request.getParameter("name");
		String post1 = (String) request.getParameter("postcode1");
		String post2 = (String) request.getParameter("postcode2");
		String exAddress = (String) request.getParameter("address");
		String exDetailAddress = (String) request.getParameter("detailAddress");
		String phoneCP = (String) request.getParameter("phoneCP");
		String num1 = (String)request.getParameter("num1");
		String num2 = (String)request.getParameter("num2");
		String phoneNo = phoneCP+"-"+num1+"-"+num2;
		member.setPhoneNo(phoneNo);
		String exSex = (String)request.getParameter("sex");
		String zipcode = post1+"-"+post2;
		member.setZipcode(zipcode);
		member.setGrade("user");
		String recommend = (String)request.getParameter("recommend");
		String year = (String)request.getParameter("year");
		String month = (String)request.getParameter("month");
		String day = (String)request.getParameter("day");
		String exbirth = year+"-"+month+"-"+day;
		member.setBirth(exbirth);
		String emailName = (String)request.getParameter("emailName");
		String emailAddress = (String)request.getParameter("emailAddress");
		String exEmail = emailName+"@"+emailAddress;
		if(service.getMemberByEmail(exEmail)!=null){
			map.addAttribute("error_message", "이미 가입된 이메일입니다.");
			request.setAttribute("id", exId);
			request.setAttribute("name", exName);
			request.setAttribute("nickname",exNickname);
			request.setAttribute("postcode1", post1);
			request.setAttribute("postcode2", post2);
			request.setAttribute("address", exAddress);
			request.setAttribute("detailAddress", exDetailAddress);
			request.setAttribute("phoneCP", phoneCP);
			request.setAttribute("num1", num1);
			request.setAttribute("num2", num2);
			request.setAttribute("sex", exSex);
			request.setAttribute("recommend", recommend);
			return "member/join_form.tiles";
		}else{
		member.setEmail(exEmail);
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
			String phone = rm.getPhoneNo();
			String favoriteFood = rm.getFavoriteFood();
			int mileage = rm.getMileage()+100;
			String grade = rm.getGrade();
			String joinDate = rm.getJoinDate();
			Member newRm = new Member(id,password,name,nickname,birth,sex,zipcode2,address,detailAddress,email,phone,favoriteFood,mileage,grade,joinDate);
			
			service.modifyMember(newRm);
			member.setMileage(10);
			service.joinMember(member);
		}else{
			member.setMileage(0);
			service.joinMember(member);
		}
		return "redirect:/member/joinSuccess.do?id="+member.getId();
		}
	}
	
	// 등록 성공
	@RequestMapping("joinSuccess.do")
	public String joinSuccess(@RequestParam String id, ModelMap map) throws Exception{
		Member member = service.getMemberById(id);
		map.addAttribute("member", member);
		return "member/join_success.tiles";
	}
	
	// 로그인
	@RequestMapping(value="login.do",method=RequestMethod.POST)
	public String login(String id, String password, HttpSession session, HttpServletRequest request, HttpServletResponse response, ModelMap map){
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
	@RequestMapping("login/memberListPaging.do")
	public ModelAndView memberListPaging(@RequestParam(defaultValue="1")int page){
		Map map = service.getMemberListPaging(page);
		return new ModelAndView("member/member_list_paging.tiles", map);
	}
	
	//리스트에서 (ID,이름,닉네임,등급)으로 회원정보 조회
	@RequestMapping("login/findMemberByInfo.do")
	public  ModelAndView findMemberByInfo(@RequestParam String info, @RequestParam String command){
		int pageNo=1;
		System.out.println(info+" --- "+command);
		Map map = service.getMemberByInfo(info, command, pageNo);
		return new ModelAndView("member/member_list_paging.tiles", map);
	}
	
	
	/*************로그인이 필요한 서비스 - interceptor에서 로그인 체크**********************/
	@RequestMapping("modifyMemberInfo.do")
	@ResponseBody
	public ModelAndView modifyMemberInfo(@ModelAttribute Member member, Errors errors, HttpSession session,  HttpServletRequest request, ModelMap map ){
		Member loginInfo = (Member)session.getAttribute("login_info");
		//Validation check
//		new MemberValidator().validate(member, errors);
//		if(errors.hasErrors()){
//			return new ModelAndView("member/info/modify_info.tiles");
//		}
		//session의 login_info 속성의 property들을  수정된 정보로 변경(id, joinDate는 변경 안한다.)
		//로그인 체크 - interceptor가 처리
		String nickname = (String) request.getParameter("nickname");
		request.setAttribute("nickname", nickname);
		String exNick = loginInfo.getNickname();
		String post1 = (String) request.getParameter("postcode1");
		String post2 = (String) request.getParameter("postcode2");
		String address = (String) request.getParameter("address");
		String detailAddress = (String) request.getParameter("detailAddress");
		String emailName = (String) request.getParameter("emailName");
		String emailAddress = (String) request.getParameter("emailAddress");
		String email = emailName+"@"+emailAddress;
		String phoneNo = (String) request.getParameter("phoneNo");
		String zipcode = post1+"-"+post2;
		Member flag = service.getMemberByEmail(email);
		String m = loginInfo.getEmail();
		if(flag!=null&&!m.equals(email)){
			map.addAttribute("error_message", "이미 가입된 이메일입니다.");
			return new ModelAndView("member/info/modify_info.tiles",map);
		}else{
			loginInfo.setNickname(nickname);
			loginInfo.setZipcode(zipcode);
			loginInfo.setAddress(address);
			loginInfo.setDetailAddress(detailAddress);
			loginInfo.setEmail(email);
			loginInfo.setPhoneNo(phoneNo);
			service.modifyMember(loginInfo);
			return new ModelAndView("member/mypage/mypage.tiles");
		}
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
		}else{
			result = "false";
		}
		return result;
	}
	

	/**********************기존 비밀번호 체크********************///
	@RequestMapping("confirmPassword.do")
	@ResponseBody
	public String confirmPassword(@RequestParam String current_password, HttpSession session){
		Member m = (Member)session.getAttribute("login_info");
		String result = null;
			if(current_password.equals(m.getPassword())){
				result = "true";
			}else{
				result = "false";
			}
		return result;
	}
	
	/********************** 비밀번호 수정 ********************/
	@RequestMapping(value="modify_password.do",method=RequestMethod.POST)
	@ResponseBody
	public ModelAndView modifyPassword(@RequestParam String password,HttpSession session){
		Member loginInfo = (Member)session.getAttribute("login_info");
		String id = loginInfo.getId();
		Member m = service.getMemberById(id);
		m.setPassword(password);
		service.modifyPassword(m);
		return new ModelAndView("member/mypage/mypage.tiles");
		}
	
	/********************** 회원 마일리지 값 요청 ********************/
	@RequestMapping("couponTrade.do")
	@ResponseBody
	public ModelAndView couponTrade(HttpSession session,HttpServletRequest request){
		Member m = (Member)session.getAttribute("login_info");
		int mileage = m.getMileage();
		request.setAttribute("mileage", mileage);
		return new ModelAndView("member/info/trade_coupon.tiles");
	}
	
	/********************** 쿠폰 값 요청 ********************/
	@RequestMapping("moneyCheck.do")
	@ResponseBody
	public String moneyCheck(String num,HttpServletRequest request){
		String result = null;
		int num1 = Integer.parseInt(num);
		int num3 = num1 + 1000;
		result = Integer.toString(num3);
		return result;
	}
	
	@RequestMapping("moneyRequest.do")
	@ResponseBody
	public String moneyRequest(String num, HttpServletRequest request){
		String result = null;
		int num1 = Integer.parseInt(num);
		int num3 = num1 - 1000;
		result = Integer.toString(num3); 
		return result;
	}
	
	/********************** 쿠폰 값 요청 ********************/
	@RequestMapping("updateMileage.do")
	@ResponseBody
	public ModelAndView updateMileage(@RequestParam String result,HttpSession session,HttpServletRequest request){
		int exMileage = Integer.parseInt(result);
		Member loginInfo = (Member)session.getAttribute("login_info");
		String id = loginInfo.getId();
		Member m = service.getMemberById(id);
		m.setMileage(exMileage);
		service.modifyMileage(m);
		int mileage = m.getMileage();
		request.setAttribute("mileage", mileage);
		return new ModelAndView("member/info/trade_coupon.tiles");
	}
	
	/**********************닉네임 중복 체크********************/
	@RequestMapping("nickDuplicateCheck.do")
	@ResponseBody
	public String nickDuplicateCheck(@RequestParam String nickname,HttpSession session){
		Member loginInfo = (Member)session.getAttribute("login_info");
		String result = null;
		String exNick = loginInfo.getNickname();
		Member flag = service.getMemberByNickname(nickname);
		if(flag!=null&&!nickname.equals(exNick)){
			result="false";
		}else if(flag==null){
			result="true";
		}else{
			result="true";
		}
		return result;
	}
	
	/**********************핸드폰으로 아이디 찾기********************/
	@RequestMapping("loginIdFind.do")
	@ResponseBody
	public ModelAndView loginIdFind(String name, HttpServletRequest request,ModelMap map){
		String id = null;
		Member m = service.getMemberByName(name);
		if(m!=null){
		String phone = m.getPhoneNo();
		String phoneCP =request.getParameter("phoneCP");
		String num1 = request.getParameter("num1");
		String num2 = request.getParameter("num2");
		String exPhone = phoneCP+"-"+num1+"-"+num2;
			if(phone.equals(exPhone)){
				id = m.getId();
				map.addAttribute("id",id);
				return new ModelAndView("/WEB-INF/view/member/idFind_success.jsp",map);
			}else{
				map.addAttribute("error_message","존재하지 않는 정보입니다");
				return new ModelAndView("/popup/idFind.jsp",map);	
				}
		}else{
			map.addAttribute("error_message", "존재하지 않는 정보입니다.");
			return new ModelAndView("/popup/idFind.jsp",map);
		}
	}
	
	/**********************핸드폰으로 비밀번호 찾기********************/
	@RequestMapping("loginPwFind.do")
	@ResponseBody
	public ModelAndView loginPwFind(String name, HttpServletRequest request,ModelMap map){
		String id = null;
		Member m = service.getMemberByName(name);
		if(m!=null){
		String phone = m.getPhoneNo();
		String phoneCP =request.getParameter("phoneCP");
		String num1 = request.getParameter("num1");
		String num2 = request.getParameter("num2");
		String exPhone = phoneCP+"-"+num1+"-"+num2;
			if(phone.equals(exPhone)){
				id = m.getId();
				request.setAttribute("id", id);
				return new ModelAndView("/WEB-INF/view/member/pwFind_success.jsp");
			}else{
				map.addAttribute("error_message","존재하지 않는 정보입니다");
				return new ModelAndView("/popup/pwFind.jsp",map);	
				}
		}else{
			map.addAttribute("error_message", "존재하지 않는 정보입니다.");
			return new ModelAndView("/popup/pwFind.jsp",map);
		}
	}
	
	/**********************비밀번호 분실시 변경 요청********************/
	@RequestMapping("passwordChange.do")
	@ResponseBody
	public void passwordChange(String password, String passwordCheck, HttpServletRequest request){
		if(password!=passwordCheck){
			
		}else{
		String id = request.getParameter("id");
		Member m = service.getMemberById(id);
		m.setPassword(password);
		service.modifyPassword(m);
		}
		
	}
	/**********************이메일 중복 체크********************/
//	@RequestMapping("emailExistCheck.do")
//	@ResponseBody
//	public String emailExistCheck(@RequestParam String recommend2){
//		String result = null;
//		if(recommend2=="" || service.getMemberById(recommend2)!=null){
//			result = "true";
//			System.out.println(result);
//		}else{
//			result = "false";
//			System.out.println(result);
//		}
//		
//	}
	
	
	
	
	
	
	
}

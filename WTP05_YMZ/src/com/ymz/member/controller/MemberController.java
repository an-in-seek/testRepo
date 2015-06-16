package com.ymz.member.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
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
import com.ymz.member.mail.Email;
import com.ymz.member.mail.EmailSender;
import com.ymz.member.service.MemberService;
import com.ymz.member.vo.Member;
import com.ymz.reportedbbs.service.ReportedBBSService;
import com.ymz.review.service.ReviewService;
import com.ymz.reviewreply.service.ReviewReplyService;

@Controller
@RequestMapping("/member/")
public class MemberController {
	
	@Autowired
	private MemberService service;
	
	@Autowired
	private EmailSender emailSender;
   
	@Autowired
	private Email email;

	@Autowired
	private ReviewService reviewService;
	
	@Autowired
	private ReviewReplyService reviewReplyService;
	
	@Autowired
	private ReportedBBSService reportedBBSService;
   
	
	//회원가입 가기 전 category 뿌려주기
	@RequestMapping("joinBefore.do")
	@ResponseBody
	public ModelAndView joinForm(HttpSession session){
		Map<String,Object> map = new HashMap<String,Object>();
		map = service.getCategory();
		session.setAttribute("map", map);
		return new ModelAndView("member/join_form.tiles");
	}

	//회원 가입
	@RequestMapping(value="join.do", method=RequestMethod.POST)
	public String joinMember(@ModelAttribute Member member, Errors errors, HttpServletRequest request,ModelMap map) throws Exception{
		//요청파라미터 Validator를 이용해 검증
		if(!member.getId().matches("[A-Za-z0-9]{4,12}$")){
			map.addAttribute("error_message", "ID의 양식에 맞지 않습니다");
			return "member/join_form.tiles";
		}

		if(!member.getPassword().matches("[a-zA-Z0-9]{4,24}$")){
			map.addAttribute("error_message", "password의 양식에 맞지 않습니다");
			return "member/join_form.tiles";
		}

		if(!member.getName().matches("[가-힣]{2,10}|^[a-zA-Z]{2,10}$")){
			map.addAttribute("error_message", "이름의 양식에 맞지 않습니다");
			return "member/join_form.tiles";
		}

		if(!member.getNickname().matches("[가-힣a-zA-Z0-9]{2,8}$")){
			map.addAttribute("error_message", "닉네임의 양식에 맞지 않습니다");
			return "member/join_form.tiles";
		}
		String post1 = (String) request.getParameter("postcode1");
		String post2 = (String) request.getParameter("postcode2");
		String phoneCP = (String) request.getParameter("phoneCP");
		String num1 = (String)request.getParameter("num1");
		String num2 = (String)request.getParameter("num2");
		if(!num1.matches("[0-9]{3,4}$")||!num2.matches("[0-9]{3,4}$")){
			map.addAttribute("error_message", "전화번호의 양식에 맞지 않습니다");
			return "member/join_form.tiles";
		}
		if(!num2.matches("[0-9]{3,4}$")||!num2.matches("[0-9]{3,4}$")){
			map.addAttribute("error_message", "전화번호의 양식에 맞지 않습니다");
			return "member/join_form.tiles";
		}
		String phoneNo = phoneCP+"-"+num1+"-"+num2;
		String zipcode = post1+"-"+post2;
		String recommend = (String)request.getParameter("recommend");
		String year = (String)request.getParameter("year");
		String month = (String)request.getParameter("month");
		String day = (String)request.getParameter("day");
		String exbirth = year+""+month+""+day;
		member.setBirth(exbirth);
		String[] favoriteFood = request.getParameterValues("favoriteFood");
		String food = "";
		if(favoriteFood==null){
			food ="없음";
		}else{
			for(String s :favoriteFood ){
				food += s+",";
			}
		}	
		String emailName = (String)request.getParameter("emailName");
		String emailAddress = (String)request.getParameter("emailAddress");
		String exEmail = emailName+"@"+emailAddress;
		//이메일 유효성 검사
		if(!exEmail.matches("[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}")){
			map.addAttribute("error_message", "이메일의 양식에 맞지 않습니다");
			return "member/join_form.tiles";
		}
		//이메일, 전화번호 중복검사
		if(service.getMemberByEmail(exEmail)!=null){
			map.addAttribute("error_message", "이미 가입된 이메일입니다.");
			return "member/join_form.tiles";
		}else if(service.getMemberByPhone(phoneNo)!=null){
			map.addAttribute("error_message", "이미 가입된 전화번호입니다");
			return "member/join_form.tiles";

		}
		member.setZipcode(zipcode);
		member.setEmail(exEmail);
		member.setPhoneNo(phoneNo);
		member.setGrade("user");
		member.setFavoriteFood(food);
		if(service.getMemberById(recommend)!=null){
			Member rm =service.getMemberById(recommend);
			int mileage = rm.getMileage()+100;//추천인으로 추천받아 마일리지 100 추가
			rm.setMileage(mileage);
			service.modifyMember(rm);
			member.setMileage(10);//추천한 고객에게 마일리지 10 추가
			new MemberValidator().validate(member, errors);
			if(errors.hasErrors()){
				return "member/join_form.tiles";
			}
			service.joinMember(member);
		}else{
			member.setMileage(0);
			new MemberValidator().validate(member, errors);
			if(errors.hasErrors()){
				return "member/join_form.tiles";
			}
			service.joinMember(member);
		}
		return "redirect:/member/joinSuccess.do?id="+member.getId();
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
		String url = null;
		Member m = service.getMemberById(id);
		if(m==null){
			url = "member/login_form.tiles";
			map.addAttribute("error_message", "ID를 확인하세요");
			return url;
		}
		String state = m.getState();

		if(m!=null&&!state.equals("탈퇴")){
			if(password.equals(m.getPassword())){
				session.setAttribute("login_info", m);
				url = "redirect:/index.do";
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
	@RequestMapping("login/admin/memberList.do")
	public ModelAndView memberList(@RequestParam(defaultValue="1")int page){
		Map<String, ?> map = service.getMemberListPaging(page);
		return new ModelAndView("member/member_list.tiles",  map);
	}

	// 전체 정보 조회2
	@RequestMapping("login/admin/memberListPaging.do")
	public ModelAndView memberListPaging(@RequestParam(defaultValue="1")int page){
		Map<String, ?> map = service.getMemberListPaging(page);
		return new ModelAndView("member/member_list_paging.tiles", map);
	}

	//리스트에서 (ID,이름,닉네임,등급)으로 회원정보 조회
	@RequestMapping("login/admin/findMemberByInfo.do")
	public  ModelAndView findMemberByInfo(@RequestParam String info, @RequestParam String command, @RequestParam(defaultValue="1")int page){
		Map<String, String> map = service.getMemberByInfo(info, command, page);
		map.put("command", command);
		map.put("info", info);
		return new ModelAndView("member/member_list_paging.tiles", map);
	}


	/*************로그인이 필요한 서비스 - interceptor에서 로그인 체크**********************/
	@SuppressWarnings("unused")
	@RequestMapping("modifyMemberInfo.do")
	@ResponseBody
	public ModelAndView modifyMemberInfo(@ModelAttribute Member member, Errors errors, HttpSession session,  HttpServletRequest request, ModelMap map ){
		Member loginInfo = (Member)session.getAttribute("login_info");
		String exEmail = loginInfo.getEmail();
		String exPhone = loginInfo.getPhoneNo();
		String nickname = (String) request.getParameter("nickname");
		if(!nickname.matches("[가-힣a-zA-Z0-9]{2,8}$")){
			map.addAttribute("error_message", "닉네임의 양식에 맞지 않습니다");
			return new ModelAndView("member/info/modify_info.tiles",map);
		}
		String exNick = loginInfo.getNickname();
		String post1 = (String) request.getParameter("postcode1");
		String post2 = (String) request.getParameter("postcode2");
		String address = (String) request.getParameter("address");
		String detailAddress = (String) request.getParameter("detailAddress");
		String emailName = (String) request.getParameter("emailName");
		String emailAddress = (String) request.getParameter("emailAddress");
		String email = emailName+"@"+emailAddress;
		//이메일 유효성검사
		if(!email.matches("[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}")){
			map.addAttribute("error_message", "이메일의 양식에 맞지 않습니다");
			return new ModelAndView("member/info/modify_info.tiles",map);
		}
		String phoneCP = (String) request.getParameter("phoneCP");
		String num1 = (String) request.getParameter("num1");
		String num2 = (String) request.getParameter("num2");
		//전화번호 유효성검사
		if(!num1.matches("[0-9]{3,4}$")||!num2.matches("[0-9]{3,4}$")){
			map.addAttribute("error_message", "전화번호의 양식에 맞지 않습니다");
			return new ModelAndView("member/info/modify_info.tiles",map);
		}
		if(!num2.matches("[0-9]{3,4}$")||!num2.matches("[0-9]{3,4}$")){
			map.addAttribute("error_message", "전화번호의 양식에 맞지 않습니다");
			return new ModelAndView("member/info/modify_info.tiles",map);
		}
		String phoneNo = phoneCP+"-"+num1+"-"+num2;
		String zipcode = post1+"-"+post2;
		//이메일 중복검사
		if(service.getMemberByEmail(email)!=null&&!email.equals(exEmail)){
			map.addAttribute("error_message", "이미 가입된 이메일입니다.");
			return new ModelAndView("member/info/modify_info.tiles",map);
		}
		//전화번호 중복검사
		if(service.getMemberByPhone(phoneNo)!=null&&!phoneNo.equals(exPhone)){
			map.addAttribute("error_message", "이미 가입된 전화번호입니다.");
			return new ModelAndView("member/info/modify_info.tiles",map);
		}
		loginInfo.setNickname(nickname);
		loginInfo.setZipcode(zipcode);
		loginInfo.setAddress(address);
		loginInfo.setDetailAddress(detailAddress);
		loginInfo.setEmail(email);
		loginInfo.setPhoneNo(phoneNo);
		service.modifyMember(loginInfo);
		return new ModelAndView("/member/login/mypage.do");

	}


	
	// 정보 제거하기
	@RequestMapping("login/removeMember.do")
	public String removeMember(HttpSession session, ModelMap map){
		//로그인 처리는 interceptor가 처리
		Member loginInfo = (Member)session.getAttribute("login_info");
		service.removeMemberById(loginInfo.getId());
		//session 제거
		session.invalidate();
		return "redirect:/index.do";//삭제후 메인페이지로 이동
	}
	
	// 정보 제거하기(관리자 전용)
	@RequestMapping("login/admin/removeMemberByMaster.do")
	public String removeMember(@RequestParam String id, ModelMap map){
		service.removeMemberById(id);
		//session 제거
		return "/member/login/admin/memberListPaging.do";//삭제후 메인페이지로 이동
	}
	
	// 로그아웃
	@RequestMapping("login/logout")
	public String logout(HttpSession session, HttpServletResponse response){
		session.invalidate();
		return "redirect:/index.do";
	}
	
	/**********************ID 중복검사 -Ajax 요청처리***********************/
	@RequestMapping("idDuplicateCheck.do")
	@ResponseBody
	public String idDuplicateCheck(String id){
		String result = null;
		if(id=="" || service.getMemberById(id)!=null){
			result = "false";
		}else{
			result = "true";
		}
		return result;
	}
	
	/**********************리스트에서 id로 회원정보 요청한 것 처리 -Ajax 요청처리***********************/
	@RequestMapping("login/admin/findMemberById")
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
	
	/**********************리스트에서 nickname으로 회원정보 존재 유무 요청 처리 -Ajax 요청처리********************/
	@RequestMapping("nickExistCheck.do")
	@ResponseBody
	public String nickExistCheck(String nickname){
		String result = null;
		
		if(service.getMemberByNickname(nickname)!=null){
			result = "false";
		}else{
			result = "true";
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
		Member login_Info = (Member)session.getAttribute("login_info");
		String id = login_Info.getId();
		Member m = service.getMemberById(id);
		m.setPassword(password);
		service.modifyPassword(m);
		session.setAttribute("login_info", m);
		return new ModelAndView("/member/login/mypage.do");
		}
	
	/********************** 회원 마일리지 값 요청 ********************/
	@RequestMapping("couponTrade.do")
	@ResponseBody
	public ModelAndView couponTrade(HttpSession session,HttpServletRequest request){
		Member m = (Member)session.getAttribute("login_info");
		if(m!=null){
		int mileage = m.getMileage();
		request.setAttribute("mileage", mileage);
		return new ModelAndView("member/info/trade_coupon.tiles");
		}
		return new ModelAndView("redirect:index.do");
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
		session.setAttribute("login_info", m);
		Member m2 = service.getMemberById(id);
		int mileage = m2.getMileage();
		request.setAttribute("mileage", mileage);
		return new ModelAndView("redirect:/member/login/mypage.do");
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
	public ModelAndView loginIdFind(String nickname, HttpServletRequest request, ModelMap map){
		Member m = service.getMemberByNickname(nickname);
		if(m!=null){
		String state = m.getState();
		String phone = m.getPhoneNo();
		String phoneCP =request.getParameter("phoneCP");
		String num1 = request.getParameter("num1");
		String num2 = request.getParameter("num2");
		String exPhone = phoneCP+"-"+num1+"-"+num2;
			if(phone.equals(exPhone)&&!state.equals("탈퇴")){
				String id = m.getId();
				request.setAttribute("id", id);
				return new ModelAndView("/WEB-INF/view/member/idFind_success.jsp");
			}else{
				map.addAttribute("error_message","존재하지 않는 정보입니다");
				return new ModelAndView("/popup/idFind.jsp",map);	
				}
		}else{
			map.addAttribute("error_message", "존재하지 않는 정보입니다.");
			return new ModelAndView("/popup/idFind.jsp",map);
		}
	}
	
	/**********************이메일 인증 체크********************/
	@SuppressWarnings("resource")
	@RequestMapping("sendpw.do")
	@ResponseBody
	public ModelAndView sendpw(String id, String nickname, String emailName,String emailAddress, ModelMap map){
		ApplicationContext context = new ClassPathXmlApplicationContext("/com/ymz/member/mail/Spring_Mail.xml");
	    	Member checkId =service.getMemberById(id);
	    	if(checkId!=null){
	    		Member checkName = service.getMemberByNickname(nickname);
	    		String state = checkId.getState();
	    		String exName1 = checkId.getNickname();
	    		String exEmail = checkId.getEmail();
	    		String checkEmail = emailName+"@"+emailAddress;
	    		Member m = service.getMemberByEmail(checkEmail);
	    		if(m!=null&&!state.equals("탈퇴")&&checkName!=null){
	    			String exEmail2 = checkName.getEmail();
	    			String exName2 = checkName.getNickname();
	    			String email = m.getEmail();
	    			if(exName1.equals(exName2)&&exEmail.equals(email)&&exEmail2.equals(email)){
	    				EmailSender mm = (EmailSender) context.getBean("EmailSender");
	    				int password = (int)(Math.random()*(99999-1000+1))+1000;
	    				String exPassword = Integer.toString(password);
	    				mm.sendMail("yameokzamanager@gmail.com",
	    						email,
	    						"야먹자의 임시비밀번호가 발급되었습니다", 
	    						"당신의 임시비밀번호는 "+exPassword+" 입니다.<br>다시 로그인 해주십시오");
	    				m.setPassword(exPassword);
	    				service.modifyPassword(m);
	    				return new ModelAndView("/popup/findPw_success.jsp");
	    			}
	    				map.addAttribute("error_message", "존재하지 않는 정보입니다.");
		    			return new ModelAndView("/popup/pwFind.jsp",map);
	    			
	    			
	    		}
	    			map.addAttribute("error_message", "존재하지 않는 정보입니다");
	    			return new ModelAndView("/popup/pwFind.jsp",map);
	    		
	    	}else{
	    		map.addAttribute("error_message", "존재하지 않는 정보입니다.");
    			return new ModelAndView("/popup/pwFind.jsp",map);
		}	
	    	
	}
	
	/**********************마이페이지 메인화면********************/
	@RequestMapping("login/mypage.do")
	public ModelAndView moveMypage(HttpSession session,  ModelMap map, @RequestParam(defaultValue="bbs") String state,
			@RequestParam(defaultValue="1") int pageNo, @RequestParam(defaultValue="1") int pageNo2, @RequestParam(defaultValue="1") int pageNo3){
		Member member = (Member) session.getAttribute("login_info");
		map.put("myBBS", reviewService.getReviewListPagingById(pageNo, member.getId()));
		map.put("myReply", reviewReplyService.getReviewReplyListPagingById(pageNo2, member.getId()));
		map.put("myReport", reportedBBSService.getReportedBBSListById(pageNo3, member.getId()));
		map.put("member", member);
		map.put("state", state);
		return new ModelAndView("member/main/mypage_body.tiles", map);
	}
}



	

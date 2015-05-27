package com.ymz.member.controller;

import java.io.File;
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
import org.springframework.web.multipart.MultipartFile;
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
		// 파일 업로드 처리
		MultipartFile file = member.getPicture();
		if(file != null && !file.isEmpty()){
			String path = request.getServletContext().getRealPath("/uploadPhoto");
			String fileName = System.currentTimeMillis()+"";
			File pic = new File(path, fileName);
			file.transferTo(pic);//파일 이동
			member.setPictureName(fileName);
		}
		service.joinMember(member);
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
		/**********************************************************************
		 * 파일 업로드 처리
		 * 업로드된 파일이 있으면 사진을 변경하는 것이고 없으면 기존 사진을 유지하는 것으로 처리
		 * 1-1사진이 사진 변경 처리와 기존 사진 삭제를 처리한다.
		 * 		파일명을 현재일시(밀리초)로 수정후 사진을 uploadPoto 경로로 옮긴다.
		 * 		session에서 기존사진의 파일명을 가져와 uploadPhoto 에서 삭제한다. 
		 * 1-2사진이 없으면 pictureName을 수정하지 않는다.
		 * 
		 **********************************************************************/
		MultipartFile file = member.getPicture();
		
		String newFileName = null;
		if(file!=null && !file.isEmpty()){
			//파일 uploadPhoto로 옮기기
			newFileName = System.currentTimeMillis()+"";
			System.out.println(newFileName+" : "+file.getOriginalFilename()+" : "+loginInfo.getPictureName());
			File picture = new File(request.getServletContext().getRealPath("/uploadPhoto"), newFileName);
			file.transferTo(picture);
			//기존 사진이 있는 경우 삭제
			if(loginInfo.getPictureName()!=null){
				File oldPic = new File(request.getServletContext().getRealPath("/uploadPhoto"), loginInfo.getPictureName());
				oldPic.delete();
			}
			member.setPictureName(newFileName);//DAO로 넘길 VO의 사진이름 값 변경
		}
		
		//로그인 체크 - interceptor가 처리
		service.modifyMember(member);//수정 처리
		
		//session의 login_info 속성의 property들을  수정된 정보로 변경(id, joinDate는 변경 안한다.)
		loginInfo.setName(member.getName());
		loginInfo.setEmail(member.getEmail());
		loginInfo.setPassword(member.getPassword());
		if(newFileName != null){//업로드된 사진이 있어 newFileName의 값이 설정 되 있으면
			loginInfo.setPictureName(newFileName);//세션에 사진 이름 값 변경
		}
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

}

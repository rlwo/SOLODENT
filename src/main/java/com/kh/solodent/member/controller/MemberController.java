package com.kh.solodent.member.controller;

import java.sql.Date;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

import com.kh.solodent.member.model.exception.MemberException;
import com.kh.solodent.member.model.service.MemberService;
import com.kh.solodent.member.model.vo.Member;





@SessionAttributes("loginUser")
@Controller
public class MemberController {
	
	@Autowired
	private MemberService mService;
	@Autowired
	private BCryptPasswordEncoder bcrypt;
	
	@RequestMapping(value="loginView.me", method=RequestMethod.GET)
	public String loginView() {
		System.out.println("로그인 처리");
		return "login";
	}
	
	//로그아웃 2 
		@RequestMapping("logout.me")
		public String logout(SessionStatus status) {
			status.setComplete();
			return "redirect:home.do";
		}
		
		//회우너가입 페이지 이동
		@RequestMapping("enroll.me")
		public String enroll() {
			return "enroll";
		}
		// 암호화 후 로그인
		@RequestMapping(value="login.me", method=RequestMethod.POST)
		public String login(Member m, Model model){
				Member loginUser = mService.login(m);
				System.out.println(loginUser);
				System.out.println(m);
				System.out.println(bcrypt);
				String encPwd = bcrypt.encode(m.getPwd());
				System.out.println(encPwd);
				if(bcrypt.matches(m.getPwd(), loginUser.getPwd())){
					model.addAttribute("loginUser", loginUser);
					return "redirect:home.do";
					
				}else {
					throw new MemberException("로그인에 실패하였습니다");
				}
			}
		
		// 회원가입
		@RequestMapping("insertMember.me")
		public String insertMember(@ModelAttribute Member m, @RequestParam("yyyy") String yyyy, @RequestParam("mm") String mm, @RequestParam("dd") String dd ) {
			System.out.println(m);
			
			String birthDate = null;
			if(!yyyy.trim().equals("")) {
				birthDate = yyyy + "년" +  mm + "월" +  dd + "일";
			}
			
			m.setBirthDate(birthDate);
			
			String encPwd = bcrypt.encode(m.getPwd());
			
			m.setPwd(encPwd);
			int result = mService.insertMember(m);
			
			if(result > 0) {
				return "redirect:home.do";
			}else {
				throw new MemberException("회원가입 실패");
			}
		}
		//마이페이지
		@RequestMapping("myInfo.me")
		public String myInfo(HttpSession session, Model model) {
			String id = ((Member)session.getAttribute("loginUser")).getId();
			
			ArrayList<HashMap<String, Object>> list= mService.selectMyList(id);
			model.addAttribute("list", list);
			return "myInfo";
			
		}
		
		//아이디찾기 페이지 이동
		@RequestMapping("findId.me")
		public String findId() {
			return "findId";
		}
		//아이디찾기 페이지 이동
		@RequestMapping("findPwd.me")
		public String findPwd() {
			return "findPwd";
	}
		//아이디체크
				@RequestMapping("checkId.me")
				@ResponseBody
				public String checkId(@RequestParam("id") String id) {
					int count = mService.checkId(id);
					String result = count == 0 ? "yes" : "no";
					
					return result;
			}
		//닉네임체크
		@RequestMapping("checkNickName.me")
		@ResponseBody
		public String checkNickName(@RequestParam("nickName") String nickName) {
			int count = mService.checkNickName(nickName);
			String result = count == 0 ? "yes" : "no";
			
			return result;
	}
		//회원 수정
		@RequestMapping("updateMember.me")
		public String updateMember(@ModelAttribute Member m, Model model, @RequestParam("pwd1") String pwd1) {
			String pwd = null;
			System.out.println("확인" + m);
			System.out.println(pwd1);
			if(!pwd1.trim().equals("")) {
				pwd= "${ loginUser.pwd }";
				m.setPwd(pwd);
			}else {
			m.setPwd(bcrypt.encode(pwd1));
			}
			int result = mService.updateMember(m);
			
			if(result > 0) {
				model.addAttribute("loginUser", mService.login(m));
				return "redirect:myInfo.me";
			}else {
				throw new MemberException("회원수정을 실패하였습니다.");
			}
			
	}
		
		
		//이메일 인증
		@RequestMapping("mailCheck.me")
		@ResponseBody
		public String mailCheck(String email) {
			System.out.println("이메일 인증 요청이 들어옴!");
			System.out.println("이메일 인증 이메일 : " + email);
			return email;
		}
		
		@RequestMapping("deal.me")
		public String deal() {
			return "deal";
		}
		@RequestMapping("dealRegister.me")
		public String dealRegister() {
			return "dealRegister";
		}
		
			
}

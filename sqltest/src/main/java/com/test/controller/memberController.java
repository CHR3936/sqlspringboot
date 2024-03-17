package com.test.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.Errors;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.context.annotation.SessionScope;

import com.test.dao.memberDAO;
import com.test.model.memberDTO;
import com.test.service.memberService;


@Controller
public class memberController {

	@Autowired
	private memberService ms;
	
	// 로그인 폼 
	@RequestMapping("loginform")
	public String loginform() {
		return "member/loginform";
	}
	
	// 회원가입 폼
	@RequestMapping("memberjoinform")
	public String memberjoinform() {
		return "member/memberjoinform";
	}
	
	
	// 회원가입
	@RequestMapping("memberjoin")
	public String memberjoin(@ModelAttribute memberDTO member, Model model) {
		
		int result = ms.memberInsert(member);
		
		model.addAttribute("result", result);
		
		return "member/joinresult";
	}
	
	// 로그인
	@RequestMapping("login")
	public String login(String id, String passwd,HttpSession session,
						Model model) throws Exception{

		int result = 0;
		memberDTO member = ms.login(id);
		
		if(member == null) {
			result = -1;
			model.addAttribute("result", result);
			
			return "member/loginresult";
		}
		
		// 로그인 성공
		if(member.getPasswd().equals(passwd)) {
			session.setAttribute("nick", member.getNick());
			return "redirect:commlist";
		
		
		// 회원 정보가 틀릴 경우 
		}else {
			result = -2;
			model.addAttribute("result", result);
			return "member/loginresult";
		}
		
		
		
	}
	
	// 로그아웃
	@RequestMapping("logout")
	public String logout(HttpSession session) {
		
		session.invalidate();
		
		return "redirect:commlist";
	}

	// 닉네임 중복검사
	@RequestMapping("nickcheck")
	@ResponseBody
	public Integer nickcheck(@RequestParam("nick") String nick) {
		System.out.println("닉네임 중복검사");
		
		int result = ms.nickCheck(nick);
		
		return result;
	}

	// 아이디 찾기 폼
	@RequestMapping("idfindform")
	public String idfindform() {
		
		return "member/idfindform";
	}
	
	// 아이디 찾기
	@RequestMapping("idfind")
	public String idfind(@RequestParam("nick") String nick, Model model) {
		
		System.out.println("nick" + nick);
		memberDTO member = ms.getMember(nick);
		
		if(member == null) {
			int result = -2;
			model.addAttribute("result", result);
		}
		
		model.addAttribute("member", member);
				
		return "member/idresultform";
	}

	// 비밀번호 찾기 폼
	@RequestMapping("passfindform")
	public String passfindform() {
		
		return "member/passfindform";
	}

	// 마이페이지
	@RequestMapping("mypage")
	public String mypage(HttpSession session) {
		
		return "member/mypage";
	}
	
}	// class end


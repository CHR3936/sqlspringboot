package com.test.controller;

import java.util.Map;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.test.dao.memberDAO;
import com.test.model.memberDTO;
import com.test.service.memberService;


@Controller
public class memberController {

	@Autowired
	private memberService ms;
	
	@RequestMapping("loginform")
	public String loginform() {
		return "member/loginform";
	}
	
	
	@RequestMapping("memberjoinform")
	public String memberjoinform() {
		return "member/memberjoinform";
	}
	
	@RequestMapping("memberjoin")
	public String memberjoin(@ModelAttribute memberDTO member, Model model) {
		
		int result = ms.memberInsert(member);
		
		model.addAttribute("result", result);
		
		return "member/joinresult";
	}
	
	@RequestMapping("login")
	public String login(HttpSession session,
						memberDTO member,
						Model model) {
		
		session.setAttribute("nick", member.getNick());
		
		return "redirect:commlist";
	}
	
	@RequestMapping("logout")
	public String logout(HttpSession session) {
		
		session.invalidate();
		
		return "redirect:commlist";
	}
}


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
	public String memberjoin(@Valid memberDTO member,Errors errors, Model model) {
		
		if(errors.hasErrors()) {
			model.addAttribute("member", member);
			
			Map<String, String> validatorResult = ms.validateHandling(errors);
			for(String key : validatorResult.keySet()) {
				model.addAttribute(key, validatorResult.get(key));
			}
			
			return "memberjoinform";
		}
		
		int result = ms.memberJoin(member);		
		
		model.addAttribute("result", result);
		return "commlist";
	}
}


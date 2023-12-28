package com.test.controller;

import java.util.Random;

import org.apache.commons.mail.HtmlEmail;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;


import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor

public class mailController {
	
	
	
	@RequestMapping("mm")
	public String sendform() {
		return "Mail";
	}
	
	
	
	@RequestMapping("send.do")
	public String send(@RequestParam("mail") String mail,
					   Model model) {

		Random random = new Random();
		int a = random.nextInt(100);

		// Mail Server 설정
				String charSet = "utf-8";
				String hostSMTP = "smtp.naver.com";
				String hostSMTPid = "gpfus3936@naver.com";
				String hostSMTPpwd = "0000000*"; 	// 비밀번호 입력

				// 보내는 사람 EMail, 제목, 내용
				String fromEmail = "gpfus3936@naver.com";
				String fromName = "친절한 홍길동씨";
				String subject = "Overflow인증메일입니다.";

		// 받는 사람 E-Mail 주소
		//String mail = model;

		try {
			HtmlEmail email = new HtmlEmail();
			email.setDebug(true);
			email.setCharset(charSet);
			email.setSSL(true);
			email.setHostName(hostSMTP);
			email.setSmtpPort(587);

			email.setAuthentication(hostSMTPid, hostSMTPpwd);
			email.setTLS(true);
			email.addTo(mail, charSet);
			email.setFrom(fromEmail, fromName, charSet);
			email.setSubject(subject);
			email.setHtmlMsg("<p align = 'center'>Overflow에 오신것을 환영합니다.</p><br>" 
							 + "<div align='center'> 인증번호 : " + a + "</div>");
			email.send();
		} catch (Exception e) {
			System.out.println(e);
		}		
		model.addAttribute("result", "good~!!\n 등록된 E-Mail 확인");

		return "result";
	}
}
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
import org.springframework.web.bind.annotation.ResponseBody;

import com.test.configuration.MailConfiguration;
import com.test.model.memberDTO;
import com.test.service.memberService;

import lombok.RequiredArgsConstructor;
import lombok.Value;

@Controller
public class mailController {
	
	@Autowired
	private MailConfiguration mailcon;
	
	@Autowired
	private memberService ms;
	
		
	@RequestMapping("mm")
	public String sendform() {
		return "Mail";
	}
	
	
	
	@RequestMapping("send.do")
	@ResponseBody
	public Integer send(@RequestParam("mail") String mail,
					   Model model) {

		Random random = new Random();
		int a = random.nextInt(888888) + 111111;
		
		
		// Mail Server 설정
		String charSet = mailcon.getCharSet();
		String hostSMTP = mailcon.getHostSMTP();
		String hostSMTPid = mailcon.getHostSMTPid();
		String hostSMTPpwd = mailcon.getHostSMTPpwd();

		// 보내는 사람 EMail, 제목, 내용
		String fromEmail = mailcon.getFromEmail();
		String fromName = "Community Mail";
		String subject = "Community 인증메일입니다.";

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
			email.setHtmlMsg("<p align = 'center'>Community 가입 인증번호입니다.</p><br>" 
							 + "<div align='center'> 인증번호 : " + a + "</div>");
			email.send();
		} catch (Exception e) {
			System.out.println(e);
		}		

		return a;
	}
	
	@RequestMapping("passfind")
	@ResponseBody
	public Integer passfind(@RequestParam("id") String id,
			Model model) {
		
		System.out.println("mail:" + id);
		String mail = id;
					
		String b = ms.getPass(id);		
		int a = -2;
		
		if(b != null) {

		 a = 1;
		
		// Mail Server 설정
		String charSet = mailcon.getCharSet();
		String hostSMTP = mailcon.getHostSMTP();
		String hostSMTPid = mailcon.getHostSMTPid();
		String hostSMTPpwd = mailcon.getHostSMTPpwd();
		
		// 보내는 사람 EMail, 제목, 내용
		String fromEmail = mailcon.getFromEmail();
		String fromName = "Betta Mail";
		String subject = "Betta 비밀번호입니다.";
		
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
			email.setHtmlMsg("<p align = 'center'>Betta 비밀번호입니다.</p><br>" 
					+ "<div align='center'> 인증번호 : " + b + "</div>");
			email.send();
		} catch (Exception e) {
			System.out.println(e);
		}	
		}
		return a;
		
		
	}
}
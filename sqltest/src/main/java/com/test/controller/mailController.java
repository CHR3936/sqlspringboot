package com.test.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.test.model.MailVo;

import lombok.RequiredArgsConstructor;
import com.test.service.mailService;

@Controller
@RequiredArgsConstructor

public class mailController {

    private final mailService mailService;

    @GetMapping("mm")
    public String MailPage(){
        return "Mail";
    }

    @PostMapping("/mail")
    public void MailSend(MailVo mailVo){
        mailService.CreateMail(mailVo);
    }

}
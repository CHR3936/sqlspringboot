package com.test.service;

import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

import com.test.model.MailVo;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class mailService {

    private final JavaMailSender javaMailSender;

    private static final String senderEmail= "gpfus3936@naver.com";

    public void CreateMail(MailVo mailVo){

        SimpleMailMessage message = new SimpleMailMessage();
        message.setTo(mailVo.getReceiver());
        message.setFrom(senderEmail);
        message.setSubject(mailVo.getTitle());
        message.setText(mailVo.getContent());

        javaMailSender.send(message);
    }
}
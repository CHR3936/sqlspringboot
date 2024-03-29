package com.test.service;

import java.lang.reflect.Field;
import java.util.HashMap;
import java.util.Map;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.validation.Errors;
import org.springframework.validation.FieldError;

import com.test.dao.memberDAO;
import com.test.model.memberDTO;

@Service
public class memberService {

	@Autowired
	private memberDAO md;

	public int memberInsert(memberDTO member) {
		// TODO Auto-generated method stub
		return md.memberInsert(member);
	}

	public memberDTO login(String id) {
		// TODO Auto-generated method stub
		return md.login(id);
	}

	public int nickCheck(String nick) {
		// TODO Auto-generated method stub
		return md.nickCheck(nick);
	}

	public memberDTO getMember(String nick) {
		// TODO Auto-generated method stub
		return md.getMember(nick);
	}

	public String getPass(String id) {
		// TODO Auto-generated method stub
		return md.getPass(id);
	}


	
}

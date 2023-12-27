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

	public Map<String, String> validateHandling(Errors errors) {
		// TODO Auto-generated method stub
		Map<String, String> validatorResult = new HashMap<>();
		
		for(FieldError error : errors.getFieldErrors()) {
			String vaildKeyName = String.format("vaild_%s", error.getField());
			validatorResult.put(vaildKeyName, error.getDefaultMessage());
		}
		
		return validatorResult;
	}

	public int memberJoin(@Valid memberDTO member) {
		// TODO Auto-generated method stub
		return md.memberJoin(member);
	}


	
}

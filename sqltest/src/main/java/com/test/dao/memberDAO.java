package com.test.dao;

import javax.validation.Valid;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.test.model.memberDTO;

@Repository
public class memberDAO {

	@Autowired
	private SqlSession mse;

	public int memberInsert(memberDTO member) {
		return mse.insert("memberInsert", member);
	}

	public memberDTO login(String id) {
		return mse.selectOne("login", id);
	}

	public int nickCheck(String nick) {
		int result = -1;     // 사용 가능한 닉네임
		memberDTO m = mse.selectOne("nickCheck", nick);
		if(m != null) {      
			result = 1;      //  중복 닉네임
		}
		
		return result;
	}

	public memberDTO getMember(String nick) {
		// TODO Auto-generated method stub
		return mse.selectOne("getMember", nick);
	}

	
	
}

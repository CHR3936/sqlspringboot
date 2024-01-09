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
		// TODO Auto-generated method stub
		return mse.insert("memberInsert", member);
	}

	public memberDTO login(String id) {
		// TODO Auto-generated method stub
		return mse.selectOne("login", id);
	}

	public int nickCheck(String nick) {
		// TODO Auto-generated method stub
		return mse.selectOne("nickCheck", nick);
	}

	
	
}

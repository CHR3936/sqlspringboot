package com.test.dao;

import javax.validation.Valid;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.test.model.memberDTO;

@Repository
public class memberDAO {

	@Autowired
	private SqlSession msession;

	public int memberJoin(@Valid memberDTO member) {
		// TODO Auto-generated method stub
		return msession.insert("memberJoin", member);
	}

	
	
}

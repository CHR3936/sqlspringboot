package com.test.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.test.model.commDTO;
import com.test.model.memberDTO;

@Repository
public class commDAO {

	@Autowired
	private SqlSession session;

	public int commInsert(commDTO comm) {
		// TODO Auto-generated method stub
		return session.insert("commInsert", comm);	
	}

	public int getCommCount() {
		// TODO Auto-generated method stub
		return session.selectOne("getCommCount");
	}

	public List<memberDTO> getCommList(int start) {
		// TODO Auto-generated method stub
		return session.selectList("getCommList", start);
	}

	public void getUpdateCount(int no) {
		// TODO Auto-generated method stub
		 session.update("commUpdateCount", no);
	}

	public commDTO getCommunity(int no) {
		// TODO Auto-generated method stub
		return session.selectOne("getCommunity", no);
	}

	public void commUpdate(commDTO comm) {
		// TODO Auto-generated method stub
		session.update("commUpdate", comm);
	}

	public int commDelete(int no) {
		// TODO Auto-generated method stub
		return session.delete("commDelete", no);
	}

	
	
}


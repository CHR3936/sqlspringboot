package com.test.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.test.model.replyDTO;

@Repository
public class replyDAO {
	
	@Autowired
	private SqlSession rses;

	public int replyInsert(replyDTO reply) {
		// TODO Auto-generated method stub
		return rses.insert("replyInsert", reply);
	}

	
	public List<replyDTO> getReplyList(int no) {
		// TODO Auto-generated method stub
		return rses.selectList("getReplyList", no);
	}

}

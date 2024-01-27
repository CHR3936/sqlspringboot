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


	public int replyUpdate(int reply_no) {
		// TODO Auto-generated method stub
		return rses.update("replyUpdate", reply_no);
	}


	public int replyDelete(replyDTO reply) {
		// TODO Auto-generated method stub
		return rses.delete("replyDelete", reply);
	}


	public String replySelect(int reply_no) {
		// TODO Auto-generated method stub
		return rses.selectOne("replySelect", reply_no);
	}




}

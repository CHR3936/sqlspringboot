package com.test.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.test.dao.replyDAO;
import com.test.model.replyDTO;

@Service
public class replyService {

	@Autowired 
	private replyDAO rd;
	
	public int replyInsert(replyDTO reply) {
		// TODO Auto-generated method stub
		return rd.replyInsert(reply);
	}

	public List<replyDTO> getReplyList(int no) {
		// TODO Auto-generated method stub
		return rd.getReplyList(no);
	}

	public int replyUpdate(int reply_no) {
		// TODO Auto-generated method stub
		return rd.replyUpdate(reply_no);
	}

	public int replyDelete(replyDTO reply) {
		// TODO Auto-generated method stub
		return rd.replyDelete(reply);
	}

	public String replySelect(int reply_no) {
		// TODO Auto-generated method stub
		return rd.replySelect(reply_no);
	}



	
}

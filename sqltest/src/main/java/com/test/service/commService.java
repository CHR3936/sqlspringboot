package com.test.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestMapping;

import com.test.dao.commDAO;
import com.test.model.commDTO;
import com.test.model.memberDTO;

@Service
public class commService {

	@Autowired
	private commDAO cd;

	public int commInsert(commDTO comm) {
		// TODO Auto-generated method stub
		return cd.commInsert(comm);
	}

	public int getCommCount() {
		// TODO Auto-generated method stub
		return cd.getCommCount();
	}

	public List<memberDTO> getCommList(int start) {
		// TODO Auto-generated method stub
		return cd.getCommList(start);
	}

	public void commUpdateCount(int no) {
		// TODO Auto-generated method stub
		 cd.getUpdateCount(no);
	}

	public commDTO getCommunity(int no) {
		// TODO Auto-generated method stub
		return cd.getCommunity(no);
	}

	public void commUpdate(commDTO comm) {
		// TODO Auto-generated method stub
		cd.commUpdate(comm);
	}

	public int commDelete(int no) {
		// TODO Auto-generated method stub
		return cd.commDelete(no);
	}

	public int commGetSearch(commDTO comm) {
		// TODO Auto-generated method stub
		return cd.commGetSearch(comm);
	}

	public List<memberDTO> getSearchList(commDTO comm) {
		// TODO Auto-generated method stub
		return cd.getSearchList(comm);
	}

	
	
	
}

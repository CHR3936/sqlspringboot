package com.test.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.test.model.replyDTO;
import com.test.service.replyService;

@Controller
@RequestMapping("/reply")
public class replyController {

	@Autowired
	private replyService rs;

	@PostMapping("/replyinsert")
	@ResponseBody
	public ResponseEntity<Integer> replyinsert(@RequestBody replyDTO reply, HttpSession session) {

		System.out.println("replyinsert 진입");

		String snick = (String) session.getAttribute("nick");

		if (snick != null) {
			int result = rs.replyInsert(reply);
			System.out.println("result : " + result);
			return new ResponseEntity<>(result, HttpStatus.OK);

		} else if (snick == null) {
			int result = -2;
			return new ResponseEntity<>(result, HttpStatus.OK);

		} else {
			int result = -1;
			return new ResponseEntity<>(result, HttpStatus.OK);
		}

	}

	@GetMapping("/replylist/{no}")
	@ResponseBody
	public ResponseEntity<Map<String, Object>> replylist(@PathVariable("no") int no) {

		System.out.println("replylist 진입");
		List<replyDTO> replylist = rs.getReplyList(no);
		System.out.println("replylist:" + replylist);

		Map map = new HashMap<>();
		map.put("replylist", replylist);

		return new ResponseEntity<>(map, HttpStatus.OK);
	}

	@PutMapping("/replyupdate/{reply_no}")
	@ResponseBody
	public ResponseEntity<Integer> replyupdate(@RequestBody replyDTO reply) {

		int result = rs.replyUpdate(reply.getReply_no());

		return new ResponseEntity<>(result, HttpStatus.OK);
	}

	@DeleteMapping("/replydelete")
	@ResponseBody
	public ResponseEntity<Integer> replydelete(@RequestBody replyDTO reply, HttpSession session) {

		String snick = (String) session.getAttribute("nick");
		System.out.println(snick);
		
		if(snick == null) {
			int result = -2;
			return new ResponseEntity<>(result, HttpStatus.OK);
		}
		
		String nick = rs.replySelect(reply.getReply_no());
		System.out.println(nick);

		System.out.println("replydelete 진입");

		if (snick.equals(nick)) {
			int result = rs.replyDelete(reply);
			System.out.println("result : " + result);

			return new ResponseEntity<>(result, HttpStatus.OK);

		} else {
			int result = -1;
			return new ResponseEntity<>(result, HttpStatus.OK);
		}

	}

}

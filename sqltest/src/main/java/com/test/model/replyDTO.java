package com.test.model;

import java.sql.Timestamp;
import java.util.Date;

import org.apache.ibatis.type.Alias;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@Alias("reply")
public class replyDTO {

	private int rno;
	private int bno;
	private String nick;
	private String re_content;
	private Timestamp re_date;
}

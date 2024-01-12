package com.test.model;

import java.util.Date;

import org.apache.ibatis.type.Alias;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@Alias("reply")
public class replyDTO {

	private int no;
	private String nick;
	private String re_content;
	private Date re_date;
	private int ref;
	private int level;
	private int step;
}

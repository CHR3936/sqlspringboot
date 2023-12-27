package com.test.model;

import java.util.Date;

import org.apache.ibatis.type.Alias;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@Alias("comm")
public class commDTO {

	
	private int no;
	private String nick;
	private String title;
	private String content;
	private int read_count;
	private Date reg_date;
	private String community_file;
	

}

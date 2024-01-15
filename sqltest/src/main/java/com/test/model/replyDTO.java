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

	private int re_no; 
    private int reply_no; 
    private String re_content; 
    private String re_nick; 
    private int re_delete; 
    private Timestamp create_date; 
    private Timestamp modified_date; 
}

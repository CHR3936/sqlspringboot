package com.test.model;

import javax.validation.constraints.Email;
import javax.validation.constraints.NotBlank;

import org.apache.ibatis.type.Alias;
import org.springframework.validation.annotation.Validated;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@Alias("member")
public class memberDTO {

	private String nick;		
	private String id;
	private String passwd;
	private String admin_role;
}

package com.test.configuration;

import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.stereotype.Component;

import lombok.Getter;
import lombok.Setter;
import lombok.Value;

@Component
@ConfigurationProperties(prefix = "spring.mail")
@Getter
@Setter

public class MailConfiguration {

	
	private String hostSMTP;
	private String hostSMTPid;
	private String hostSMTPpwd;
	private String charSet;
	private String fromEmail;
	
}

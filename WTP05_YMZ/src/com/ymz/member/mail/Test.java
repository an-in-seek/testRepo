package com.ymz.member.mail;

import java.util.Properties;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;

public class Test {

	
	    public static void main(String[]args){
	    	ApplicationContext context = 
	             new ClassPathXmlApplicationContext("/com/ymz/member/mail/Spring_Mail.xml");
	 
	    	EmailSender mm = (EmailSender) context.getBean("EmailSender");
	        mm.sendMail("isomorphism1126@gmail.com",
	    		   "baron0622@naver.com",
	    		   "Testing123", 
	    		   "Testing only \n\n Hello Spring Email Sender");
	 
	    }
	

}

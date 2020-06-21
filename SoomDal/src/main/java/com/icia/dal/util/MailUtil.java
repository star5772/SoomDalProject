package com.icia.dal.util;

import javax.mail.MessagingException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;

import com.icia.dal.dto.Mail;

public class MailUtil {
	@Autowired
	private JavaMailSender mailSender;
	
	public void sendMail(Mail mail) throws MessagingException {
		MimeMessage message = mailSender.createMimeMessage();
		MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "UTF-8");
		// 보낸 사람 이메일
		messageHelper.setFrom(new InternetAddress(mail.getSender()));
		// 받는 사람 이메일
		messageHelper.setTo(mail.getReceiver());
		// 이메일 제목
		messageHelper.setSubject(mail.getTitle());
		// 이메일 내용
		messageHelper.setText(mail.getContent(), true);
		mailSender.send(message);
	}
}
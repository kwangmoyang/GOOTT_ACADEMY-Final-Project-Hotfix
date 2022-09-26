package com.Final.Final1.comm.serviceImpl;

import javax.inject.Inject;
import javax.mail.Message.RecipientType;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

import com.Final.Final1.comm.model.EmailDTO;
import com.Final.Final1.comm.service.EmailService;



@Service
public class EmailServiceImpl implements EmailService {
	@Inject
	JavaMailSender mailSender;
	@Override
	public void sendMail(EmailDTO dto) {
		try {
			MimeMessage msg=mailSender.createMimeMessage(); //?대찓??媛앹껜
			//?섏떊??
			msg.addRecipient(RecipientType.TO, new InternetAddress(dto.getReceiveMail()));
			//諛쒖떊???대찓?쇱＜?? ?대쫫
			msg.addFrom(new InternetAddress[] {
					new InternetAddress(dto.getSenderMail(), dto.getSenderName())
			});
			msg.setSubject(dto.getSubject(),"utf-8"); //제목
			msg.setText(dto.getMessage(),"utf-8"); //텍스트 내용
			
			
			mailSender.send(msg); //?대찓??諛쒖떊
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}

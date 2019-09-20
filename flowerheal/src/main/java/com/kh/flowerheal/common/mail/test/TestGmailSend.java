package com.kh.flowerheal.common.mail.test;

import java.io.UnsupportedEncodingException;
import java.util.Date;
import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Multipart;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.swing.JOptionPane;

public class TestGmailSend {

	public boolean GmailSet(String userEmail) {
		boolean isSend = false;
		
		Properties p = System.getProperties();
		p.put("mail.smtp.starttls.enable", "true");
		p.put("mail.smtp.host", "smtp.gmail.com"); // smtp 서버 호스트
		p.put("mail.smtp.auth", "true");
		p.put("mail.smtp.port", "587"); // gmail 포트

		Authenticator auth = new TestMyAuthentication(); // 구글 계정 인증

		// session 생성 및 MimeMessage생성
		Session session = Session.getDefaultInstance(p, auth);
		MimeMessage msg = new MimeMessage(session);

		String fromName = "꽃미힐미";
		String charSet = "UTF-8";

		try {
			System.out.println("==================== 이메일 발송 준비중 ====================");
			
			// 편지보낸시간 설정
			msg.setSentDate(new Date());

			// 송신자 설정
			InternetAddress from = new InternetAddress();
			from = new InternetAddress(new String(fromName.getBytes(charSet), "UTF-8") + "<flowerheal2019@google.com>");
			msg.setFrom(from);

			// 수신자 설정
			InternetAddress to = new InternetAddress(userEmail);
			msg.setRecipient(Message.RecipientType.TO, to);

			// 제목 설정
			// setSubject(" 이메일 제목 ", " 문자타입 " );
			msg.setSubject("꽃미힐미 이메일 발송 테스트", "UTF-8");
			
			// 내용 설정 - 사용안함
			// msg.setText(content, "UTF-8");

			// setContent( "  html문자를 넣어주세요.  " );
			msg.setContent(""
					+ "<div>"
					+ "<h1>This is actual message embedded in HTML tags</h1>"
					+ "<h2>This is actual message embedded in HTML tags</h2>"
					+ "<h3>This is actual message embedded in HTML tags</h3>"
					+ "<h4>This is actual message embedded in HTML tags</h4>"
					+ "<h5>This is actual message embedded in HTML tags</h5>"
					+ "<h6>This is actual message embedded in HTML tags</h6>"
					+ "한글 보이는지 테스트입니다."
					+ "</div>"
					, "text/html; charset=utf-8");	// 뒤에 charset=utf-8 를 붙여줘야 한글이 정상적으로 보입니다.
			
			
			// msg.addAttachment("파일명", new File("파일 경로"));
			
			// 메일 송신
			Transport.send(msg);
			isSend = true;
			
			System.out.println("메일 발신자 : " + from);
			System.out.println("메일 수신자 : " + to);
			System.out.println("메일 제목    : " + msg.getSubject());
			// System.out.println("메일 내용    : " + content);
			// System.out.println("메일 내용    : " + msg.getContent());
			System.out.println("==================== 이메일 정상적 발송 ====================");
			
		} catch (AddressException addr_e) { // 예외처리 주소를 입력하지 않을 경우
			System.out.println("메일주소 입력안해서 오류발생!!");
			JOptionPane.showMessageDialog(null, "올바른 메일주소를 입력해주세요.", "메일주소입력", JOptionPane.ERROR_MESSAGE);
			addr_e.printStackTrace();
		} catch (MessagingException msg_e) { // 메시지에 이상이 있을 경우
			System.out.println("메세지에 이상이 있습니다.");
			JOptionPane.showMessageDialog(null, "메세지에 이상이 있을 경우", "오류발생", JOptionPane.ERROR_MESSAGE);
			msg_e.printStackTrace();
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		return isSend;
	}
}
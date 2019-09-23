package com.kh.flowerheal.common.mail;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.Date;
import java.util.List;
import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.swing.JOptionPane;

import com.kh.flowerheal.common.mail.test.TestMyAuthentication;
import com.kh.flowerheal.subs.dto.SubsDTO;

public class GmailSend {

	// 전역변수 선언부
	Properties p = null;
	Authenticator auth = null;
	Session session = null;
	MimeMessage msg = null;
	InternetAddress from = null;
	InternetAddress to = null;
	
	// 생성자
	public GmailSend(){}
	
	// 이메일 받는 생성자
	public void init(){
		p = System.getProperties();
		p.put("mail.smtp.starttls.enable", "true");
		p.put("mail.smtp.host", "smtp.gmail.com"); // smtp 서버 호스트
		p.put("mail.smtp.auth", "true");
		p.put("mail.smtp.port", "587"); // gmail 포트
		
		auth = new TestMyAuthentication(); // 구글 계정 인증

		// session 생성 및 MimeMessage생성
		session = Session.getDefaultInstance(p, auth);
		msg = new MimeMessage(session);
		String fromName = "꽃미힐미";
		String charSet = "UTF-8";
		
		System.out.println("==================== 이메일 발송 준비중 ====================");
		try {
			// 편지보낸시간 설정
			msg.setSentDate(new Date());

			// 송신자 설정
			from = new InternetAddress();
			from = new InternetAddress(new String(fromName.getBytes(charSet), "UTF-8") + "<flowerheal2019@naver.com>");
			
			msg.setFrom(from);
			
		} catch (AddressException addr_e) { // 예외처리 주소를 입력하지 않을 경우
			System.out.println("메일주소 입력안해서 오류발생!!");
			JOptionPane.showMessageDialog(null, "올바른 메일주소를 입력해주세요.", "메일주소입력", JOptionPane.ERROR_MESSAGE);
			addr_e.printStackTrace();
		} catch (MessagingException msg_e) { // 메시지에 이상이 있을 경우
			System.out.println("메세지에 이상이 있습니다.");
			JOptionPane.showMessageDialog(null, "메세지에 이상이 있을 경우", "오류발생", JOptionPane.ERROR_MESSAGE);
			msg_e.printStackTrace();
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		
				
	}	// userEmail 생성자 끝
	
	// 메일 정보를 콘촐창에 출력해서 보기 위함!!
	private void seeResult() {
		
		System.out.println("메일 수신자 : " + to);
		
		try {
			System.out.println("메일 제목    : " + msg.getSubject());
			System.out.println("메일 내용    : " + (String)msg.getContent());
		} catch (MessagingException | IOException e) {

			e.printStackTrace();
		}
		// System.out.println("메일 내용    : " + content);
		// System.out.println("메일 내용    : " + msg.getContent());
		System.out.println("==================== 이메일 정상적 발송 ====================");
		
	}	// seeResult 결과
	
	
	// 배송 안내 이메일 발송
	public boolean delivery(String name, SubsDTO sdto) {
		init();
		boolean isSend = false;
		
		try {
			
			// 수신자 설정
			to = new InternetAddress(sdto.getSubs_Member_Id());
			msg.setRecipient(Message.RecipientType.TO, to);
			
			// 제목 설정
			// setSubject(" 이메일 제목 ", " 문자타입 " );
			msg.setSubject("[꽃미힐미] " + name + "님, 구독상품이 발송되었습니다.", "UTF-8");
			
			// 내용 설정 - 사용안함
			// msg.setText(content, "UTF-8");

			// setContent( "  html문자를 넣어주세요.  " );
			msg.setContent(""
					+ "<div>"
					+ "		<h1>주문하신 상품이 발송되었습니다.</h1>"
					+ "		<h3>배송 상품 : " + sdto.getSubs_Pname() + "</h3>"
					+ "		<h3>구독 기간 : " + sdto.getSubs_Fdate() + " ~ " + sdto.getSubs_Edate() + "</h3>"
					+ "		<h3>결제 금액 : " + sdto.getSubs_Price() + "원</h3>"
					+ "		<h3> 배송지   : " + sdto.getRoadAddrPart1() + " " + sdto.getAddrDetail()
					+ ""
					+ "</div>"
					, "text/html; charset=utf-8");	// 뒤에 charset=utf-8 를 붙여줘야 한글이 정상적으로 보입니다.
			
			// 메일 송신
			Transport.send(msg);
			// 메일이 정상적으로 발송됌.
			isSend = true;

		} catch (AddressException addr_e) { // 예외처리 주소를 입력하지 않을 경우
			System.out.println("메일주소 입력안해서 오류발생!!");
			JOptionPane.showMessageDialog(null, "올바른 메일주소를 입력해주세요.", "메일주소입력", JOptionPane.ERROR_MESSAGE);
			addr_e.printStackTrace();
		} catch (MessagingException msg_e) { // 메시지에 이상이 있을 경우
			System.out.println("메세지에 이상이 있습니다.");
			JOptionPane.showMessageDialog(null, "메세지에 이상이 있을 경우", "오류발생", JOptionPane.ERROR_MESSAGE);
			msg_e.printStackTrace();
		}
		
		seeResult();
		return isSend;
	}	// 배송 안내 이메일
	
	// 결제 안내 이메일 발송
	public boolean order(String name, SubsDTO sdto) {
		init();
		boolean isSend = false;
		
		try {
			// 수신자 설정
			to = new InternetAddress(sdto.getSubs_Member_Id());
			msg.setRecipient(Message.RecipientType.TO, to);
			
			// 제목 설정
			// setSubject(" 이메일 제목 ", " 문자타입 " );
			msg.setSubject("[꽃미힐미] " + name + "님 구독신청 감사합니다!", "UTF-8");
			
			// 내용 설정 - 사용안함
			// msg.setText(content, "UTF-8");

			// setContent( "  html문자를 넣어주세요.  " );
			msg.setContent(""
					+ "<div>"
					+ "		<h1>구독 신청 안내 메일</h1>"
					+ "		<h3>배송 상품 : " + sdto.getSubs_Pname() + "</h3>"
					+ "		<h3>구독 기간 : " + sdto.getSubs_Fdate() + " ~ " + sdto.getSubs_Edate() + "</h3>"
					+ "		<h3>결제 금액 : " + sdto.getSubs_Price() + "원</h3>"
					+ ""
					+ "</div>"
					, "text/html; charset=utf-8");	// 뒤에 charset=utf-8 를 붙여줘야 한글이 정상적으로 보입니다.
			
			// 메일 송신
			Transport.send(msg);
			// 메일이 정상적으로 발송됌.
			isSend = true;

		} catch (AddressException addr_e) { // 예외처리 주소를 입력하지 않을 경우
			System.out.println("메일주소 입력안해서 오류발생!!");
			JOptionPane.showMessageDialog(null, "올바른 메일주소를 입력해주세요.", "메일주소입력", JOptionPane.ERROR_MESSAGE);
			addr_e.printStackTrace();
		} catch (MessagingException msg_e) { // 메시지에 이상이 있을 경우
			System.out.println("메세지에 이상이 있습니다.");
			JOptionPane.showMessageDialog(null, "메세지에 이상이 있을 경우", "오류발생", JOptionPane.ERROR_MESSAGE);
			msg_e.printStackTrace();
		}
		
		seeResult();
		return isSend;
	}	// 결제 안내 이메일
	
	// 장바구니 리스트 안내 이메일 발송
	public boolean listOrder(String name, List<SubsDTO> list) {
		init();
		boolean isSend = false;
		
		try {
			// 수신자 설정
			to = new InternetAddress(list.get(0).getSubs_Member_Id());
			msg.setRecipient(Message.RecipientType.TO, to);
			
			// 제목 설정
			// setSubject(" 이메일 제목 ", " 문자타입 " );
			msg.setSubject("[꽃미힐미] " + name + "님 구독신청 감사합니다!", "UTF-8");
			
			// 내용 설정 - 사용안함
			// msg.setText(content, "UTF-8");

			// setContent( "  html문자를 넣어주세요.  " );
			
			StringBuffer content = new StringBuffer();
						
			content.append("<div>");
			content.append("	<h1>구독 신청 안내 메일</h1>");
			
			int totalPrice = 0;
			
		    for(SubsDTO item : list){	
		    	content.append("	<h3>배송 상품 : " + item.getSubs_Pname() + "</h3>");
		    	content.append("		<h3>구독 기간 : " + item.getSubs_Fdate() + " ~ " + item.getSubs_Edate() + "</h3>");
		    	content.append("	<h3>결제 금액 : " + item.getSubs_Price() + "원</h3>");
		    	content.append("<br>");
		    	totalPrice += item.getSubs_Price();
		    }
		    content.append("<h3>총 결제 금액 : " + totalPrice + "원</h3>");
			content.append("</div>");
			
			msg.setContent(content.toString(), "text/html; charset=utf-8");
			
			
			// 메일 송신
			Transport.send(msg);
			// 메일이 정상적으로 발송됌.
			isSend = true;

		} catch (AddressException addr_e) { // 예외처리 주소를 입력하지 않을 경우
			System.out.println("메일주소 입력안해서 오류발생!!");
			JOptionPane.showMessageDialog(null, "올바른 메일주소를 입력해주세요.", "메일주소입력", JOptionPane.ERROR_MESSAGE);
			addr_e.printStackTrace();
		} catch (MessagingException msg_e) { // 메시지에 이상이 있을 경우
			System.out.println("메세지에 이상이 있습니다.");
			JOptionPane.showMessageDialog(null, "메세지에 이상이 있을 경우", "오류발생", JOptionPane.ERROR_MESSAGE);
			msg_e.printStackTrace();
		}
		
		seeResult();
		return isSend;
	}	// 장바구니 리스트 안내 이메일 발송
	
	
	
	// 회원가입 이메일 인증
	public boolean joinEmailCheck(String userEmail, String code) {
		init();
		boolean isSend = false;
		
		try {
			// 수신자 설정
			to = new InternetAddress(userEmail);
			msg.setRecipient(Message.RecipientType.TO, to);
			
			// 제목 설정
			// setSubject(" 이메일 제목 ", " 문자타입 " );
			msg.setSubject("[꽃미힐미] 이메일 인증을 진행해주세요.", "UTF-8");
			
			// 내용 설정 - 사용안함
			// msg.setText(content, "UTF-8");

			// setContent( "  html문자를 넣어주세요.  " );
			msg.setContent(""
					+ "<div>"
					+ "	<h1>회원가입 이메일 인증</h1>"
					+ "	<h3>인증번호 : " + code + "</h3>"
					// 기존에는 url 버튼을 눌러서 인증을 진행할 예정이였다. 팝업으로 바꾸면서 보내줄 필요가 없어졌다.
					// + "<a href='localhost:9080/flowerheal/mail/check/" + userEmail + "'>"
					// + "<button>이메일인증</button></a>"
					+ ""
					+ "</div>"
					, "text/html; charset=utf-8");	// 뒤에 charset=utf-8 를 붙여줘야 한글이 정상적으로 보입니다.
			
			// 메일 송신
			Transport.send(msg);
			// 메일이 정상적으로 발송됌.
			isSend = true;

		} catch (AddressException addr_e) { // 예외처리 주소를 입력하지 않을 경우
			System.out.println("메일주소 입력안해서 오류발생!!");
			JOptionPane.showMessageDialog(null, "올바른 메일주소를 입력해주세요.", "메일주소입력", JOptionPane.ERROR_MESSAGE);
			addr_e.printStackTrace();
		} catch (MessagingException msg_e) { // 메시지에 이상이 있을 경우
			System.out.println("메세지에 이상이 있습니다.");
			JOptionPane.showMessageDialog(null, "메세지에 이상이 있을 경우", "오류발생", JOptionPane.ERROR_MESSAGE);
			msg_e.printStackTrace();
		}
		
		seeResult();
		return isSend;
	}	// 결제 안내 이메일
	
	
	
	
}
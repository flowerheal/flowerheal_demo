package com.kh.flowerheal.common.mail.test;

public class TestMailMain {
	public static void main(String[] args) {
		
		// Run on Server 말고  Java 응용프로그램으로 실행해보시면 메일 발송여부를 알 수 있습니다.
		
		TestGmailSend mail = new TestGmailSend();
		// 파라미터 값으로는 ( "받는 사람 이메일 주소" )
		// mail.GmailSet("flowerheal2019@gmail.com");
		mail.GmailSet("gksdlf7709@gmail.com");
		
	}
}

package com.kh.flowerheal.common.mail;

import javax.mail.Authenticator;
import javax.mail.PasswordAuthentication;
 
//구글 gmail 인증을 위한 Class
public class MyAuthentication extends Authenticator {
       
    PasswordAuthentication pa;
  
    public MyAuthentication(){  //생성자를 통해 구글 ID/PW 인증
          
        String id = "flowerheal2019";       // 구글 ID
        //String pw = "vnvimqucqszrwlme";          // 구글 비밀번호
        String pw = "KHflower!";
        // ID와 비밀번호를 입력한다.
        pa = new PasswordAuthentication(id, pw);
    }
  
    // 시스템에서 사용하는 인증정보
    public PasswordAuthentication getPasswordAuthentication() {
        return pa;
    }
}
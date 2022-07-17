package util;

import javax.mail.Authenticator;
import javax.mail.PasswordAuthentication;

public class Gmail extends Authenticator{ //인증수행을 도와주는 클래스 상속받기
	
	@Override
	protected PasswordAuthentication getPasswordAuthentication() {
		return new PasswordAuthentication("VencoderEM@gmail.com","1324qqww");
	}
	
}

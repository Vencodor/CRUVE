package util;

import javax.mail.Authenticator;
import javax.mail.PasswordAuthentication;

public class Gmail extends Authenticator{ //���������� �����ִ� Ŭ���� ��ӹޱ�
	
	@Override
	protected PasswordAuthentication getPasswordAuthentication() {
		return new PasswordAuthentication("VencoderEM@gmail.com","1324qqww");
	}
	
}

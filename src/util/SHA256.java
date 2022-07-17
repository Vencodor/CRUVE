package util;

import java.security.MessageDigest;

public class SHA256 { //�̸��� �����Ҷ� �̸��� �ؽð��� ������ �����ϰ� �ϴ� ��� SHA256
	
	public String getSHA256(String input) {
		StringBuffer result = new StringBuffer();
		try {
			MessageDigest digest = MessageDigest.getInstance("SHA-256"); //����� �Է°��� SHA256 �˰��� ���� �����ϵ���
			byte[] salt = "Getout...".getBytes(); //��Ŀ�� ���� ��ŷ ���� ���ɼ��� �ֱ� ������ ��Ʈ�� ����.
			digest.reset();
			digest.update(salt);
			byte[] chars = digest.digest(input.getBytes("UTF-8"));
			for(int i=0; i<chars.length; i++) {
				String hex = Integer.toHexString(0xff & chars[i]); //End����
				if(hex.length()==1) result.append("0");
				result.append(hex);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result.toString();
	}
	
}

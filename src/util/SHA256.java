package util;

import java.security.MessageDigest;

public class SHA256 { //이메일 인증할때 이메일 해시값을 적용해 인증하게 하는 방법 SHA256
	
	public String getSHA256(String input) {
		StringBuffer result = new StringBuffer();
		try {
			MessageDigest digest = MessageDigest.getInstance("SHA-256"); //사용자 입력값을 SHA256 알고리즘 적용 가능하도록
			byte[] salt = "Getout...".getBytes(); //해커에 의해 해킹 당할 가능성이 있기 때문에 솔트값 적용.
			digest.reset();
			digest.update(salt);
			byte[] chars = digest.digest(input.getBytes("UTF-8"));
			for(int i=0; i<chars.length; i++) {
				String hex = Integer.toHexString(0xff & chars[i]); //End연산
				if(hex.length()==1) result.append("0");
				result.append(hex);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result.toString();
	}
	
}

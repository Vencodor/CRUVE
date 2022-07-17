package util;

import java.io.UnsupportedEncodingException;
import java.security.GeneralSecurityException;
import java.security.Key;
import java.security.NoSuchAlgorithmException;
import javax.crypto.Cipher;
import javax.crypto.spec.IvParameterSpec;
import javax.crypto.spec.SecretKeySpec;
import org.apache.commons.codec.binary.Base64;

/**
 * ����� ��ȣȭ �˰����� AES256 ��ȣȭ�� �����ϴ� Ŭ����
 */
public class AES256_1 {
	private String iv;
	private Key keySpec;

	/**
	 * 16�ڸ��� Ű���� �Է��Ͽ� ��ü�� �����Ѵ�.
	 * 
	 * @param key
	 *            ��/��ȣȭ�� ���� Ű��
	 * @throws UnsupportedEncodingException
	 *             Ű���� ���̰� 16������ ��� �߻�
	 */
	final static String key = "HLfZyxMMUCcSB63QjGkjQeDUjBtyKyvVmD8k8zqALYnj6XrJ4a59htgFaCy2HX7YBJzV9sL9D5rd7HYVPNQCGtmh4wXVTYK9XZMvS7VRaNHw2THaXHkJnNUJ7GtPCN2e25BzyLPMtsmNzxwpHGeURgu3N4EXxTKEw3WfRDUcLJzzahWC56yLqhUrJu4wBedJvGEmA4jPfV6hAn3kTFwMRTwcEPTxHKdaBDcNXDtVKj4Q7zJNwTf5ApWTWaCAekLx";

	public AES256_1() throws UnsupportedEncodingException {
		this.iv = key.substring(0, 16);
		byte[] keyBytes = new byte[16];
		byte[] b = key.getBytes("UTF-8");
		int len = b.length;
		if (len > keyBytes.length) {
			len = keyBytes.length;
		}
		System.arraycopy(b, 0, keyBytes, 0, len);
		SecretKeySpec keySpec = new SecretKeySpec(keyBytes, "AES");

		this.keySpec = keySpec;
	}

	/**
	 * AES256 ���� ��ȣȭ �Ѵ�.
	 * 
	 * @param str
	 *            ��ȣȭ�� ���ڿ�
	 * @return
	 * @throws NoSuchAlgorithmException
	 * @throws GeneralSecurityException
	 * @throws UnsupportedEncodingException
	 */
	public String encrypt(String str) throws NoSuchAlgorithmException,
			GeneralSecurityException, UnsupportedEncodingException {
		Cipher c = Cipher.getInstance("AES/CBC/PKCS5Padding");
		c.init(Cipher.ENCRYPT_MODE, keySpec, new IvParameterSpec(iv.getBytes()));
		byte[] encrypted = c.doFinal(str.getBytes("UTF-8"));
		String enStr = new String(Base64.encodeBase64(encrypted));
		return enStr;
	}

	/**
	 * AES256���� ��ȣȭ�� txt �� ��ȣȭ�Ѵ�.
	 * 
	 * @param str
	 *            ��ȣȭ�� ���ڿ�
	 * @return
	 * @throws NoSuchAlgorithmException
	 * @throws GeneralSecurityException
	 * @throws UnsupportedEncodingException
	 */
	public String decrypt(String str) throws NoSuchAlgorithmException,
			GeneralSecurityException, UnsupportedEncodingException {
		Cipher c = Cipher.getInstance("AES/CBC/PKCS5Padding");
		c.init(Cipher.DECRYPT_MODE, keySpec, new IvParameterSpec(iv.getBytes()));
		byte[] byteStr = Base64.decodeBase64(str.getBytes());
		return new String(c.doFinal(byteStr), "UTF-8");
	}
}
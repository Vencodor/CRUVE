package chat;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.security.GeneralSecurityException;
import java.security.NoSuchAlgorithmException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Optional;
import java.util.UUID;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.websocket.OnClose;
import javax.websocket.OnError;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.ServerEndpoint;

import sun.security.krb5.internal.crypto.Aes256;
import user.UserDAO;
import util.AES256;
import util.SHA256;

@ServerEndpoint("/userChat")
public class webSocket extends HttpServlet {
	
	private String PIZZA = null;
	
	private interface SearchExpression {
		// ���ٽ��� ���� �Լ�
		boolean expression(User user);
	}
	
	private class User {
		Session session;
		String key;
	}
	private static List<User> sessionUsers = Collections.synchronizedList(new ArrayList<>());
	
	// Session���� ���� ����Ʈ���� User Ŭ������ Ž��
	private static User getUser(Session session) {
	return searchUser(x -> x.session == session);
	}
	// Key�� ���� ����Ʈ���� User Ŭ������ Ž��
	private static User getUser(String key) {
	return searchUser(x -> x.key.equals(key));
	}
	// ���� ����Ʈ Ž�� �Լ�
	private static User searchUser(SearchExpression func) {
		Optional<User> op = sessionUsers.stream().filter(x -> func.expression(x)).findFirst();
		// ����� ������
		if (op.isPresent()) {
		// ����� ����
			return op.get();
		}
		// ������ null ó��
		return null;
	}

	@OnOpen
	public void handleOpen(Session userSession) {
		System.out.println("on Join ");
	}
	
	@OnMessage
	public String handleMessage(String message, Session userSession) throws UnsupportedEncodingException {
		AES256 aes256 = new AES256();
		ChatDataDAO chatDAO = new ChatDataDAO();
		ChatListDAO chatListDAO = new ChatListDAO();
		try {
			PIZZA = aes256.encrypt("PIZZA");
		} catch (UnsupportedEncodingException | GeneralSecurityException e2) {
			e2.printStackTrace();
		}
		String toMessage[]=null;
		
		toMessage = message.split("\\{Vencoder\\}", 2);
		if(toMessage[1].equals("!@#ID#@!")) { //ó�� send �������� ��� ������ ������ �ޱ�
			User user = new User();
			user.session = userSession;
			try {user.key = aes256.decrypt(toMessage[0]);} catch (UnsupportedEncodingException | GeneralSecurityException e) {e.printStackTrace();}
			sessionUsers.add(user);
		} else {
			try {
				String userDecryptID=aes256.decrypt(toMessage[0]);
				String myID = null;
				
				if(getUser(userDecryptID)!=null) { //��밡 �������϶�
					User userID=getUser(userSession);
					Session to = getUser(userDecryptID).session;
					chatListDAO.dateUpdate(userID.key,userDecryptID);
					toMessage[1]=toMessage[1].replace(PIZZA, "");
					//System.out.println(toMessage[1]);
					toMessage[1] = toMessage[1].replace(aes256.encrypt(userID.key), "");
					to.getBasicRemote().sendText(toMessage[1]);
					chatDAO.write(new ChatDataDTO(userID.key,userDecryptID,toMessage[1],null,0));
					chatListDAO.addNews(userID.key, userDecryptID); //���� �޽��� �˸� ���� 
					myID = userID.key;
				} else { //��밡 ���������϶�
					String[] Multimsg=toMessage[1].split(PIZZA,2);
					Multimsg[0]=Multimsg[0].replace(PIZZA, "");
					chatDAO.write(new ChatDataDTO(aes256.decrypt(Multimsg[1]),userDecryptID,Multimsg[0],null,0));
					myID = aes256.decrypt(Multimsg[1]);
					chatListDAO.addNews(myID, userDecryptID); //���� �޽��� �Դٰ� �˸� ����
				}

				if(!chatListDAO.isTrue(myID, userDecryptID)) { //���� ��밡 �� �߰����� �ʾ�����
					chatListDAO.write(new ChatListDTO(userDecryptID, myID, null, 0, 1));
					System.out.println("��ȭ�� �߰�");
				}
				
			} catch (IOException e) {e.printStackTrace();} catch (NoSuchAlgorithmException e) {e.printStackTrace();} catch (GeneralSecurityException e) {e.printStackTrace();}
		}

		
		return null;
	}
	
	public boolean userJoin(String toName) {
		AES256 aes256 = null;
		try {
			aes256 = new AES256();
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		String userDecryptID = null;
		try {
			userDecryptID = aes256.decrypt(toName);
		} catch (UnsupportedEncodingException | GeneralSecurityException e) {
			e.printStackTrace();
		}
		if(getUser(userDecryptID)!=null) {
			return true;
		} else {
			return false;
		}
	}
	
	@OnClose
	public void handleClose(Session userSession) {
	System.out.println("client is now disconnected...");
	// Session���� ���� ����Ʈ���� User Ŭ������ Ž��
		User user = getUser(userSession);
		// ���� ����Ʈ�� User�� ������(�翬�� �ִ�. ������ ����..)
		if (user != null) {
	// �� ���� ���� ����Ʈ���� ������ �����Ѵ�.
	sessionUsers.remove(user);
	}
	}

	@OnError
	public void handleError(Throwable t) {
	//t.printStackTrace();
	}
}

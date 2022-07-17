package util;

import java.sql.Connection;
import java.sql.DriverManager;

public class DatabaseUtil { //실질적으로 데이터 베이스와 연동
	
	public static Connection getConnection() {
		try {
			String dbURL = "jdbc:mysql://localhost:3306/GBIP";
			String dbID = "root";
			String dbPassword = "1324qqww";
			Class.forName("com.mysql.cj.jdbc.Driver"); //클래스 찾아서 사용
			return DriverManager.getConnection(dbURL,dbID,dbPassword);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	} 
	
}

package mbcboard.config;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class JdbcProfile {

	private String db_url;
	private String id;
	private String pw;
	
	public JdbcProfile(String db_url, String id, String pw) {
		this.db_url = db_url;
		this.id = id;
		this.pw = pw;
	}
	
	public Connection getConnection() {
		
		try {
			return DriverManager.getConnection(db_url, id, pw);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}
}

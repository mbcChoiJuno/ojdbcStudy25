package mbcacademy.jdbc.config;

import java.util.HashMap;
import java.util.Map;

public class JdbcConfig {

	public static JdbcConfig instance;
	
	public static JdbcConfig getInstance() {
		
		if (instance == null) {
			instance = new JdbcConfig();

			// 추후에 dbdriver config file load
			setDriver(DriverType.ORACLE);
			
			// 추후에 profile list file load
			profileMap.put("mbcacademy", new JdbcProfile("jdbc:oracle:thin:@192.168.0.171:1521:xe", "mbcacademy", "mbcacademy"));
		}
		
		return instance;
	}
	// --------------------------------------------------------------------
	
	private static Map<String, JdbcProfile> profileMap = new HashMap<String, JdbcProfile>();	
	
	/**
	 * 드라이버 초기 설정
	 */
	private static void setDriver(DriverType driverType) {
		String driverName = null;
		
		switch (driverType) {
			case ACCESS:
				driverName = "sun.jdbc.odbc.jdbcOdbcDriver";
				break;
			case MS_SQL:
				driverName = "com.microsoft.jdbc.sqlserver.SQLServerDriver";
				break;
			case MY_SQL:
				driverName = "com.mysql.jdbc.Driver";
				break;
			case ORACLE:
				driverName = "oracle.jdbc.driver.OracleDriver";
				break;
		}

		try {
			Class.forName(driverName);
			
		} catch (Exception e) { 
			e.printStackTrace();
		}
	}
	
	/**
	 * 프로필 불러오기
	 * @param id
	 * @return
	 */
	public JdbcProfile getProfile(String id) {
		return profileMap.get(id);
	}
}

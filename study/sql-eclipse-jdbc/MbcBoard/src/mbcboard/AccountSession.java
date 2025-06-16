package mbcboard;

import mbcboard.dto.UserDTO;

public class AccountSession {

	private static AccountSession instance;
	
	public static AccountSession getInstance() {
		if (instance == null) {
			instance = new AccountSession();
		}
		return instance;
	}
	
	private AccountSession() {}
	
	// -------------------------------------------------
	
	private UserDTO currentUser = null; 

	/**
	 * 로그인 성공시 호출
	 * @param user
	 */
	public void onLoginEvent(UserDTO user) {
		currentUser = user;
	}
	
	/**
	 * 로그아웃 성공시 호출
	 */
	public void onLogoutEvent() {
		currentUser = null;
	}

	/**
	 * 현재 로그인된 유저 정보 조회
	 * @return
	 */
	public UserDTO getCurrentUser() {
		return currentUser;
	}
	
	/**
	 * 현재 로그인 여부 조회
	 * @return
	 */
	public boolean isLogin() {
		return (currentUser != null);
	}
}

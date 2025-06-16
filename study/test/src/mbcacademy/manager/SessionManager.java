package mbcacademy.manager;

import mbcacademy.dto.AccountDTO;

public class SessionManager {
	
	private static SessionManager instance;
	
	public static SessionManager getInstance() {
		if (instance == null) {
			instance = new SessionManager();
		}
		return instance;
	}
	
	private SessionManager() {}
	// ----------------------------------------------
		
	private AccountDTO accountDTO = null;

	public AccountDTO currentUser() {
		return accountDTO;
	}
	
	public boolean isLogin() {
		return (accountDTO != null);
	}
	
	public void onLoginEvent(AccountDTO accountDTO) {
		this.accountDTO = accountDTO;
	}
	
	public void onLogoutEvent() {
		accountDTO = null;
	}
}

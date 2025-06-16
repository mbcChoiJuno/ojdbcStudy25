package mbcacademy;

import mbcacademy.manager.SessionManager;
import mbcacademy.view.AccountView;
import mbcacademy.view.HomeView;

public class MBCAcademyExam {

	public static void main(String[] args) {
		
		while (true) {

			// 로그인 상태면 홈 화면을 표시
			if (SessionManager.getInstance().isLogin()) {
				var homeView = new HomeView();
				homeView.menu();
				
			} else { // 비로그인 상태면 Account 화면을 표시한다.
				var accountView = new AccountView();
				accountView.menu();
			}
		}
	}
}

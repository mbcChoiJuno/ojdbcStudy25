package mbcacademy.view;

import mbcacademy.manager.SessionManager;
import mbcacademy.service.AccountService;
import mbcacademy.utils.Alert;
import mbcacademy.utils.InputModule;

public class MyInfoView {

	public void menu() {

		while (SessionManager.getInstance().isLogin()) {

			var currentUser = SessionManager.getInstance().currentUser();
			
			System.out.println();
			System.out.printf ("로그인 계정(%s)\n", currentUser.getId());
			System.out.println("설정 화면");
			System.out.println("1. 비밀번호 변경");
			System.out.println("2. 이메일 변경");
			System.out.println("3. 휴대폰 번호 변경");
			System.out.println("4. 계정 탈퇴");
			System.out.println("5. 돌아가기");

			System.out.print(">>>");
			var select = InputModule.next();

			switch (select) {
				case "1" -> changePassword();
				case "2" -> changeEmail();
				case "3" -> changePhone();
				case "4" -> withdrawAccount();
				case "5" -> {
					break;
				}
				default -> {
					Alert.print("1~5 까지만 입력하세요.");
				}
			}
		}
	}

	private void changePassword() {
		AccountService accountService =new AccountService();

		var currentUser = SessionManager.getInstance().currentUser();
		
		System.out.println();
		System.out.println("비밀번호 변경을 시작합니다.");
		System.out.print("현재 비밀번호:");
		var oldPw = InputModule.next();
		
		if (currentUser.getPw().equals(oldPw) == false) {
			Alert.print("암호가 일치하지 않습니다.");
			return;
		}

		System.out.print("변경할 비밀번호 : ");
		var pw = InputModule.next();

		System.out.println();
		System.out.println("한번더 입력하세요");
		System.out.print("비밀번호 : ");
		var pwCheck = InputModule.next();

		if (pw.equals(pwCheck) == false) {
			Alert.print("비밀번호가 일치하지 않습니다.");
			return;
		}
		
		accountService.changePassword(pw);
	}

	private void changeEmail() {
		AccountService accountService =new AccountService();

		var currentUser = SessionManager.getInstance().currentUser();
		
		System.out.println();
		System.out.println("이메일 변경을 시작합니다.");
		System.out.print("현재 비밀번호:");
		var oldPw = InputModule.next();
		
		if (currentUser.getPw().equals(oldPw) == false) {
			Alert.print("암호가 일치하지 않습니다.");
			return;
		}

		System.out.println();
		System.out.print("변경할 이메일 : ");
		var email = InputModule.next();

		accountService.changeEmail(email);
	}

	private void changePhone() {
		AccountService accountService =new AccountService();

		var currentUser = SessionManager.getInstance().currentUser();
		
		System.out.println();
		System.out.println("휴대폰 번호 변경을 시작합니다.");
		System.out.print("현재 비밀번호:");
		var oldPw = InputModule.next();
		
		if (currentUser.getPw().equals(oldPw) == false) {
			Alert.print("암호가 일치하지 않습니다.");
			return;
		}

		System.out.println();
		System.out.print("변경할 휴대폰 번호 11자리 : ");
		var phone = InputModule.next();

		accountService.changePhone(phone);
	}

	private void withdrawAccount() {
		AccountService accountService =new AccountService();

		System.out.println();
		System.out.println("계정 삭제를 진행합니다.");
		System.out.println("계정을 삭제하면 휴면상태가 되어 사용할 수 없습니다.");

		System.out.println();
		System.out.print("정말 삭제하시겠습니까? (y/n) : ");
		var yn = InputModule.next();
		
		switch (yn.toLowerCase()){
			case "y" -> {
				accountService.withdrawAccount();
				SessionManager.getInstance().onLogoutEvent();
				Alert.print("계정이 비활성화 되었습니다. 다시 로그인하려면 관리자에게 문의하세요");
			}
			case "n" -> {
				
			}
			default -> {
				
			}
		}
		
	}
}

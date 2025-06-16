package mbcacademy.view;

import mbcacademy.dto.AccountDTO;
import mbcacademy.dto.UserinfoDTO;
import mbcacademy.manager.SessionManager;
import mbcacademy.service.AccountService;
import mbcacademy.utils.Alert;
import mbcacademy.utils.InputModule;

public class AccountView {

	public void menu() {

		while (SessionManager.getInstance().isLogin() == false) {

			System.out.println();
			System.out.println("MBC아카데미 Account");
			System.out.println("1. 로그인");
			System.out.println("2. 회원 가입");
			System.out.println("3. 아이디 찾기");
			System.out.println("4. 비밀번호 찾기");
			System.out.println("5. 종료");

			System.out.print(">>>");
			var select = InputModule.next();

			switch (select) {
				case "1" -> performLogin();
				case "2" -> performSignup();
				case "3" -> findAccountId();
				case "4" -> findAccountPassword();
				case "5" -> {
					Alert.print("프로그램을 종료합니다.");
					System.exit(0);
				}
				default -> {
					Alert.print("1~5 까지만 입력하세요.");
				}
			}
		}
	}

	/**
	 * 로그인 화면
	 */
	private void performLogin() {
		AccountService accountService = new AccountService();

		System.out.println();
		System.out.println("로그인을 진행합니다.");

		System.out.print("ID : ");
		var id = InputModule.next();

		System.out.print("비밀번호 : ");
		var pw = InputModule.next();

		int resultCode = accountService.performLogin(id, pw);

		switch (resultCode) {
		
			case 200 -> {
				Alert.print("%s님 환영합니다.", SessionManager.getInstance().currentUser().getUserinfo().getName());
			}
			case -1 -> {
				Alert.print("계정을 찾을 수 없습니다.");
			}
			case 401 -> {
				Alert.print("계정과 비밀번호가 다릅니다.");
			}
			case 406 -> {
				Alert.print("계정이 비활성화 상태입니다. 관리자에게 문의하세요");
			}
		}
	}

	/**
	 * 회원가입 화면
	 */
	private void performSignup() {
		AccountService accountService = new AccountService();

		System.out.println();
		System.out.println("회원가입을 진행합니다.");

		System.out.print("가입할 ID : ");
		var id = InputModule.next();

		// TODO : empty, 중복 체크
		if (4 > id.length() || id.length() > 10) {
			Alert.print("아이디는 4자부터 10자까지만 입력할 수 있습니다.");
			return;
		}

		if (accountService.isExistId(id)) {
			Alert.print("이미 존재하는 ID입니다.");
			return;
		}

		System.out.print("비밀번호 : ");
		var pw = InputModule.next();

		System.out.println();
		System.out.println("한번더 입력하세요");
		System.out.print("비밀번호 : ");
		var pwCheck = InputModule.next();

		if (pw.equals(pwCheck) == false) {
			Alert.print("비밀번호가 일치하지 않습니다.");
			return;
		}

		System.out.println();
		System.out.println("개인정보를 입력합니다.");

		System.out.print("이름 : ");
		var name = InputModule.next();

		System.out.print("주민번호 13자리 : ");
		var ssn = InputModule.next();
		
		// TODO : 이름+주민번호 계정 있으면 가입 불가 처리하기
		//

		System.out.print("전화번호 11자리 : ");
		var phone = InputModule.next();

		System.out.print("이메일 주소 : ");
		var email = InputModule.next();
		
		// TODO : 이메일 중복 처리하기
		//
		

		AccountDTO accountDTO = new AccountDTO(id, pw);
		accountDTO.setUserinfo(new UserinfoDTO(name, ssn, phone, email));

		accountService.performSignup(accountDTO);
	}

	/**
	 * 아이디 찾기 화면
	 */
	private void findAccountId() {
		AccountService accountService = new AccountService();

		String findId = null;

		while (findId == null) {
			System.out.println();
			System.out.println("아이디 찾기를 진행합니다.");
			System.out.println("1. 이름과 주민번호로 아이디 찾기");
			System.out.println("2. 이메일로 아이디 찾기");
			System.out.println("3. 돌아가기");

			System.out.print(">>>");
			var select = InputModule.next();

			switch (select) {
			
				case "1" -> {
	
					System.out.println();
					System.out.println("가입한 이름과 주민번호로 계정을 찾습니다.");
	
					System.out.print("가입자 이름 : ");
					var name = InputModule.next();
	
					System.out.print("가입자 주민등록번호 13자리 : ");
					var ssn = InputModule.next();
	
					var accountDTO = accountService.findAccountIdWithSSN(name, ssn);
	
					if (accountDTO == null) {
						Alert.print("계정정보를 찾지 못했습니다.");
						break;
					} else {
						findId = accountDTO.getId();
						Alert.print("가입한 ID는 %s 입니다.", findId);
					}
				}
				case "2" -> {
	
					System.out.println();
					System.out.println("가입한 이메일로 계정을 찾습니다.");
	
					System.out.print("가입자 이메일 : ");
					var email = InputModule.next();
	
					var accountDTO = accountService.findAccountIdByEmail(email);
	
					if (accountDTO == null) {
						Alert.print("계정정보를 찾지 못했습니다.");
						break;
					} else {
						findId = accountDTO.getId();
						Alert.print("가입한 ID는 %s 입니다.", findId);
					}
				}
				case "3" -> {
					break;
				}
				default -> {
					Alert.print("1~3 까지만 입력하세요.");
				}
			}
		}
	}

	/**
	 * 비밀번호 찾기 화면
	 */
	private void findAccountPassword() {
		AccountService accountService = new AccountService();

		String findPw = null;

		System.out.println();
		System.out.println("비밀번호 찾기를 진행합니다.");

		System.out.print("가입자 계정 : ");
		var id = InputModule.next();

		var accountDTO = accountService.findAccountById(id);

		if (accountDTO == null) {
			Alert.print("가입된 ID가 아닙니다.");
			return;
		}

		while (findPw == null) {

			System.out.println();
			System.out.printf ("%s 계정의 암호를 찾을 방법을 선택하세요\n", accountDTO.getId());
			System.out.println("1. 이름과 주민번호로 비밀번호 찾기");
			System.out.println("2. 이메일로 비밀번호 찾기");
			System.out.println("3. 돌아가기");

			System.out.print(">>>");
			var select = InputModule.next();

			switch (select) {
			
				case "1" -> {
	
					System.out.println();
					System.out.println("가입한 이름과 주민번호로 암호를 찾습니다.");
	
					System.out.print("가입자 이름 : ");
					var name = InputModule.next();
	
					System.out.print("가입자 주민등록번호 13자리 : ");
					var ssn = InputModule.next();
	
					var userinfo = accountDTO.getUserinfo();
	
					if (userinfo.getName().equals(name) && userinfo.getSsn().equals(ssn)) {
						findPw = accountDTO.getPw();
						Alert.print("%s 계정의 비밀번호는 %s 입니다.", accountDTO.getId(), findPw);
					} else {
						Alert.print("가입한 계정 정보가 일치하지 않습니다.");
					}
				}
				case "2" -> {
	
					System.out.println();
					System.out.println("가입한 이메일로 암호를 찾습니다.");
	
					System.out.print("가입자 이메일 : ");
					var email = InputModule.next();
	
					var userinfo = accountDTO.getUserinfo();
	
					if (userinfo.getEmail().equals(email)) {
						findPw = accountDTO.getPw();
						Alert.print("%s 계정의 비밀번호는 %s 입니다.", accountDTO.getId(), findPw);
					} else {
						Alert.print("가입한 계정 정보가 일치하지 않습니다.");
					}
				}
				case "3" -> {
					break;
				}
				default -> {
					Alert.print("1~3 까지만 입력하세요.");
				}
			}

		}
	}
}

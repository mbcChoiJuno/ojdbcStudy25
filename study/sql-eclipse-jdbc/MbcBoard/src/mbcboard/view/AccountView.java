package mbcboard.view;

import java.util.Scanner;

import mbcboard.AccountSession;
import mbcboard.service.AccountService;

public class AccountView {
	
	private static Scanner in = new Scanner(System.in);

	public void menu() {

		while (AccountSession.getInstance().isLogin() == false) {
			
			System.out.println();
			System.out.println("MBC 자유 게시판 서비스입니다.");
			System.out.println("1. 로그인");
			System.out.println("2. 회원가입");
			System.out.println("3. 프로그램 종료");

			System.out.print(">>>");
			String select = in.next();
			
			switch (select) {
			
				case "1" -> performLogin(); 	// 1. 로그인
				case "2" -> performSignup(); 	// 2. 회원가입
				
				case "3" -> { // "3. 나가기
					System.out.println();
					System.out.println("프로그램을 종료합니다.");
					System.exit(0);
				}
				
				default -> {
					System.out.println();
					System.out.println("1~3 까지만 입력 바랍니다.");
				}
			}
		}
	}
	
	public void performLogin() {
		AccountService accountService = new AccountService();

		System.out.println();
		System.out.println("로그인을 진행합니다.");

		System.out.print("id : ");
		String id = in.next();

		System.out.print("pw : ");
		String pw = in.next();
		
		accountService.performLogin(id, pw);
	}
	
	public void performSignup() {
		AccountService accountService = new AccountService();

		System.out.println();
		System.out.println("회원가입을 진행합니다.");
		
		System.out.print("id : ");
		String id = in.next();

		if (4 > id.length()) {
			System.out.println();
			System.out.println("아이디는 4~10자여야 합니다. 다시 가입하세요.");
			return;
		}
		
		if (accountService.isExistId(id)) {
			System.out.println();
			System.out.println("이미 가입된 ID 입니다. 다시 가입하세요.");
			return;
		}		
		
		System.out.print("pw : ");
		String pw = in.next();

		System.out.print("비밀번호를 한번더 입력하세요 : ");
		String pwCheck = in.next();
		
		if (pw.equals(pwCheck) == false) {
			System.out.println();
			System.out.println("입력한 비밀번호가 다릅니다. 다시 가입하세요.");
			return;
		}
		
		System.out.print("이름 : ");
		String name = in.next();
		
		accountService.performSighup(id, pw, name);
	}

}

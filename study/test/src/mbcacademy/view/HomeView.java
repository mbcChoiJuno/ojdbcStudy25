package mbcacademy.view;

import java.time.format.DateTimeFormatter;

import mbcacademy.manager.SessionManager;
import mbcacademy.service.AccountService;
import mbcacademy.utils.Alert;
import mbcacademy.utils.InputModule;

public class HomeView {

	public void menu() {

		while (SessionManager.getInstance().isLogin()) {

			var currentUser = SessionManager.getInstance().currentUser();
			
			System.out.println();
			System.out.printf ("로그인 계정(%s)\n", currentUser.getId());
			System.out.println("1. 자유 게시판");
			System.out.println("2. 회원목록 조회");
			System.out.println("3. 회원 검색");
			System.out.println("4. 설정");
			System.out.println("5. 로그아웃");

			System.out.print(">>>");
			var select = InputModule.next();

			switch (select) {
				case "1" -> {
					var boardView = new BoardView();
					boardView.menu();
				}
				case "2" -> getUserList(); 		// 회원목록 조회
				case "3" -> getUserDetail();	// 회원 검색
				case "4" -> {
					var myInfoView = new MyInfoView();
					myInfoView.menu();
				}
				case "5" -> {
					Alert.print("%s님 로그아웃을 진행합니다.", currentUser.getUserinfo().getName());
					SessionManager.getInstance().onLogoutEvent();
				}
				default -> {
					Alert.print("1~5 까지만 입력하세요.");
				}
			}
		}
	}

	private void getUserList() {
		AccountService accountService = new AccountService();
		
		var userList = accountService.getUserList();
		
		if (userList.size() == 0) {
			System.out.println();
			System.out.println("가입된 유저가 없습니다.");
		} else {

			System.out.println();
			System.out.println("가입된 유저 리스트");
			System.out.println("유저번호\t아이디\t이름\t이메일\t가입일자");
			
			for(var user : userList) {
				System.out.printf("%s\t%s\t%s\t%s\t%s\n", 
						user.getUserinfo().getUno(),
						user.getId(),
						"비공개",
						"비공개",
						user.getRegistdate());
			}
		}
	}

	private void getUserDetail() {
		AccountService accountService = new AccountService();

		System.out.println();
		System.out.println("가입된 유저를 검색합니다.");

		System.out.print("찾을 사용자의 이름 : ");
		var name = InputModule.next();
		
		var userList = accountService.findAccountByName(name);

		System.out.println();
		System.out.println("검색된 유저 리스트");
		System.out.println("유저번호\t아이디\t이름\t이메일\t가입일자");
		
		for(var user : userList) {
			System.out.printf("%s\t%s\t%s\t%s\t%s\n", 
					user.getUserinfo().getUno(),
					user.getId(),
					"비공개",
					"비공개",
					user.getRegistdate());
		}
	}
}

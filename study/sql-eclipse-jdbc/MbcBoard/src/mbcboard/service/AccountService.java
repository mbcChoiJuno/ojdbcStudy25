package mbcboard.service;

import mbcboard.AccountSession;
import mbcboard.dto.UserDTO;
import mbcboard.repository.AccountRepository;

public class AccountService {
	
	private AccountRepository accountRepository = new AccountRepository();
	
	/**
	 * 로그인 시도
	 * @param id
	 * @param pw
	 */
	public void performLogin(String id, String pw) {
		var userDTO = accountRepository.findById(id);
		
		if (userDTO == null) {
			System.out.println();
			System.out.println("찾을 수 없는 계정입니다.");
			return;
		}
		
		if (pw.equals(userDTO.getPw())) {
			
			AccountSession.getInstance().onLoginEvent(userDTO);
			System.out.println();
			System.out.println(String.format("%s님 환영합니다.", userDTO.getName()));
			
		} else {
			
			System.out.println();
			System.out.println("비밀번호를 확인하고 다시 입력해주세요.");
		}
	}
	
	/**
	 * 가입시 ID 중복 체크
	 * @param id
	 * @return
	 */
	public boolean isExistId(String id) {
		return (accountRepository.findById(id) != null);
	}
	
	/**
	 * 가입 시도
	 * @param id
	 * @param pw
	 * @param name
	 */
	public void performSighup(String id, String pw, String name) {
		accountRepository.post(new UserDTO(id, pw, name));
	}
	
	/**
	 * 로그아웃 시도
	 */
	public void performLogout() {
		AccountSession.getInstance().onLogoutEvent();
	}
}

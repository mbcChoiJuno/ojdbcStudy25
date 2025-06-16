package mbcacademy.service;

import java.util.ArrayList;

import mbcacademy.dto.AccountDTO;
import mbcacademy.manager.SessionManager;
import mbcacademy.repository.AccountRepository;

public class AccountService {
	private AccountRepository accountRepository = new AccountRepository();
	
	/**
	 * 로그인 시도
	 * @param id
	 * @param pw
	 * @return
	 */
	public int performLogin(String id, String pw) {
		var accountDTO = accountRepository.findById(id);
		
		if (accountDTO != null) {
			
			if (accountDTO.getIsactive() == 0) {
				return 406; // 계정 비활성화 
			}
			
			if (accountDTO.getPw().equals(pw)) {
				SessionManager.getInstance().onLoginEvent(accountDTO);
				return 200; // 성공
			} else {
				return 401; // 인증실패
			}
		} 
		
		return -1; // 계정 없음
	}

	/**
	 * 계정으로 계정정보 조회하기
	 * @param id
	 */
	public AccountDTO findAccountById(String id) {
		return accountRepository.findById(id);
	}

	/**
	 * 회원 가입
	 * @param accountDTO
	 */
	public void performSignup(AccountDTO accountDTO) {
		accountRepository.post(accountDTO);
	}

	/**
	 * 아이디 중복 체크
	 * @param id
	 * @return
	 */
	public boolean isExistId(String id) {
		var accountDTO = accountRepository.findById(id);
		return (accountDTO != null);
	}

	/**
	 * 주민번호로 아이디 찾기
	 */
	public AccountDTO findAccountIdWithSSN(String name, String ssn) {
		return accountRepository.findBySsn(name, ssn);
	}

	/**
	 * 이메일로 아이디 찾기
	 */
	public AccountDTO findAccountIdByEmail(String email) {
		return accountRepository.findByEamil(email);
	}

	/**
	 * 유저 목록 조회
	 * @return
	 */
	public ArrayList<AccountDTO> getUserList() {
		return accountRepository.findAll();
	}

	/**
	 * 이름으로 유저 목록 조회
	 * @param name
	 * @return
	 */
	public  ArrayList<AccountDTO> findAccountByName(String name) {
		return accountRepository.findByName(name);
	}

	/**
	 * 비밀번호 변경
	 * @param pw
	 */
	public void changePassword(String pw) {
		var currentUser = SessionManager.getInstance().currentUser();
		currentUser.setPw(pw);
		
		accountRepository.update(currentUser, currentUser.getId());
	}
	
	/**
	 * 휴대폰 번호 변경
	 * @param phone
	 */
	public void changePhone(String phone) {
		var currentUser = SessionManager.getInstance().currentUser();
		currentUser.getUserinfo().setPhone(phone);
		
		accountRepository.update(currentUser, currentUser.getId());
	}
	
	/**
	 * 이메일 변경
	 * @param email
	 */
	public void changeEmail(String email) {
		var currentUser = SessionManager.getInstance().currentUser();
		currentUser.getUserinfo().setEmail(email);
		
		accountRepository.update(currentUser, currentUser.getId());
	}

	/**
	 * 회원 탈퇴
	 */
	public void withdrawAccount() {
		var currentUser = SessionManager.getInstance().currentUser();
		currentUser.setIsactive(0);
		
		accountRepository.update(currentUser, currentUser.getId());
	}
}

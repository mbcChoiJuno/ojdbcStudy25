package mbcacademy.repository;

import java.util.ArrayList;
import java.util.List;

import mbcacademy.dao.AccoutDAO;
import mbcacademy.dao.UserinfoDAO;
import mbcacademy.dto.AccountDTO;
import mbcacademy.dto.UserinfoDTO;
import mbcacademy.interfaces.IRepository;

public class AccountRepository implements IRepository<AccountDTO, String> {

	private AccoutDAO accountDAO = new AccoutDAO();
	private UserinfoDAO userinfoDAO = new UserinfoDAO();
	
	@Override
	public void post(AccountDTO dto) {
		
		userinfoDAO.insert(dto.getUserinfo());
		int userinfo_seq = userinfoDAO.getUserinfoSeq();
		
		accountDAO.insert(dto, userinfo_seq);
	}

	@Override
	public AccountDTO findById(String id) {
		
		var accountDTO = accountDAO.select(id);
		
		if (accountDTO == null) {
			return null;
		}
		
		int uno = accountDTO.getUserinfo().getUno();
		UserinfoDTO userinfoDTO = userinfoDAO.select(uno);
		
		accountDTO.setUserinfo(userinfoDTO); 
		
		return accountDTO;
	}

	@Override
	public ArrayList<AccountDTO> findAll() {
		return accountDAO.selectAll();
	}

	@Override
	public void update(AccountDTO dto, String id) {
		accountDAO.update(dto, id);
		userinfoDAO.update(dto, dto.getUserinfo().getUno());
	}

	@Override
	public void delete(String id) {
		
	}

	/**
	 * 주민번호로 계정 찾기
	 * @param name
	 * @param ssn
	 * @return
	 */
	public AccountDTO findBySsn(String name, String ssn) {
		AccountDTO accountDTO = null;
		
		UserinfoDTO userinfoDTO = userinfoDAO.findBySsn(name, ssn);
		
		if (userinfoDTO != null) {
			accountDTO = accountDAO.findByUno(userinfoDTO.getUno());
		}
		
		return accountDTO;
	}

	/**
	 * 이메일로 계정 찾기
	 * @param email
	 * @return
	 */
	public AccountDTO findByEamil(String email) {
		AccountDTO accountDTO = null;
		
		UserinfoDTO userinfoDTO = userinfoDAO.findByEmail(email);
		
		if (userinfoDTO != null) {
			accountDTO = accountDAO.findByUno(userinfoDTO.getUno());
		}
		
		return accountDTO;
	}

	/**
	 * 이름으로 계정 목록 찾기
	 * @param name
	 * @return
	 */
	public ArrayList<AccountDTO> findByName(String name) {
		return accountDAO.findByName(name);
	}
}

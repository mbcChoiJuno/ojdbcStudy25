package mbcboard.repository;

import java.util.List;

import mbcboard.dao.UserDAO;
import mbcboard.dto.UserDTO;
import mbcboard.interfaces.IRepository;

public class AccountRepository implements IRepository<UserDTO, String> {
	
	private UserDAO userDAO = new UserDAO();
	
	@Override
	public void post(UserDTO dto) {
		userDAO.insert(dto);
	}

	@Override
	public UserDTO findById(String id) {
		return userDAO.select(id);
	}

	@Override
	public List<UserDTO> findAll() {
		return userDAO.selectAll();
	}

	@Override
	public void update(UserDTO dto, String id) {
		userDAO.update(id, dto);
	}

	@Override
	public void delete(String id) {
		userDAO.delete(id);
	}

}

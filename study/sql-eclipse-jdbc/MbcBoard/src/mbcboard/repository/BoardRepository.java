package mbcboard.repository;

import java.util.List;

import jdbc.interfaces.IRepository;
import mbcboard.dao.BoardDAO;
import mbcboard.dto.BoardDTO;

public class BoardRepository implements IRepository<BoardDTO, Integer> {

	private BoardDAO boardDAO = new BoardDAO();
	
	@Override
	public void post(BoardDTO dto) {
		boardDAO.insert(dto);
	}

	@Override
	public BoardDTO findById(Integer index) {
		return boardDAO.select(index);
	}

	@Override
	public List<BoardDTO> findAll() {
		return boardDAO.selectAll();
	}

	@Override
	public void update(BoardDTO dto, Integer id) {
		boardDAO.update(id, dto);
	}

	@Override
	public void delete(Integer id) {
		boardDAO.delete(id);
	}

}

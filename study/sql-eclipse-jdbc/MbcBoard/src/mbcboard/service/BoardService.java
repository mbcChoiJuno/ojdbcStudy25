package mbcboard.service;

import java.util.List;

import mbcboard.dto.BoardDTO;
import mbcboard.repository.AccountRepository;
import mbcboard.repository.BoardRepository;

public class BoardService {
	
	private BoardRepository boardRepository = new BoardRepository();
	private AccountRepository accountRepository = new AccountRepository();
	
	/**
	 * 게시글 목록 조회
	 * @return
	 */
	public List<BoardDTO> getBoardList() {
		return boardRepository.findAll();
	}

	/**
	 * 게시글 등록
	 * @param bWriter
	 * @param bTitle
	 * @param bContent
	 */
	public void postBoard(String bWriter, String bTitle, String bContent) {
		BoardDTO boardDTO = new BoardDTO();
		boardDTO.setWriter(bWriter);
		boardDTO.setTitle(bTitle);
		boardDTO.setContent(bContent);
		
		boardRepository.post(boardDTO);
	}

	/**
	 * 보드 작성 정보 조회
	 * @param boardIndex
	 * @return
	 */
	public BoardDTO findBoardInfo(int boardIndex) {
		return boardRepository.findById(boardIndex);
	}

	/**
	 * 게시글 상세 조회
	 * @return
	 */
	public BoardDTO getBoardDetail(int boardIndex) {
		BoardDTO boardDTO = boardRepository.findById(boardIndex);
		
		var userId = boardDTO.getWriter();
		
		var userName = accountRepository.findById(userId).getName();
		
		boardDTO.setWriter(userName);
		
		return boardDTO;
	}

	/**
	 * 게시글 수정
	 * @param bno
	 * @param bWriter
	 * @param bTitle
	 * @param bContent
	 */
	public void updateBoard(int bno, String bWriter, String bTitle, String bContent) {
		BoardDTO boardDTO = new BoardDTO();
		boardDTO.setWriter(bWriter);
		boardDTO.setTitle(bTitle);
		boardDTO.setContent(bContent);
		
		boardRepository.update(boardDTO, bno);
	}

	/**
	 * 게시글 삭제
	 * @param bno
	 */
	public void deleteBoard(int bno) {
		boardRepository.delete(bno);
	}
}

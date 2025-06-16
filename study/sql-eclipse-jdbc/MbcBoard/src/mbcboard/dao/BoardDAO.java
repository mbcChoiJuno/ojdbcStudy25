package mbcboard.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import jdbc.config.JdbcConfig;
import mbcboard.dto.BoardDTO;

public class BoardDAO {
	
	private Connection connection = null;
	private PreparedStatement preparedStatement = null;
	private ResultSet resultSet = null;
		
	private void openDB() {
		
		var jdbcProfile = JdbcConfig.getInstance().getProfile("junotest");
		
		try {
			connection = jdbcProfile.getConnection();
		} catch (Exception e) { 
			e.printStackTrace();
		}
	}
	
	private void closeDB() {
		try {
			if (connection != null) {
				connection.close();
			}
			if (preparedStatement != null) {
				preparedStatement.close();
			}
			if (resultSet != null) {
				resultSet.close();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
		
	/**
	 * SELECT Query
	 * @param bno
	 * @return
	 */
	public BoardDTO select(int bno) {
		openDB();
		
		BoardDTO result = null;
		
		String query = String.format("SELECT * FROM board_tbl WHERE bno = ?");
		
		try {
			preparedStatement = connection.prepareStatement(query, 
					ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_UPDATABLE);
			
			preparedStatement.setInt(1, bno);
			
			resultSet = preparedStatement.executeQuery();
			
			while (resultSet.next()) {
				
				BoardDTO boardDTO = new BoardDTO();
				boardDTO.setBno(resultSet.getInt("bno"));
				boardDTO.setTitle (resultSet.getString("title"));
				boardDTO.setWriter(resultSet.getString("writer"));
				boardDTO.setContent(resultSet.getString("content"));
				boardDTO.setCreatedate(resultSet.getDate("createdate"));
				
				result = boardDTO;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeDB();
		}
		
		return result;
	}
	
	/**
	 * SELECT ALL Query
	 * @return
	 */
	public ArrayList<BoardDTO> selectAll() {
		openDB();
		
		ArrayList<BoardDTO> result = new ArrayList<BoardDTO>();
		
		String query = String.format("SELECT * FROM board_tbl ORDER BY bno DESC");
		
		try {
			preparedStatement = connection.prepareStatement(query, 
					ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_UPDATABLE);
			
			resultSet = preparedStatement.executeQuery();
			
			while (resultSet.next()) {
				
				BoardDTO boardDTO = new BoardDTO();
				boardDTO.setBno(resultSet.getInt("bno"));
				boardDTO.setTitle(resultSet.getString("title"));
				boardDTO.setWriter(resultSet.getString("writer"));
				boardDTO.setCreatedate(resultSet.getDate("createdate"));
				
				result.add(boardDTO);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeDB();
		}
		
		return result;
	}

	/**
	 * INSERT Query
	 * @param boardDTO
	 */
	public void insert(BoardDTO boardDTO) {
		openDB();
		
		String query = String.format("INSERT INTO board_tbl VALUES (board_seq.nextval, ?, ?, SYSDATE, ?)");

		try {
			var prepareStatement = connection.prepareStatement(query);
			prepareStatement.setObject(1, boardDTO.getTitle());
			prepareStatement.setObject(2, boardDTO.getContent());
			prepareStatement.setObject(3, boardDTO.getWriter());
			
			var result = prepareStatement.executeUpdate();
			
			if (result > 0) {
				connection.commit();
			} else {
				connection.rollback();
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeDB();
		}
	}

	/**
	 * UPDATE Query
	 * @param bno
	 * @param boardDTO
	 */
	public void update(int bno, BoardDTO boardDTO) {
		openDB();
		
		String query = String.format("UPDATE board_tbl SET (title, content, writer) = (?, ?, ?)"
				+ " WHERE bno = ?");

		try {
			var prepareStatement = connection.prepareStatement(query);
			prepareStatement.setObject(1, boardDTO.getTitle());
			prepareStatement.setObject(2, boardDTO.getContent());
			prepareStatement.setObject(3, boardDTO.getWriter());
			prepareStatement.setObject(4, bno);
			
			var result = prepareStatement.executeUpdate();
			
			if (result > 0) {
				connection.commit();
			} else {
				connection.rollback();
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeDB();
		}
	}

	/**
	 * DELETE Query
	 * @param bno
	 */
	public void delete(int bno) {
		openDB();
		
		String query = String.format("DELETE FROM board_tbl WHERE bno = ?");

		try {
			var prepareStatement = connection.prepareStatement(query);
			prepareStatement.setObject(1, bno);
			
			var result = prepareStatement.executeUpdate();
			
			if (result > 0) {
				connection.commit();
			} else {
				connection.rollback();
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeDB();
		}
	}

}

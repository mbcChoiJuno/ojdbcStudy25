package mbcboard.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import jdbc.config.JdbcConfig;
import mbcboard.dto.UserDTO;

public class UserDAO {

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
	public UserDTO select(String id) {
		openDB();
		
		UserDTO result = null;
		
		String query = String.format("SELECT * FROM lerp_user_tbl WHERE id = ?");
		
		try {
			preparedStatement = connection.prepareStatement(query);
			
			preparedStatement.setString(1, id);
			
			resultSet = preparedStatement.executeQuery();
			
			while (resultSet.next()) {
				
				result = new UserDTO(
						resultSet.getString("id"), 
						resultSet.getString("pw"), 
						resultSet.getString("name"));
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
	public ArrayList<UserDTO> selectAll() {
		return null;
	}

	/**
	 * INSERT Query
	 * @param userDTO
	 */
	public void insert(UserDTO userDTO) {
		openDB();
		
		String query = String.format("INSERT INTO lerp_user_tbl VALUES (?, ?, ?)");

		try {
			var prepareStatement = connection.prepareStatement(query);
			prepareStatement.setObject(1, userDTO.getId());
			prepareStatement.setObject(2, userDTO.getPw());
			prepareStatement.setObject(3, userDTO.getName());
			
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
	 * @param id
	 * @param userDTO
	 */
	public void update(String id, UserDTO userDTO) {
		openDB();
		
		String query = String.format("UPDATE lerp_user_tbl SET (btitle, bcontent, bwriter) = (?, ?, ?)"
				+ " WHERE id = ?");

		try {
			var prepareStatement = connection.prepareStatement(query);
			prepareStatement.setObject(1, userDTO.getId());
			prepareStatement.setObject(2, userDTO.getPw());
			prepareStatement.setObject(3, userDTO.getName());
			
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
	 * @param id
	 */
	public void delete(String id) {
		openDB();
		
		String query = String.format("DELETE FROM lerp_user_tbl WHERE id = ?");

		try {
			var prepareStatement = connection.prepareStatement(query);
			prepareStatement.setObject(1, id);
			
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

package mbcacademy.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import mbcacademy.dto.AccountDTO;
import mbcacademy.dto.UserinfoDTO;
import mbcacademy.entity.Account_tbl;
import mbcacademy.jdbc.config.JdbcConfig;

public class UserinfoDAO {

	private Connection connection = null;
	private PreparedStatement preparedStatement = null;
	private ResultSet resultSet = null;

	private void openDB() {
		
		var jdbcProfile = JdbcConfig.getInstance().getProfile("mbcacademy");
		
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

	public int getUserinfoSeq() {
		openDB();
		
		int lastSequence = -1;
		
		String query = String.format("SELECT MAX(uno) AS userinfo_seq FROM userinfo_tbl");
		
		try {
			preparedStatement = connection.prepareStatement(query);
						
			resultSet = preparedStatement.executeQuery();
			
			while (resultSet.next()) {
				lastSequence = resultSet.getInt("userinfo_seq");
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeDB();
		}
		
		return lastSequence;
	}
	
	/**
	 * SELECT Query
	 * @param bno
	 * @return
	 */
//	public UserDTO select(String id) {
//		openDB();
//		
//		UserDTO result = null;
//		
//		String query = String.format("SELECT * FROM lerp_user_tbl WHERE id = ?");
//		
//		try {
//			preparedStatement = connection.prepareStatement(query);
//			
//			preparedStatement.setString(1, id);
//			
//			resultSet = preparedStatement.executeQuery();
//			
//			while (resultSet.next()) {
//				
//				result = new UserDTO(
//						resultSet.getString("id"), 
//						resultSet.getString("pw"), 
//						resultSet.getString("name"));
//			}
//			
//		} catch (Exception e) {
//			e.printStackTrace();
//		} finally {
//			closeDB();
//		}
//		
//		return result;
//	}
	
	/**
	 * SELECT ALL Query
	 * @return
	 */
//	public ArrayList<UserDTO> selectAll() {
//		return null;
//	}

	/**
	 * INSERT Query
	 * @param userDTO
	 */
	public void insert(UserinfoDTO userinfoDTO) {
		openDB();
		
		String query = String.format("INSERT INTO userinfo_tbl (uno, name, ssn, phone, email)"
				+ " VALUES (userinfo_seq.nextval, ?, ?, ?, ?)");

		try {
			var prepareStatement = connection.prepareStatement(query);
			prepareStatement.setObject(1, userinfoDTO.getName());
			prepareStatement.setObject(2, userinfoDTO.getSsn());
			prepareStatement.setObject(3, userinfoDTO.getPhone());
			prepareStatement.setObject(4, userinfoDTO.getEmail());
			
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
//	public void update(String id, UserDTO userDTO) {
//		openDB();
//		
//		String query = String.format("UPDATE lerp_user_tbl SET (btitle, bcontent, bwriter) = (?, ?, ?)"
//				+ " WHERE id = ?");
//
//		try {
//			var prepareStatement = connection.prepareStatement(query);
//			prepareStatement.setObject(1, userDTO.getId());
//			prepareStatement.setObject(2, userDTO.getPw());
//			prepareStatement.setObject(3, userDTO.getName());
//			
//			var result = prepareStatement.executeUpdate();
//			
//			if (result > 0) {
//				connection.commit();
//			} else {
//				connection.rollback();
//			}
//			
//		} catch (Exception e) {
//			e.printStackTrace();
//		} finally {
//			closeDB();
//		}
//	}

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

	public UserinfoDTO select(int uno) {
		openDB();
		
		UserinfoDTO userinfoDTO = null;
		
		String query = String.format("SELECT * FROM userinfo_tbl WHERE uno = ?");
		
		try {
			preparedStatement = connection.prepareStatement(query);
			
			preparedStatement.setObject(1, uno);
			
			resultSet = preparedStatement.executeQuery();
			
			while (resultSet.next()) {
				
				userinfoDTO = new UserinfoDTO(
						resultSet.getInt("uno"),
						resultSet.getString("name"), 
						resultSet.getString("ssn"),
						resultSet.getString("phone"), 
						resultSet.getString("email"));
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeDB();
		}
		
		return userinfoDTO;
	}

	public UserinfoDTO findBySsn(String name, String ssn) {
		openDB();
		
		UserinfoDTO userinfoDTO = null;
		
		String query = String.format("SELECT * FROM userinfo_tbl WHERE name = ? and ssn = ?");
		
		try {
			preparedStatement = connection.prepareStatement(query);
			
			preparedStatement.setObject(1, name);
			preparedStatement.setObject(2, ssn);
			
			resultSet = preparedStatement.executeQuery();
			
			while (resultSet.next()) {
				
				userinfoDTO = new UserinfoDTO(
						resultSet.getInt("uno"),
						resultSet.getString("name"), 
						resultSet.getString("ssn"),
						resultSet.getString("phone"), 
						resultSet.getString("email"));
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeDB();
		}
		
		return userinfoDTO;
	}

	public UserinfoDTO findByEmail(String email) {
		openDB();
		
		UserinfoDTO userinfoDTO = null;
		
		String query = String.format("SELECT * FROM userinfo_tbl WHERE email = ?");
		
		try {
			preparedStatement = connection.prepareStatement(query);
			
			preparedStatement.setObject(1, email);
			
			resultSet = preparedStatement.executeQuery();
			
			while (resultSet.next()) {
				
				userinfoDTO = new UserinfoDTO(
						resultSet.getInt("uno"),
						resultSet.getString("name"), 
						resultSet.getString("ssn"),
						resultSet.getString("phone"), 
						resultSet.getString("email"));
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeDB();
		}
		
		return userinfoDTO;
	}

	public void update(AccountDTO dto, int uno) {

		openDB();

		UserinfoDTO userinfoDTO = dto.getUserinfo();
		
		String query = String.format("UPDATE userinfo_tbl SET (phone, email) = (?, ?) WHERE uno = ?");

		try {
			var prepareStatement = connection.prepareStatement(query);
			prepareStatement.setObject(1, userinfoDTO.getPhone());
			prepareStatement.setObject(2, userinfoDTO.getEmail());
			prepareStatement.setObject(3, userinfoDTO.getUno());
			
			var result = prepareStatement.executeUpdate();
			
			if (result > 0) {
				connection.commit();
			} else {
				connection.rollback();
			}
			
		} catch (Exception e) {
//			e.printStackTrace();
		} finally {
			closeDB();
		}
	}

}

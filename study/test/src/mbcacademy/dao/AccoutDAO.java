package mbcacademy.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import mbcacademy.dto.AccountDTO;
import mbcacademy.dto.UserinfoDTO;
import mbcacademy.entity.Account_tbl;
import mbcacademy.jdbc.config.JdbcConfig;

public class AccoutDAO {

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
		
	public void insert(AccountDTO accountDTO, int userinfo_seq) {
		openDB();
		
		Account_tbl table = new Account_tbl(accountDTO.getId(), accountDTO.getPw(), 0, null, 0);
		
		String query = String.format("INSERT INTO account_tbl (id, pw, uno) VALUES (?, ?, ?)");

		try {
			var prepareStatement = connection.prepareStatement(query);
			prepareStatement.setObject(1, table.getId());
			prepareStatement.setObject(2, table.getPw());
			prepareStatement.setObject(3, userinfo_seq);
			
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

	public AccountDTO select(String id) {
		openDB();
		
		Account_tbl table = null;
		
		String query = String.format("SELECT * FROM account_tbl WHERE id = ?");
		
		try {
			preparedStatement = connection.prepareStatement(query);
			
			preparedStatement.setObject(1, id);
			
			resultSet = preparedStatement.executeQuery();
			
			while (resultSet.next()) {
				
				table = new Account_tbl(
						resultSet.getString("id"), 
						resultSet.getString("pw"), 
						resultSet.getInt("uno"), 
						resultSet.getDate("registdate"), 
						resultSet.getInt("isactive"));
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeDB();
		}
		
		if (table != null) {
			var accountDTO = new AccountDTO(table.getId(), table.getPw());
			accountDTO.setRegistdate(table.getRegistdate().toLocalDate());
			accountDTO.setIsactive(table.getIsactive());
			
			var userinfo = new UserinfoDTO();
			userinfo.setUno(table.getUno());
			
			accountDTO.setUserinfo(userinfo);
			
			return accountDTO;
		}
		
		return null;
	}

	public ArrayList<AccountDTO> selectAll() {
		openDB();
		
		ArrayList<Account_tbl> tableList = new ArrayList<Account_tbl>();
		
		String query = String.format("SELECT * FROM account_tbl ORDER BY uno");
		
		try {
			preparedStatement = connection.prepareStatement(query);
			
			resultSet = preparedStatement.executeQuery();
			
			while (resultSet.next()) {
				
				Account_tbl table = new Account_tbl(
						resultSet.getString("id"), 
						resultSet.getString("pw"), 
						resultSet.getInt("uno"), 
						resultSet.getDate("registdate"), 
						resultSet.getInt("isactive"));
				
				tableList.add(table);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeDB();
		}
		
		if (tableList.size() != 0) {
			
			ArrayList<AccountDTO> accountDTOList = new ArrayList<AccountDTO>();
			
			for (var table : tableList) {

				var accountDTO = new AccountDTO(table.getId(), table.getPw());
				accountDTO.setRegistdate(table.getRegistdate().toLocalDate());
				accountDTO.setIsactive(table.getIsactive());
				
				var userinfo = new UserinfoDTO();
				userinfo.setUno(table.getUno());
				
				accountDTO.setUserinfo(userinfo);
				
				accountDTOList.add(accountDTO);
			}
			
			return accountDTOList;
		}
		
		return null;
	}

	/**
	 * 유저 개인정보에서 계정 찾기
	 * @param uno
	 * @return
	 */
	public AccountDTO findByUno(int uno) {
		openDB();
		
		Account_tbl table = null;
		
		String query = String.format("SELECT * FROM account_tbl WHERE uno = ?");
		
		try {
			preparedStatement = connection.prepareStatement(query);
			
			preparedStatement.setObject(1, uno);
			
			resultSet = preparedStatement.executeQuery();
			
			while (resultSet.next()) {
				
				table = new Account_tbl(
						resultSet.getString("id"), 
						resultSet.getString("pw"), 
						resultSet.getInt("uno"), 
						resultSet.getDate("registdate"), 
						resultSet.getInt("isactive"));
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeDB();
		}
		
		if (table != null) {
			var accountDTO = new AccountDTO(table.getId(), table.getPw());
			accountDTO.setRegistdate(table.getRegistdate().toLocalDate());
			accountDTO.setIsactive(table.getIsactive());
			
			var userinfo = new UserinfoDTO();
			userinfo.setUno(table.getUno());
			
			accountDTO.setUserinfo(userinfo);
			
			return accountDTO;
		}
		
		return null;
	}

	/**
	 * 이름으로 사용자 검색하기
	 * @param uno
	 * @return
	 */
	public ArrayList<AccountDTO> findByName(String name) {
		openDB();
		
		ArrayList<Account_tbl> tableList = new ArrayList<Account_tbl>();
		
		String query = String.format("SELECT A.id, A.pw, A.uno, A.registdate, A.isactive"
				+ " FROM account_tbl A"
				+ " JOIN userinfo_tbl I"
				+ " ON (A.uno = I.uno)"
				+ " WHERE I.name = ?");
		
		try {
			preparedStatement = connection.prepareStatement(query);
			
			preparedStatement.setObject(1, name);		
			resultSet = preparedStatement.executeQuery();
			
			while (resultSet.next()) {
				
				Account_tbl table = new Account_tbl(
						resultSet.getString("id"), 
						resultSet.getString("pw"), 
						resultSet.getInt("uno"), 
						resultSet.getDate("registdate"), 
						resultSet.getInt("isactive"));
				
				tableList.add(table);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeDB();
		}
		
		if (tableList.size() != 0) {
			
			ArrayList<AccountDTO> accountDTOList = new ArrayList<AccountDTO>();
			
			for (var table : tableList) {

				var accountDTO = new AccountDTO(table.getId(), table.getPw());
				accountDTO.setRegistdate(table.getRegistdate().toLocalDate());
				accountDTO.setIsactive(table.getIsactive());
				
				var userinfo = new UserinfoDTO();
				userinfo.setUno(table.getUno());
				
				accountDTO.setUserinfo(userinfo);
				
				accountDTOList.add(accountDTO);
			}
			
			return accountDTOList;
		}
		
		return null;
	}
	
	public void update(AccountDTO accountDTO, String id) {
		openDB();
		
		Account_tbl table = new Account_tbl(accountDTO.getId(), accountDTO.getPw(), 0, null, 0);
		
		String query = String.format("UPDATE account_tbl SET (pw) = (?) WHERE id = ?");

		try {
			var prepareStatement = connection.prepareStatement(query);
			prepareStatement.setObject(1, table.getPw());
			prepareStatement.setObject(2, table.getId());
			
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

package mbcacademy.dto;

import java.time.LocalDate;

public class AccountDTO {
	
	private String id;
	private String pw;
	private LocalDate registdate;
	private int isactive;

	private UserinfoDTO userinfo;
	
	public AccountDTO() {
		
	}
	
	public AccountDTO(String id, String pw) {
		this.id = id;
		this.pw = pw;
	}

	public String getId() {
		return id;
	}

	public String getPw() {
		return pw;
	}

	public LocalDate getRegistdate() {
		return registdate;
	}

	public int getIsactive() {
		return isactive;
	}

	public UserinfoDTO getUserinfo() {
		return userinfo;
	}

	public void setId(String id) {
		this.id = id;
	}

	public void setPw(String pw) {
		this.pw = pw;
	}

	public void setRegistdate(LocalDate registdate) {
		this.registdate = registdate;
	}

	public void setIsactive(int isactive) {
		this.isactive = isactive;
	}

	public void setUserinfo(UserinfoDTO userinfo) {
		this.userinfo = userinfo;
	}
}

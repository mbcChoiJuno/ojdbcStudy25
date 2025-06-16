package mbcacademy.entity;

import java.sql.Date;

public class Account_tbl {
	
	private String id;
	private String pw;
	private int uno;
	private Date registdate;
	private int isactive;
	
	public Account_tbl(String id, String pw, int uno, Date registdate, int isactive) {
		this.id = id;
		this.pw = pw;
		this.uno = uno;
		this.registdate = registdate;
		this.isactive = isactive;
	}

	public String getId() {
		return id;
	}

	public String getPw() {
		return pw;
	}

	public int getUno() {
		return uno;
	}

	public Date getRegistdate() {
		return registdate;
	}

	public int getIsactive() {
		return isactive;
	}

	public void setId(String id) {
		this.id = id;
	}

	public void setPw(String pw) {
		this.pw = pw;
	}

	public void setUno(int uno) {
		this.uno = uno;
	}

	public void setRegistdate(Date registdate) {
		this.registdate = registdate;
	}

	public void setIsactive(int isactive) {
		this.isactive = isactive;
	}
	
}

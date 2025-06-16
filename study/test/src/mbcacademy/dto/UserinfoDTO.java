package mbcacademy.dto;

public class UserinfoDTO {

	private int uno;

	private String name;
	private String ssn;
	private String phone;
	private String email;

	public UserinfoDTO() {
		// TODO Auto-generated constructor stub
	}
	
	public UserinfoDTO(String name, String ssn, String phone, String email) {
		this.name = name;
		this.ssn = ssn;
		this.phone = phone;
		this.email = email;
	}
	
	public UserinfoDTO(int uno, String name, String ssn, String phone, String email) {
		this.uno = uno;
		this.name = name;
		this.ssn = ssn;
		this.phone = phone;
		this.email = email;
	}

	public int getUno() {
		return uno;
	}
	
	public String getName() {
		return name;
	}

	public String getSsn() {
		return ssn;
	}

	public String getPhone() {
		return phone;
	}

	public String getEmail() {
		return email;
	}
	
	public void setUno(int uno) {
		this.uno = uno;
	}
	
	public void setName(String name) {
		this.name = name;
	}

	public void setSsn(String ssn) {
		this.ssn = ssn;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public void setEmail(String email) {
		this.email = email;
	}

}

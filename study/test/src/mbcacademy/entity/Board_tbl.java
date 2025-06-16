package mbcacademy.entity;

import java.sql.Date;

public class Board_tbl {

	private int bno;
	private String title;
	private String content;
	private Date creationdate;
	private Date lastupdatedate;
	private int viewcount;
	private int isactive;
	private String id;

	public Board_tbl(int bno, String title, String content, Date creationdate, Date lastupdatedate, int viewcount,
			int isactive, String id) {
		this.bno = bno;
		this.title = title;
		this.content = content;
		this.creationdate = creationdate;
		this.lastupdatedate = lastupdatedate;
		this.viewcount = viewcount;
		this.isactive = isactive;
		this.id = id;
	}

	public int getBno() {
		return bno;
	}

	public String getTitle() {
		return title;
	}

	public String getContent() {
		return content;
	}

	public Date getCreationdate() {
		return creationdate;
	}

	public Date getLastupdatedate() {
		return lastupdatedate;
	}

	public int getViewcount() {
		return viewcount;
	}

	public int getIsactive() {
		return isactive;
	}

	public String getId() {
		return id;
	}

	public void setBno(int bno) {
		this.bno = bno;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public void setCreationdate(Date creationdate) {
		this.creationdate = creationdate;
	}

	public void setLastupdatedate(Date lastupdatedate) {
		this.lastupdatedate = lastupdatedate;
	}

	public void setViewcount(int viewcount) {
		this.viewcount = viewcount;
	}

	public void setIsactive(int isactive) {
		this.isactive = isactive;
	}

	public void setId(String id) {
		this.id = id;
	}
}

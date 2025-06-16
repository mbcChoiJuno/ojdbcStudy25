package mbcboard.dto;

import java.sql.Date;

public class BoardDTO {

	private int bno;
	private String title;
	private String content;
	private String writer;
	private Date createdate;

	public BoardDTO() {
		
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
	public String getWriter() {
		return writer;
	}
	public Date getCreatedate() {
		return createdate;
	}
	public void setBno(int bno) {
		this.bno = bno;
	}
	public void setTitle(String btitle) {
		this.title = btitle;
	}
	public void setContent(String bcontent) {
		this.content = bcontent;
	}
	public void setWriter(String bwriter) {
		this.writer = bwriter;
	}
	public void setCreatedate(Date bdate) {
		this.createdate = bdate;
	}
}

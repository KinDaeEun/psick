package model;

import java.sql.Date;

public class Buy {
	private int bno;
	private Date b_date;
	private String b_addr;
	private String b_tel;
	private String b_reveiver;
	private String id;
	public int getBno() {
		return bno;
	}
	public void setBno(int bno) {
		this.bno = bno;
	}
	public Date getB_date() {
		return b_date;
	}
	public void setB_date(Date b_date) {
		this.b_date = b_date;
	}
	public String getB_addr() {
		return b_addr;
	}
	public void setB_addr(String b_addr) {
		this.b_addr = b_addr;
	}
	public String getB_tel() {
		return b_tel;
	}
	public void setB_tel(String b_tel) {
		this.b_tel = b_tel;
	}
	public String getB_reveiver() {
		return b_reveiver;
	}
	public void setB_reveiver(String b_reveiver) {
		this.b_reveiver = b_reveiver;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}

	
	
	
}

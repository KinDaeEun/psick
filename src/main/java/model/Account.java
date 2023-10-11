package model;

import java.sql.Date;

public class Account {
	private int ano;
	private String id;
	private String a_name;
	private String a_title;
	private Date a_date;
	private String a_content;
	private int a_cnt;
	private String a_del;
	
	public String getA_name() {
		return a_name;
	}
	public int getA_cnt() {
		return a_cnt;
	}
	public void setA_cnt(int a_cnt) {
		this.a_cnt = a_cnt;
	}
	public void setA_name(String a_name) {
		this.a_name = a_name;
	}
	public int getAno() {
		return ano;
	}
	public void setAno(int ano) {
		this.ano = ano;
	}
	public String getA_content() {
		return a_content;
	}
	public void setA_content(String a_content) {
		this.a_content = a_content;
	}
	public String getA_title() {
		return a_title;
	}
	public void setA_title(String a_title) {
		this.a_title = a_title;
	}
	public Date getA_date() {
		return a_date;
	}
	public void setA_date(Date a_date) {
		this.a_date = a_date;
	}
	public String getA_del() {
		return a_del;
	}
	public void setA_del(String a_del) {
		this.a_del = a_del;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}

	
}

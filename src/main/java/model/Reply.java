package model;

import java.sql.Date;

public class Reply {
	private int re_no;
	private String id;
	private int ano;
	private String ref_content;
	private Date ref_date;
	private int ref;
	private int ref_level;
	private int ref_step;
	private int ref_cnt;
	private String ref_del;
	
	
	public int getRe_no() {
		return re_no;
	}
	public void setRe_no(int re_no) {
		this.re_no = re_no;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public int getAno() {
		return ano;
	}
	public void setAno(int ano) {
		this.ano = ano;
	}
	public String getRef_content() {
		return ref_content;
	}
	public void setRef_content(String ref_content) {
		this.ref_content = ref_content;
	}
	public Date getRef_date() {
		return ref_date;
	}
	public void setRef_date(Date ref_date) {
		this.ref_date = ref_date;
	}
	public int getRef() {
		return ref;
	}
	public void setRef(int ref) {
		this.ref = ref;
	}
	public int getRef_level() {
		return ref_level;
	}
	public void setRef_level(int ref_level) {
		this.ref_level = ref_level;
	}
	public int getRef_step() {
		return ref_step;
	}
	public void setRef_step(int ref_step) {
		this.ref_step = ref_step;
	}
	public int getRef_cnt() {
		return ref_cnt;
	}
	public void setRef_cnt(int ref_cnt) {
		this.ref_cnt = ref_cnt;
	}
	public String getRef_del() {
		return ref_del;
	}
	public void setRef_del(String ref_del) {
		this.ref_del = ref_del;
	}











}

package model;

public class Event {
	private int eno;
	private String ename;
	private String e_img;
	private String e_del;
	
	public String getE_del() {
		return e_del;
	}
	public void setE_del(String e_del) {
		this.e_del = e_del;
	}
	public int getEno() {
		return eno;
	}
	public void setEno(int eno) {
		this.eno = eno;
	}
	public String getEname() {
		return ename;
	}
	public void setEname(String ename) {
		this.ename = ename;
	}
	public String getE_img() {
		return e_img;
	}
	public void setE_img(String e_img) {
		this.e_img = e_img;
	}

}

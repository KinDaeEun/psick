package model;

import java.sql.Date;

public class Product {
	private int pno;
	private String pname;
	private int p_price;
	private String p_country;
	private String p_detail_img;
	private String p_detail_content;
	private int discount;
	private String p_kind;
	private String p_del;
	private Date p_date;
	private int p_count;
	private int buy_count;

	public Date getP_date() {
		return p_date;
	}

	public void setP_date(Date p_date) {
		this.p_date = p_date;
	}

	public String getP_kind() {
		return p_kind;
	}

	public void setP_kind(String p_kind) {
		this.p_kind = p_kind;
	}

	public int getPno() {
		return pno;
	}

	public void setPno(int pno) {
		this.pno = pno;
	}

	public String getPname() {
		return pname;
	}

	public void setPname(String pname) {
		this.pname = pname;
	}

	public int getP_price() {
		return p_price;
	}

	public void setP_price(int p_price) {
		this.p_price = p_price;
	}

	public String getP_country() {
		return p_country;
	}

	public void setP_country(String p_country) {
		this.p_country = p_country;
	}

	public String getP_detail_img() {
		return p_detail_img;
	}

	public void setP_detail_img(String p_detail_img) {
		this.p_detail_img = p_detail_img;
	}

	public String getP_detail_content() {
		return p_detail_content;
	}

	public void setP_detail_content(String p_detail_content) {
		this.p_detail_content = p_detail_content;
	}

	public int getDiscount() {
		return discount;
	}

	public void setDiscount(int discount) {
		this.discount = discount;
	}

	public String getP_del() {
		return p_del;
	}

	public void setP_del(String p_del) {
		this.p_del = p_del;
	}

	public int getP_count() {
		return p_count;
	}

	public void setP_count(int p_count) {
		this.p_count = p_count;
	}

	public int getBuy_count() {
		return buy_count;
	}

	public void setBuy_count(int buy_count) {
		this.buy_count = buy_count;
	}

}

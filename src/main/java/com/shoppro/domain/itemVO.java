package com.shoppro.domain;

import org.springframework.web.multipart.MultipartFile;

public class itemVO {
	private String itemid;		//아이템 고유번호(primary key)
	private String itemname;	//이름
	private String itemgenre;	//종류
	private String itemimg;		//아이템 file
	private String price;		//가격
	private String itemstate;	//아이템 상태(다팔림,재고 남음)
	private String itemcount;	//아이템 남은 갯수
	private String itembrand;	//아이템 브랜드
	private int sellcount;		//팔린 갯수
	private String sex;			//성별
	private String itemsize;	//아이템 사이즈(s/m/L/XL/XLL)
	private String itemmanual;  //아이템 설명
	
	public String getItemmanual() {
		return itemmanual;
	}
	public void setItemmanual(String itemmanual) {
		this.itemmanual = itemmanual;
	}
	public String getItemsize() {
		return itemsize;
	}
	public void setItemsize(String itemsize) {
		this.itemsize = itemsize;
	}
	public String getSex() {
		return sex;
	}
	public void setSex(String sex) {
		this.sex = sex;
	}
	public String getItemid() {
		return itemid;
	}
	public void setItemid(String itemid) {
		this.itemid = itemid;
	}
	public String getItemname() {
		return itemname;
	}
	public void setItemname(String itemname) {
		this.itemname = itemname;
	}
	public String getItemgenre() {
		return itemgenre;
	}
	public void setItemgenre(String itemgenre) {
		this.itemgenre = itemgenre;
	}
	public String getItemimg() {
		return itemimg;
	}
	public void setItemimg(String itemimg) {
		this.itemimg = itemimg;
	}
	public String getPrice() {
		return price;
	}
	public void setPrice(String price) {
		this.price = price;
	}
	public String getItemstate() {
		return itemstate;
	}
	public void setItemstate(String itemstate) {
		this.itemstate = itemstate;
	}
	public String getItemcount() {
		return itemcount;
	}
	public void setItemcount(String itemcount) {
		this.itemcount = itemcount;
	}
	public String getItembrand() {
		return itembrand;
	}
	public void setItembrand(String itembrand) {
		this.itembrand = itembrand;
	}
	
	public int getSellcount() {
		return sellcount;
	}
	public void setSellcount(int sellcount) {
		this.sellcount = sellcount;
	}
	@Override
	public String toString() {
		return "itemVO [itemid=" + itemid + ", itemname=" + itemname + ", itemgenre=" + itemgenre + ", itemimg="
				+ itemimg + ", price=" + price + ", itemstate=" + itemstate + ", itemcount=" + itemcount
				+ ", itembrand=" + itembrand + ", sellcount=" + sellcount + ", sex=" + sex + ", itemsize=" + itemsize
				+ ", itemmanual=" + itemmanual + "]";
	}
	
}

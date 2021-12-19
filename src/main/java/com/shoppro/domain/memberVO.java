package com.shoppro.domain;

public class memberVO {
	private String memid;
	private String name;
	private String password;
	private String address;
	private String phonenum;
	private String email;
	public String getMemid() {
		return memid;
	}
	public void setMemid(String memid) {
		this.memid = memid;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getPhonenum() {
		return phonenum;
	}
	public void setPhonenum(String phonenum) {
		this.phonenum = phonenum;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	@Override
	public String toString() {
		return "memberVO [memid=" + memid + ", name=" + name + ", password=" + password + ", address=" + address
				+ ", phonenum=" + phonenum + ", email=" + email + "]";
	}
}

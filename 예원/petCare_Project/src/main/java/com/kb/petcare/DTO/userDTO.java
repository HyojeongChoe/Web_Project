package com.kb.petcare.DTO;

public class userDTO {
	private String name;	//이름
	private String id;		//아이디
	private String pw;		//비밀번호
	private String email;	//이메일
	private String mobile;		//연락처
	private String addr;	//주소
	private String birth;	//생일
	private String pet;		//반려동물
	
	
	//getter,setter
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPw() {
		return pw;
	}
	public void setPw(String pw) {
		this.pw = pw;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getMobile() {
		return mobile;
	}
	public void setMobile(String mobile) {
		this.mobile = mobile;
	}
	public String getAddr() {
		return addr;
	}
	public void setAddr(String addr) {
		this.addr = addr;
	}
	public String getBirth() {
		return birth;
	}
	public void setBirth(String birth) {
		this.birth = birth;
	}
	public String getPet() {
		return pet;
	}
	public void setPet(String pet) {
		this.pet = pet;
	}
}

package com.kb.petcare.DTO;

public class userDTO {
	// 회원가입 테이블
	private String name; // 이름
	private String id; // 아이디
	private String pw; // 비밀번호
	private String email; // 이메일
	private String mobile; // 연락처
	private String addr; // 주소
	private String birth; // 생일

	// Reserve 테이블 칼럼
	// private String id; // ※User 테이블과 겹침
	private String service; // 서비스 종류(돌봄, 산책, 미용)
	private String time; // 돌봄/산책 시간(60분, 120분, 180분)
	private String grooming; // 미용(전체, 위생)
	private String pet; // 반려동물(소/중형,대형,고양이)
	private String date; // 예약날짜
	private String message; // 문의사항
	private String cost; // 총비용

	// getter,setter
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

	public String getService() {
		return service;
	}

	public void setService(String service) {
		this.service = service;
	}

	public String getTime() {
		return time;
	}

	public void setTime(String time) {
		this.time = time;
	}

	public String getGrooming() {
		return grooming;
	}

	public void setGrooming(String grooming) {
		this.grooming = grooming;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	public String getCost() {
		return cost;
	}

	public void setCost(String cost) {
		this.cost = cost;
	}
}

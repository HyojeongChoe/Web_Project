package com.kb.petcare.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class userDAO {
	private Connection conn = null;
	private Statement st = null;
	private ResultSet rs = null;
	private PreparedStatement ps = null;

	private DataSource ds = null;

	//생성자
	public userDAO() {
		try {
			Context ctx = new InitialContext(); // 프로젝트명반환
			ds = (DataSource) ctx.lookup("java:comp/env/jdbc/mysql");
		} catch (Exception e) {
			System.out.println("드라이버 로드 실패");
			e.printStackTrace();
		}
	}
	
	//회원가입기능
	public void userInsert(String name, String id, String pw, String email1, String email2, String addr, String birth, String pet) {
		conn = null;
		ps = null;
		// ds는 초기화하면 DB접속에 문제가 생김
		try {
			conn = ds.getConnection();// DB접속
			
			String email = email1 + email2; //입력받은 email1과 select한 email2 더해서 db에 연동하기 위해
			String query = "INSERT INTO user VALUES(?,?,?,?,?,?,?)"; // 물음표가 있기 때문에 ps사용
			ps = conn.prepareStatement(query);
			ps.setString(1, name);
			ps.setString(2, id);
			ps.setString(3, pw);
			ps.setString(4, email);
			ps.setString(5, addr);
			ps.setString(6, birth);
			ps.setString(7, pet);
			ps.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				conn.close();
				ps.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
	}

}

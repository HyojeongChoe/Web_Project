package com.kb.petcare.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;

public class userDAO {
	private Connection conn = null;
	private Statement st = null;
	private ResultSet rs = null;
	private PreparedStatement ps = null;
	private DataSource ds = null;

	// 생성자
	public userDAO() {
		try {
			Context ctx = new InitialContext(); // 프로젝트명반환
			ds = (DataSource) ctx.lookup("java:comp/env/jdbc/mysql");
		} catch (Exception e) {
			System.out.println("드라이버 로드 실패");
			e.printStackTrace();
		}
	}

	// 회원가입기능
	public void userInsert(String name, String id, String pw, String email, String addr, String birth, String pet,
			String mobile) {
		conn = null;
		ps = null;
		// ds는 초기화하면 DB접속에 문제가 생김
		try {
			conn = ds.getConnection();// DB접속

			String query = "INSERT INTO user VALUES(?,?,?,?,?,?,?,?)"; // 물음표가 있기 때문에 ps사용
			ps = conn.prepareStatement(query);
			ps.setString(1, name);
			ps.setString(2, id);
			ps.setString(3, pw);
			ps.setString(4, email);
			ps.setString(5, addr);
			ps.setString(6, birth);
			ps.setString(7, pet);
			ps.setString(8, mobile);
			ps.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				// PreparedStatement를 먼저 닫음
				if (ps != null) {
					ps.close();
				}
				// Connection을 닫음
				if (conn != null) {
					conn.close();
				}
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
	}

	// 로그인
	public boolean userLogin(String id, String pw) {
		conn = null;
		ps = null;
		rs = null;

		try {
			conn = ds.getConnection();

			String query = "SELECT * FROM user WHERE id = ? AND pw = ?";
			ps = conn.prepareStatement(query);
			ps.setString(1, id);
			ps.setString(2, pw);
			rs = ps.executeQuery();

			if (rs.next()) {
				return true;
			} else {
				return false;
			}

		} catch (Exception e) {
			System.out.println("Login 테스트 실패");
			e.printStackTrace();
			return false;
		} finally {
			try {
				// 이미 닫은 객체를 다시 닫지 않도록 수정
				if (rs != null) {
					rs.close();
				}
				if (ps != null) {
					ps.close();
				}
				if (conn != null) {
					conn.close();
				}
			} catch (Exception e2) {
				System.out.println("객체 닫기 실패");
				e2.printStackTrace();
			}
		}
	}

	// 아이디 중복확인
	public boolean checkDuplicateId(String id) {
		conn = null;
		ps = null;
		rs = null;

		try {
			conn = ds.getConnection();

			String query = "SELECT id FROM user WHERE id = ?";
			ps = conn.prepareStatement(query);
			ps.setString(1, id);
			rs = ps.executeQuery();

			if (rs.next()) {
				return true; // 결과가 있으면 중복
			} else {
				return false;
			}
		} catch (Exception e) {
			System.out.println("아이디 중복확인 실패");
			e.printStackTrace();
			return false;
		} finally {
			try {
				conn.close();
				ps.close();
				rs.close();
			} catch (Exception e2) {
				System.out.println("객체 닫기 실패");
				e2.printStackTrace();
			}
		}
	}

	// 아이디 찾기
	public String findId(String name, String birth, String mobile, HttpServletRequest request,
			HttpServletResponse response) {
		conn = null;
		ps = null;
		rs = null;

		try {
			conn = ds.getConnection();

			String query = "SELECT id FROM user WHERE name = ? AND birth = ? AND mobile = ?";
			ps = conn.prepareStatement(query);
			ps.setString(1, name);
			ps.setString(2, birth);
			ps.setString(3, mobile);
			rs = ps.executeQuery();

			if (rs.next()) {
				String foundId = rs.getString("id");
				request.setAttribute("foundId", foundId); // 찾은 아이디를 request 속성에 저장
				// response.sendRedirect("FindGetId.jsp");
				return foundId; // 일치하는 아이디 반환
			} else {
				return null; // 일치하는 데이터 없을 경우
			}
		} catch (Exception e) {
			System.out.println("아이디 찾기 실패");
			e.printStackTrace();
			return null;
		} finally {
			try {
				conn.close();
				ps.close();
				rs.close();
			} catch (Exception e2) {
				System.out.println("객체 닫기 실패");
				e2.printStackTrace();
			}
		}
	}

}
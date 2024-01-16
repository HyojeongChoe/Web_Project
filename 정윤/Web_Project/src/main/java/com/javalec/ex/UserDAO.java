package com.javalec.ex;

import java.sql.*;
import javax.sql.DataSource;
import javax.naming.InitialContext;
import javax.naming.Context;

public class UserDAO {
	private Connection conn = null;
	private Statement st = null;
	private PreparedStatement ps = null;
	private ResultSet rs = null;
	
	// DAO 생성자에서 드라이버 로드 -> Class.forName()
	// 각 메소드에서 url, id, pw과 conn을 통해서, DB 접속
	// => DB 접속에 시간이 많이 소요
	
	// 시간 절약을 위해서, DataSource 객체 사용
	private DataSource ds = null;
	
	// 생성자 생성
	public UserDAO() {
		// jdbc 드라이버 로드
		try {
			// 해당 프로젝트의 컨텍스트 내용 찾음 (server.xml의 리소스 찾음)
			Context ctx = new InitialContext();
			// 위 리소스로, DataSource 객체 초기화
			ds = (DataSource)ctx.lookup("java:comp/env/jdbc/mysql"); 
		} catch(Exception e) {
			System.out.println("UserDAO 생성자 에러");
			e.printStackTrace();
		}
	}
	
	public void insertUser(String name, String id, String pw, String email, String addr, int birth, String pet) {
		conn = null;	// 다른 메소드와 겹치지 않게끔 null값으로 설정 후 충돌 방지
		ps = null;
		try {
			// DataSource 객체 통해서 DB 접속 수행
			// (서버에 있는 리소스로 즉시 접속 시도)
			conn = ds.getConnection();
			
			String query = "INSERT INTO user VALUES (?, ?, ?, ?, ?, ?, ?)"; // user라는 테이블에 5개의 값 삽입
			ps = conn.prepareStatement(query);  // ps 객체 초기화해서 쿼리문 작성
			// INSERT 구문에서 칼럼 순서를 명시하지 않으면 
			// 테이블 생성 시 칼럼 선언한 순서대로 삽입
			ps.setString(1, name);
			ps.setString(2, id);
			ps.setString(3, pw);
			ps.setString(4, email);
			ps.setString(5, addr);
			ps.setInt(6, birth);
			ps.setString(7, pet);
			ps.executeUpdate(); // INSERT이기 때문에 executeQuery가 아닌 executeUpdate 사용
			
			System.out.println("회원가입이 성공적으로 완료되었습니다."); // 콘솔 상으로 가입여부 확인
		} catch(Exception e) {
			System.out.println("insertUser 메소드 에러");
			e.printStackTrace(); // 어떤 에러가 발생 했는지 보여줌
		} finally {
			try {
				conn.close();
				ps.close();
			} catch(Exception e2) {
				System.out.println("객체 닫기 실패");
				
			}
		}
	}
}



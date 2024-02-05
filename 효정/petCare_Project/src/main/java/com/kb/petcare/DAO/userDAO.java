package com.kb.petcare.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;

import com.kb.petcare.DTO.userDTO;

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
	public void userInsert(String name, String id, String pw, String email, String addr, String birth, String mobile) {
		conn = null;
		ps = null;
		// ds는 초기화하면 DB접속에 문제가 생김
		try {
			conn = ds.getConnection();// DB접속

			String query = "INSERT INTO user VALUES(?,?,?,?,?,?,?)"; // 물음표가 있기 때문에 ps사용
			ps = conn.prepareStatement(query);
			ps.setString(1, name);
			ps.setString(2, id);
			ps.setString(3, pw);
			ps.setString(4, email);
			ps.setString(5, addr);
			ps.setString(6, birth);
			ps.setString(7, mobile);
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

	// 비밀번호 찾기
	public String findPw(String id, String name, String birth, String mobile, HttpServletRequest request,
			HttpServletResponse response) {
		conn = null;
		ps = null;
		rs = null;

		try {
			conn = ds.getConnection();

			String query = "SELECT pw FROM user WHERE id = ? AND name = ? AND birth = ? AND mobile = ?";
			ps = conn.prepareStatement(query);
			ps.setString(1, id);
			ps.setString(2, name);
			ps.setString(3, birth);
			ps.setString(4, mobile);
			rs = ps.executeQuery();

			if (rs.next()) {
				String foundPw = rs.getString("pw");
				request.setAttribute("foundPw", foundPw); // 찾은 아이디를 request 속성에 저장
				return foundPw; // 일치하는 비밀번호 반환
			} else {
				return null; // 일치하는 데이터 없을 경우
			}
		} catch (Exception e) {
			System.out.println("비밀번호 찾기 실패");
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

	// 예약하기 : 돌봄/산책 통일
	public void reserveCare(String id, String service, String time, String pet, String date, String message,
			String cost) {
		conn = null;
		ps = null;
		rs = null;

		try {
			conn = ds.getConnection();

			String query = "INSERT INTO reserve VALUES(?,?,?,?,?,?,?,?)";
			ps = conn.prepareStatement(query);
			ps.setString(1, id);
			ps.setString(2, service);
			ps.setString(3, time);
			ps.setString(4, "");
			ps.setString(5, pet);
			ps.setString(6, date);
			ps.setString(7, message);
			ps.setString(8, cost);
			ps.executeUpdate();

		} catch (Exception e) {
			System.out.println("예약하기(돌봄/산책) 실패");
			e.printStackTrace();
		} finally {
			try {
				conn.close();
				ps.close();
			} catch (Exception e2) {
				System.out.println("객체 닫기 실패");
				e2.printStackTrace();
			}
		}
	}

	// 예약하기 : 미용
	public void reserveGro(String id, String service, String grooming, String pet, String date, String message,
			String cost) {
		conn = null;
		ps = null;
		rs = null;

		try {
			conn = ds.getConnection();

			String query = "INSERT INTO reserve VALUES(?,?,?,?,?,?,?,?)";
			ps = conn.prepareStatement(query);
			ps.setString(1, id);
			ps.setString(2, service);
			ps.setString(3, "");
			ps.setString(4, grooming);
			ps.setString(5, pet);
			ps.setString(6, date);
			ps.setString(7, message);
			ps.setString(8, cost);
			ps.executeUpdate();

		} catch (Exception e) {
			System.out.println("예약하기(미용) 실패");
			e.printStackTrace();
		} finally {
			try {
				conn.close();
				ps.close();
			} catch (Exception e2) {
				System.out.println("객체 닫기 실패");
				e2.printStackTrace();
			}
		}
	}

	// 예약내역 출력
		public ArrayList<userDTO> userSelect(String id) {
			// 결과값 담을 배열
			ArrayList<userDTO> result = new ArrayList<userDTO>();

			conn = null;
			ps = null;
			rs = null;

			try {
				conn = ds.getConnection();

				String query = "SELECT * FROM reserve WHERE id = ?";
				ps = conn.prepareStatement(query);
				ps.setString(1, id);
				rs = ps.executeQuery();

				while (rs.next()) { // rs.next() :: 결과값 하나씩 확인하며 돈다
					userDTO element = new userDTO();

					element.setDate(rs.getString("date"));
					element.setService(rs.getString("service"));
					element.setTime(rs.getString("time"));
					element.setGrooming(rs.getString("grooming"));
					element.setPet(rs.getString("pet"));
					element.setCost(rs.getString("cost"));

					// element 객체에 데이터 한 묶음씩 저장
					result.add(element);
				}
			} catch (Exception e) {
				System.out.println("SELECT 쿼리 수행 실패");
				e.printStackTrace();
			} finally {
				try {
					conn.close();
					ps.close();
					rs.close();
				} catch (Exception e) {
					System.out.println("객체 닫기 실패");
					e.printStackTrace();
				}
			}

			return result;
		}
		// 추가: 페이징을 위한 메서드
		public ArrayList<userDTO> userSelectPaging(String id, int offset, int itemsPerPage) {
			ArrayList<userDTO> result = new ArrayList<userDTO>();

			conn = null;
			ps = null;
			rs = null;

			try {
				conn = ds.getConnection();

				// OFFSET과 LIMIT을 사용하여 페이징 처리 및 로그인한 사용자와 관련된 정보만 조회
				String query = "SELECT * FROM reserve WHERE id = ? ORDER BY date DESC LIMIT ?, ?";
				ps = conn.prepareStatement(query);
				ps.setString(1, id);
				ps.setInt(2, offset);
				ps.setInt(3, itemsPerPage);
				rs = ps.executeQuery();

				while (rs.next()) {
					userDTO element = new userDTO();

					element.setDate(rs.getString("date"));
					element.setService(rs.getString("service"));
					element.setTime(rs.getString("time"));
					element.setGrooming(rs.getString("grooming"));
					element.setPet(rs.getString("pet"));
					element.setCost(rs.getString("cost"));

					result.add(element);
				}
			} catch (Exception e) {
				System.out.println("SELECT(페이징) 쿼리 수행 실패");
				e.printStackTrace();
			} finally {
				try {
					conn.close();
					ps.close();
					rs.close();
				} catch (Exception e) {
					System.out.println("객체 닫기 실패");
					e.printStackTrace();
				}
			}

			return result;
		}

		// 추가: 전체 항목 수를 반환하는 메서드
		public int getTotalItems(String id) {
		    int totalItems = 0;

		    conn = null;
		    ps = null;
		    rs = null;

		    try {
		    	// Connection 획득
	            Context context = new InitialContext();
	            DataSource ds = (DataSource) context.lookup("java:comp/env/jdbc/mysql");
		        conn = ds.getConnection();

		        // COUNT를 사용하여 특정 사용자의 예약 행 수를 가져옴
		        String query = "SELECT COUNT(*) FROM reserve WHERE id = ?";
	            ps = conn.prepareStatement(query);
	            ps.setString(1, id);
	            rs = ps.executeQuery();

		        if (rs.next()) {
		            totalItems = rs.getInt(1); // 첫 번째 컬럼의 값을 가져옴
		        }
		    } catch (Exception e) {
		        System.out.println("SELECT COUNT 쿼리 수행 실패");
		        e.printStackTrace();
		    } finally {
		        try {
		            conn.close();
		            ps.close();
		            rs.close();
		        } catch (Exception e) {
		            System.out.println("객체 닫기 실패");
		            e.printStackTrace();
		        }
		    }

		    return totalItems;
		}
		
	// 비밀번호 가져오기
	public String getPasswordForUser(String id) {
		conn = null;
		ps = null;
		rs = null;
		String password = null;

		try {
			conn = ds.getConnection();

			String query = "SELECT pw FROM user WHERE id = ?";
			ps = conn.prepareStatement(query);
			ps.setString(1, id);
			rs = ps.executeQuery();

			if (rs.next()) {
				password = rs.getString("pw");
			}
		} catch (Exception e) {
			System.out.println("비밀번호 가져오기 실패");
			e.printStackTrace();
		} finally {
			try {
				conn.close();
				ps.close();
				rs.close();
			} catch (Exception e) {
				System.out.println("객체 닫기 실패");
				e.printStackTrace();
			}
		}

		return password;
	}

	// 회원정보 출력
	public ArrayList<userDTO> selectUserInfo(String userId) {
		// 결과값 담을 배열
		ArrayList<userDTO> result = new ArrayList<userDTO>();
		ps = null;
		conn = null;
		rs = null;

		try {
			conn = ds.getConnection();

			String query = "SELECT * FROM user WHERE id = ?";
			ps = conn.prepareStatement(query);
			ps.setString(1, userId);
			rs = ps.executeQuery();

			while (rs.next()) { // rs.next() :: 결과값 하나씩 확인하며 돈다
				userDTO element = new userDTO();

				element.setName(rs.getString("name"));
				element.setId(rs.getString("id"));
				element.setPw(rs.getString("pw"));
				// email 값을 분리
				String email = rs.getString("email");
				String[] emailArray = email.split("@");
				element.setEmail1(emailArray[0]);
				element.setEmail2(emailArray[1]);
				// addr 값을 분리
				String addr = rs.getString("addr");
				String[] addrArray = addr.split("/");
				element.setAddr1(addrArray[0]);
				element.setAddr2(addrArray[1]);
				element.setAddr3(addrArray[2]);
				element.setAddr4(addrArray[3]);
				element.setBirth(rs.getString("birth"));
				// mobile 값을 분리
				String mobile = rs.getString("mobile");
				String[] mobileArray = mobile.split("-");
				element.setMobile1(mobileArray[0]);
				element.setMobile2(mobileArray[1]);
				element.setMobile3(mobileArray[2]);
				// element 객체에 데이터 한 묶음씩 저장
				result.add(element);
			}
		} catch (Exception e) {
			System.out.println("SELECT 쿼리 수행 실패");
			e.printStackTrace();
		} finally {
			try {
				if (rs != null) {
					rs.close();
				}
				if (ps != null) {
					ps.close();
				}
				if (conn != null) {
					conn.close();
				}
			} catch (SQLException e) {
				System.out.println("객체 닫기 실패");
				e.printStackTrace();
			}
		}
		return result;
	}

	// 사용자 정보 업데이트 메서드
	public void updateUserInfo(String name, String userid, String pw, String email, String addr, String birth,
			String mobile) {
		conn = null;
		ps = null;

		try {
			conn = ds.getConnection();

			// 사용자 정보 업데이트 SQL 쿼리
			String query = "UPDATE user SET name=?, pw=?, " + "email=?, addr=?, birth=?, mobile=? WHERE id=?";

			ps = conn.prepareStatement(query);
			ps.setString(1, name);
			ps.setString(2, pw);
			ps.setString(3, email);
			ps.setString(4, addr);
			ps.setString(5, birth);
			ps.setString(6, mobile);
			ps.setString(7, userid);
			ps.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			// 리소스 해제
			if (ps != null) {
				try {
					ps.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			if (conn != null) {
				try {
					conn.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}
	}
}
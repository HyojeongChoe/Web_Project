package com.kb.petcare.Controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kb.petcare.Session.sessionManager;
import com.kb.petcare.DAO.userDAO;

/**
 * Servlet implementation class PasswordCheckServlet
 */
@WebServlet("/passwordCheckServlet")
public class PasswordCheckServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public PasswordCheckServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/plain");
		
		PrintWriter out = response.getWriter();
		userDAO dao = new userDAO();
		
		// 입력된 비밀번호
		String enteredPassword = request.getParameter("input_pw");
		
		// 로그인한 사용자의 아이디 가져오기
		String loggedInUserId = sessionManager.getLoggedInUserId(request);
		
		// 데이터베이스에서 저장된 비밀번호 가져오기
		String storedPassword = dao.getPasswordForUser(loggedInUserId);

		// 비밀번호 비교
		if (enteredPassword.equals(storedPassword)) {
			out.print("success"); // 비밀번호 일치
		} else {
			out.print("fail"); // 비밀번호 불일치
		}
	}

}

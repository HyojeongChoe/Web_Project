package com.kb.petcare.Command;

import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kb.petcare.DAO.userDAO;
import com.kb.petcare.DTO.userDTO;
import com.kb.petcare.Session.sessionManager;

public class userServiceLogin implements userService {

	public ArrayList<userDTO> execute(HttpServletRequest request, HttpServletResponse response) {
		ArrayList<userDTO> dto = null;

		userDAO dao = new userDAO();
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		boolean tf = dao.userLogin(id, pw);

		System.out.println("로그인 테스트 결과: ");
		if (tf) { // tf==true
			try {
				System.out.println("성공");
				// 사용자 ID를 세션에 저장합니다.
				sessionManager.setLoggedInUserId(request, id);
				// 세션 조작 코드를 실행한 후에 리다이렉트를 수행합니다.
				response.sendRedirect("index.jsp");

			} catch (Exception e) {
				e.printStackTrace();
			}
		} else {
			System.out.println("실패");
			System.out.println("로그인 세션 저장 실패");
			try {
				// 실패 시 리다이렉트
				response.sendRedirect("Login.jsp");

			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return dto;
	}
}

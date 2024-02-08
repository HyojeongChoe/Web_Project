package com.kb.petcare.Command;

import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kb.petcare.DAO.userDAO;
import com.kb.petcare.DTO.userDTO;
import com.kb.petcare.Session.sessionManager;

public class userServiceDelete implements userService {

	@Override
	public ArrayList<userDTO> execute(HttpServletRequest request, HttpServletResponse response) {
		ArrayList<userDTO> dto = null;
		response.setContentType("text/html;charset=UTF-8");
		try {
			userDAO dao = new userDAO();
			// 입력한 비밀번호 가져오기
			String enteredPassword = request.getParameter("input_pw");
			// 로그인한 사용자의 아이디 가져오기
			String loggedInUserId = sessionManager.getLoggedInUserId(request);
			// 데이터베이스에서 저장된 비밀번호 가져오기
			String storedPassword = dao.getPasswordForUser(loggedInUserId);

			// 비밀번호 비교
			if (enteredPassword.equals(storedPassword)) {
				// delete query구문 수행
				dao.userDelete(loggedInUserId);
				// 세션을 무효화하여 세션에 저장된 모든 데이터를 삭제
				sessionManager.invalidateSession(request);

				response.sendRedirect("index.jsp");
			} else {
				 response.sendRedirect("MyPageDelete.jsp"); 
				// 비밀번호가 일치하지 않을 때, 메시지를 띄우고 MyPageDelete.jsp에 머무름
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dto;
	}
}
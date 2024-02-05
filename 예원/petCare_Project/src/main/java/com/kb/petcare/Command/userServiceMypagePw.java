package com.kb.petcare.Command;

import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kb.petcare.DAO.userDAO;
import com.kb.petcare.DTO.userDTO;
import com.kb.petcare.Session.sessionManager;

public class userServiceMypagePw implements userService {

	@Override
	public ArrayList<userDTO> execute(HttpServletRequest request, HttpServletResponse response) {
		ArrayList<userDTO> dto = null;

		try {
			// 입력한 비밀번호 가져오기
			String enteredPassword = request.getParameter("input_pw");
			System.out.println("마이페이지 입력비밀번호" + enteredPassword);
			// 로그인한 사용자의 아이디 가져오기
			String loggedInUserId = sessionManager.getLoggedInUserId(request);
			System.out.println("마이페이지아이디:" + loggedInUserId);
			// userDAO 객체 생성
			userDAO dao = new userDAO();

			// 데이터베이스에서 저장된 비밀번호 가져오기
			String storedPassword = dao.getPasswordForUser(loggedInUserId);

			// 비밀번호 비교
			if (enteredPassword.equals(storedPassword)) {
				// 비밀번호 일치 시 MyPageEdit.jsp로 이동
				// redirect를 사용하여 selectuserinfo.do로 이동
				System.out.println("Redirecting to selectuserinfo.do"); // 추가
				response.sendRedirect("selectuserinfo.do");
			} else {
				// 비밀번호 불일치 시 현재 페이지에 남도록 forward
				RequestDispatcher dispatcher = request.getRequestDispatcher("MyPagePw.jsp");
				dispatcher.forward(request, response);
			}
		} catch (Exception e) {
			e.printStackTrace(); // 실제 서비스에서는 로그 또는 적절한 예외 처리를 수행해야 합니다.
		}
		return dto;
	}
}
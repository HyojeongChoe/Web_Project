package com.kb.petcare.Command;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kb.petcare.DAO.userDAO;
import com.kb.petcare.DTO.userDTO;

public class userServiceSelectPrivacy implements userService {
	@Override
	public ArrayList<userDTO> execute(HttpServletRequest request, HttpServletResponse response) {
		ArrayList<userDTO> result = new ArrayList<userDTO>();

		// HttpSession을 사용하여 로그인된 사용자의 ID를 가져오기
		HttpSession session = request.getSession();
		String loggedInUserId = (String) session.getAttribute("loggedInUserId");

		if (loggedInUserId != null && !loggedInUserId.isEmpty()) {
			// 로그인된 사용자의 ID가 있을 경우에만 조회 수행
			userDAO dao = new userDAO();
			result = dao.userSelectPrivacy(loggedInUserId); // 수정된 메서드 사용

			// "listPrivacy"라는 이름으로 결과값 삽입
			request.setAttribute("listPrivacy", result);
		}
		return result;
	}
}

package com.kb.petcare.Command;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kb.petcare.DTO.userDTO;

public class userServiceLogout implements userService {

	@Override
	public ArrayList<userDTO> execute(HttpServletRequest request, HttpServletResponse response) {
		// 현재 세션을 가져옵니다.
		HttpSession session = request.getSession();

		// 세션에 저장된 사용자 ID를 제거합니다.
		session.removeAttribute("loggedInUserId");

		try {
			// 로그아웃 후 로그인 페이지로 리다이렉트합니다.
			response.sendRedirect("Login.html");
		} catch (Exception e) {
			e.printStackTrace();
		}

		return null;
	}

}

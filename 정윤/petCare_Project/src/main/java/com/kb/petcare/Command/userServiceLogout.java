package com.kb.petcare.Command;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kb.petcare.DTO.userDTO;
import com.kb.petcare.Session.sessionManager;

public class userServiceLogout implements userService {

	@Override
	public ArrayList<userDTO> execute(HttpServletRequest request, HttpServletResponse response) {
		
		// 세션을 무효화하여 세션에 저장된 모든 데이터를 삭제합니다.
		sessionManager.invalidateSession(request);
		
		try {
			// 로그아웃 후 index 페이지로 리다이렉트합니다.
			response.sendRedirect("index.jsp");
		} catch (Exception e) {
			e.printStackTrace();
		}

		return null;
	}

}

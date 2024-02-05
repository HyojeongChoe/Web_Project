package com.kb.petcare.Command;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kb.petcare.DAO.userDAO;
import com.kb.petcare.DTO.userDTO;
import com.kb.petcare.Session.sessionManager;

public class userServiceSelectUserInfo implements userService {
	@Override
	public ArrayList<userDTO> execute(HttpServletRequest request, HttpServletResponse response) {
		ArrayList<userDTO> result = new ArrayList<userDTO>();

		
			// 로그인한 사용자의 아이디 가져오기
			String loggedInUserId = sessionManager.getLoggedInUserId(request);
			System.out.println("개인정보아이디:" + loggedInUserId);

			if(loggedInUserId != null) {
			// userDAO 객체 생성
			userDAO dao = new userDAO();

			// 개인정보 가져오기
			result = dao.selectUserInfo(loggedInUserId);
			// 결과값을 request에 저장
			request.setAttribute("listUserInfo", result);
			}
		return result;
	}

}

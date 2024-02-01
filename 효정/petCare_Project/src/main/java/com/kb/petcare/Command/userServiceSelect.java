package com.kb.petcare.Command;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kb.petcare.DAO.userDAO;
import com.kb.petcare.DTO.userDTO;

public class userServiceSelect implements userService {
	
	@Override
	public ArrayList<userDTO> execute(HttpServletRequest request, HttpServletResponse response) {
		ArrayList<userDTO> result = new ArrayList<userDTO>();
		
		// DB 연동
		userDAO dao = new userDAO();
		result = dao.userSelect();
		
		request.setAttribute("list", result);	// "list"라는 이름으로 결과값 삽입
		
		return result;		
	}

}

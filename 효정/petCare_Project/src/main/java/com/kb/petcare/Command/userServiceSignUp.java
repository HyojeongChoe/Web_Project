package com.kb.petcare.Command;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kb.petcare.DAO.userDAO;
import com.kb.petcare.DTO.userDTO;

public class userServiceSignUp implements userService {

	@Override
	public ArrayList<userDTO> execute(HttpServletRequest request, HttpServletResponse response) {
		ArrayList<userDTO> dto = null;

		// DAO에 있는 insert 메소드만 수행
		userDAO dao = new userDAO();
		String name = request.getParameter("name");
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		String email1 = request.getParameter("email1");
		String email2 = request.getParameter("email2");
		String email = email1 + email2;	//위의 입력받은 email 더하기
		String addr = request.getParameter("addr");
		String birth = request.getParameter("birth");
		String pet = request.getParameter("pet");
		
		dao.userInsert(name, id, pw, email1, email2, addr, birth, pet);
		
		return dto;
	}
}

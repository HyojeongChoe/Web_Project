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
		String email = String.format("%s@%s", 
				request.getParameter("email1"), 
				request.getParameter("email2"));
		String addr = String.format("%s/%s/%s/%s",
				request.getParameter("addr2"),
				request.getParameter("addr3"),
				request.getParameter("addr4"),
				request.getParameter("addr1"));
		String birth = request.getParameter("birth");
		String pet = request.getParameter("pet");
		String mobile = String.format("%s-%s-%s", 
				request.getParameter("mobile1"),
				request.getParameter("mobile2"),
				request.getParameter("mobile3"));

		dao.userInsert(name, id, pw, email, addr, birth, pet, mobile);

		return dto;
	}
}

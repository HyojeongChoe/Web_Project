package com.kb.petcare.Command;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kb.petcare.DAO.userDAO;
import com.kb.petcare.DTO.userDTO;

public class userServiceSelect implements userService, paginationService {

	@Override
	public ArrayList<userDTO> execute(HttpServletRequest request, HttpServletResponse response) {
		ArrayList<userDTO> result = new ArrayList<userDTO>();

		// id값은 세션에서 받아옴
		HttpSession session = request.getSession();
		String userId = (String) session.getAttribute("loggedInUserId");

		// DB 연동
		userDAO dao = new userDAO();
		result = dao.userSelect();

		request.setAttribute("list", result); // "list"라는 이름으로 결과값 삽입

		return result;
	}

	// 추가: 페이징을 위한 메서드
	@Override
	public ArrayList<userDTO> executePaging(HttpServletRequest request, HttpServletResponse response, int offset,
			int itemsPerPage) {
		userDAO dao = new userDAO();
		return dao.userSelectPaging(offset, itemsPerPage);
	}

	// 추가: 전체 항목 수를 반환하는 메서드
	@Override
	public int getTotalItems() {
		userDAO dao = new userDAO();
		return dao.getTotalItems();
	}
}

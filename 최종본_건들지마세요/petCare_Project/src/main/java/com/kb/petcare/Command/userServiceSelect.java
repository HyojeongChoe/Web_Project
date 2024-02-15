package com.kb.petcare.Command;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kb.petcare.DAO.userDAO;
import com.kb.petcare.DTO.userDTO;

public class userServiceSelect implements userService, paginationService {
	// 페이징을 위한 메서드 (로그인한 사용자와 관련된 정보만을 가져오도록 수정)
	@Override
	public ArrayList<userDTO> executePaging(HttpServletRequest request, HttpServletResponse response) {
		// 페이지 번호 가져오기
		String pageStr = request.getParameter("page");
		// 삼항 연산자 :: 페이지 번호 설정 (값이 없으면 기본으로 1페이지)
		int page = (pageStr != null) ? Integer.parseInt(pageStr) : 1;

		// 페이지당 보여줄 항목(행) 수 설정
		int itemsPerPage = 10;	

		// 로그인한 사용자의 ID를 세션에서 가져오기
		HttpSession session = request.getSession();
		String userId = (String) session.getAttribute("loggedInUserId");
		
		int totalItems = getTotalItems(userId);
		int totalPages = getTotalPages(totalItems,itemsPerPage);
		int offset = (page - 1) * itemsPerPage;

		if (userId != null) {
			// 로그인한 사용자와 관련된 예약 내역만 조회
			userDAO dao = new userDAO();
			ArrayList<userDTO> result = dao.userSelectPaging(userId, offset, itemsPerPage);

			// request 객체의 속성에 결과값과 페이징 정보를 삽입
			request.setAttribute("list", result);
			request.setAttribute("currentPage", page);
			request.setAttribute("totalPages", totalPages);

			return result;
		} else {
			// 로그인한 사용자가 없다면 빈 리스트 반환
			return new ArrayList<userDTO>();
		}
	}

	// 전체 항목 수를 반환하는 메서드
	@Override
	public int getTotalItems(String id) {
		userDAO dao = new userDAO();
		return dao.getTotalItems(id);
	}

	// 전체 항목 수(totalItems)와 페이지당 보여줄 항목 수(itemsPerPage)를 기반으로 총 페이지 수를 계산
	@Override
	public int getTotalPages(int totalItems, int itemsPerPage) {
		return (int) Math.ceil((double) totalItems / itemsPerPage);
		// 총 페이지 수 = 전체 항목 수 ÷ 페이지당 보여줄 항목 수
		// Math.ceil 함수 :: 주어진 숫자 이상의 가장 작은 정수를 반환
		// 소수점 아래가 있을 경우에도 올림을 수행하여 정확한 페이지 수를 얻을 수 있다
	}
	
	@Override
	public ArrayList<userDTO> execute(HttpServletRequest request, HttpServletResponse response) {
		ArrayList<userDTO> result = new ArrayList<userDTO>();
		
		// 1. 로그인한 사용자의 ID를 세션에서 가져오기
		HttpSession session = request.getSession();
		String userId = (String) session.getAttribute("loggedInUserId");
		// 2. DB 연동
		userDAO dao = new userDAO();
		// 3. 해당 사용자와 관련된 예약 내역만 조회
		result = dao.userSelect(userId);
		request.setAttribute("list", result); // "list"라는 이름으로 결과값 삽입
		return result;
	}
}

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

	// 페이징을 위한 메서드 (로그인한 사용자와 관련된 정보만을 가져오도록 수정)
	@Override
	public ArrayList<userDTO> executePaging(HttpServletRequest request, HttpServletResponse response, int offset,
			int itemsPerPage) {
		userDAO dao = new userDAO();

        // 로그인한 사용자의 ID를 세션에서 가져오기
        HttpSession session = request.getSession();
        String userId = (String) session.getAttribute("loggedInUserId");

        if (userId != null) {
            // 로그인한 사용자와 관련된 예약 내역만 조회
            ArrayList<userDTO> result = dao.userSelectPaging(userId, offset, itemsPerPage);

            // 추가: 전체 항목 수 계산
            int totalItems = getTotalItems(userId);

            // request 객체에 결과값과 페이징 정보 등을 속성으로 추가
            request.setAttribute("list", result);
            request.setAttribute("currentPage", offset / itemsPerPage + 1);
            request.setAttribute("totalPages", (int) Math.ceil((double) totalItems / itemsPerPage));

            return result;
        } else {
            // 로그인한 사용자가 없다면 빈 리스트 반환
            return new ArrayList<userDTO>();
        }
	}
	// 추가: 전체 항목 수를 반환하는 메서드
	@Override
	public int getTotalItems(String id) {
		userDAO dao = new userDAO();
		return dao.getTotalItems(id);
	}
	
	@Override
    public int getTotalPages(int totalItems, int itemsPerPage) {
        return (int) Math.ceil((double) totalItems / itemsPerPage);
    }
}

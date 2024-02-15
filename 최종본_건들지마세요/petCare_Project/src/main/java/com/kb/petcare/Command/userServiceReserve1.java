package com.kb.petcare.Command;

import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kb.petcare.DAO.userDAO;
import com.kb.petcare.DTO.userDTO;

public class userServiceReserve1 implements userService {
	@Override
	public ArrayList<userDTO> execute(HttpServletRequest request, HttpServletResponse response) {
		ArrayList<userDTO> dto = new ArrayList<>();

		// 입력 값 받아오기
		// id값은 세션에서 받아옴
		HttpSession session = request.getSession();
		String userId = (String) session.getAttribute("loggedInUserId");
		if (userId == null) { // 로그인되지 않은 경우
			try {
				response.setContentType("text/html;charset=UTF-8");
				PrintWriter out = response.getWriter();
				out.println("<script>");
				out.println("alert('로그인이 필요한 서비스입니다.');");
				out.println("location.href='Login.jsp';"); 
				out.println("</script>");
				return dto;
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		String service = request.getParameter("service");
		String time = request.getParameter("time");
		String pet = request.getParameter("pet");
		String date = request.getParameter("date");
		String message = request.getParameter("message");
		String cost = request.getParameter("selectedPrice");

		userDAO dao = new userDAO();
		dao.reserveCare(userId, service, time, pet, date, message, cost);

		// 예약 완료 안내문 출력
		try {
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out = response.getWriter();;
			out.println("<script>");
			out.println("alert('예약이 완료되었습니다.');");
			out.println("location.href='Service.jsp';"); 
			out.println("</script>");
		} catch (Exception e) {
			e.printStackTrace();
		}

		return dto;
	}
}

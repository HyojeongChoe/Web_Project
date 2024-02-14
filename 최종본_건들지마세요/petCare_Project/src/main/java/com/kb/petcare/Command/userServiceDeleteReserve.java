package com.kb.petcare.Command;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.kb.petcare.DAO.userDAO;
import com.kb.petcare.DTO.userDTO;

public class userServiceDeleteReserve implements userService {
	@Override
	public ArrayList<userDTO> execute(HttpServletRequest request, HttpServletResponse response) {
		ArrayList<userDTO> dto = null;

		try {
			// Request Body에서 JSON 데이터 읽기
			ObjectMapper objectMapper = new ObjectMapper();
			userDTO[] reservationsArray = objectMapper.readValue(request.getReader(), userDTO[].class);
			// 각 예약 삭제 처리
			for (userDTO reservation : reservationsArray) {
				String date = reservation.getDate();
				String service = reservation.getService();
				String time = reservation.getTime();
				String grooming = reservation.getGrooming();
				String pet = reservation.getPet();
				String cost = reservation.getCost();
				// 디버깅
				System.out.println("삭제된 내역: " + date + ", " + service + 
						", " + time + ", " + grooming + ", " + pet + ", " + cost);
				// DAO를 통해 예약 삭제
				userDAO dao = new userDAO();
				dao.userDeleteReserve(date, service, time, grooming, pet, cost);
			}
			// 예약 삭제 후 이동할 페이지
			response.sendRedirect("MyPageReserve.jsp");
			
		} catch (Exception e) {
			e.printStackTrace();
		}

		return dto;
	}

}

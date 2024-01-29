package com.kb.petcare.Command;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kb.petcare.DAO.userDAO;
import com.kb.petcare.DTO.userDTO;

public class userServiceFindPw implements userService {
	@Override
    public ArrayList<userDTO> execute(HttpServletRequest request, HttpServletResponse response) {
        ArrayList<userDTO> dto = new ArrayList<>();

        // 입력 값 받아오기
        String id = request.getParameter("id");
        String name = request.getParameter("name");
        String birth = request.getParameter("birth");
        String mobile1 = request.getParameter("mobile1");
		String mobile2 = request.getParameter("mobile2");
		String mobile3 = request.getParameter("mobile3");
		String mobile = mobile1 + mobile2 + mobile3;
		        
        // 비밀번호 찾기 결과(true/false)
		userDAO dao = new userDAO();
        boolean isFoundPw = dao.findPw(id, name, birth, mobile, request, response);
        
        // 중복 여부를 JSON 형태로 응답
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");        
        try {
        	response.getWriter().write("{\"findpw\":" + isFoundPw + "}");
        	/*
        	PrintWriter를 이용하여 클라이언트에게 JSON 형태의 응답을 보냅니다.
        	여기서 생성된 JSON은 {"duplicate":true} 또는 {"duplicate":false}와 같은 형태를 가지게 됩니다.
        	이는 중복 여부에 따라서 isDuplicate 변수가 true 또는 false로 설정되기 때문입니다.		*/
        } catch (Exception e) {
        	e.printStackTrace();
        }   
        
        // 디버깅
        System.out.println("비밀번호 찾기 결과: ");
		if (isFoundPw == true) {
			try {
				System.out.println("성공");
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else {
			System.out.println("실패");    			
		}  

        return dto;
    }
}

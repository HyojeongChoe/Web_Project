package com.kb.petcare.Command;

import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kb.petcare.DAO.userDAO;
import com.kb.petcare.DTO.userDTO;

public class userServiceFindId implements userService {
	@Override
    public ArrayList<userDTO> execute(HttpServletRequest request, HttpServletResponse response) {
        ArrayList<userDTO> dto = new ArrayList<>();

        // 입력 값 받아오기
        String name = request.getParameter("name");
        String birth = request.getParameter("birth");        
        String mobile1 = request.getParameter("mobile1");
		String mobile2 = request.getParameter("mobile2");
		String mobile3 = request.getParameter("mobile3");
		String mobile = mobile1 + mobile2 + mobile3;	

		// DAO에 있는 findId 메소드를 사용하여 아이디 찾기
        userDAO dao = new userDAO();
        String foundId = dao.findId(name, birth, mobile, request, response);
        
        // 디버깅
        System.out.println("아이디 찾기 결과: ");
        if (foundId != null) {
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

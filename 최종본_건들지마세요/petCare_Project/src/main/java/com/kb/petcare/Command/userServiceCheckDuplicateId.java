// userServiceCheckDuplicateId.java
package com.kb.petcare.Command;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kb.petcare.DAO.userDAO;
import com.kb.petcare.DTO.userDTO;

public class userServiceCheckDuplicateId implements userService {

    @Override
    public ArrayList<userDTO> execute(HttpServletRequest request, HttpServletResponse response) {
    	ArrayList<userDTO> dto = null;
    	    	
    	// DAO에 있는 checkDuplicateId 메소드를 사용하여 중복 확인
		String id = request.getParameter("id");
        userDAO dao = new userDAO();
        
        // 아이디 중복 확인(true/false)
        boolean isDuplicate = dao.checkDuplicateId(id);
        
        // 중복 여부를 JSON 형태로 응답
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");        
        try {
        	response.getWriter().write("{\"duplicate\":" + isDuplicate + "}");
        	/*
        	PrintWriter를 이용하여 클라이언트에게 JSON 형태의 응답을 보냅니다.
        	여기서 생성된 JSON은 {"duplicate":true} 또는 {"duplicate":false}와 같은 형태를 가지게 됩니다.
        	이는 중복 여부에 따라서 isDuplicate 변수가 true 또는 false로 설정되기 때문입니다.		*/
        } catch (Exception e) {
        	e.printStackTrace();
        }        
        
        // 디버깅
        System.out.println("아이디 중복확인 결과: ");
		if (isDuplicate == true) {
			try {
				System.out.println("사용 불가능");
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else {
			System.out.println("사용 가능");    			
		}		
		
		return dto;	    	
    }
}

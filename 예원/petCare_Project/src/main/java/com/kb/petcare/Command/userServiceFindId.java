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
        String mobile = String.format("%s-%s-%s", 
				request.getParameter("mobile1"),
				request.getParameter("mobile2"),
				request.getParameter("mobile3"));

		// DAO에 있는 findId 메소드를 사용하여 아이디 찾기
        userDAO dao = new userDAO();
        String foundId = dao.findId(name, birth, mobile, request, response);
        
        try {
        	response.setContentType("text/html;charset=UTF-8");
            PrintWriter out = response.getWriter();
            //out.println("<script>alert('회원님의 아이디는 " + foundId + "입니다.');</script>");
            out.println("<script>");
            out.println("alert('회원님의 아이디는 " + foundId + "입니다.');");
            out.println("window.close();");
            out.println("</script>");
        
        } catch (Exception e) {
        	e.printStackTrace();
        }        
        
        // 디버깅
        System.out.println("아이디 찾기 결과: ");
        if (foundId != null) {
            try {
                System.out.println("성공: " + foundId);
            } catch (Exception e) {
                e.printStackTrace();
            }
        } else {
            System.out.println("실패");                
        }   

        return dto;
    }
}

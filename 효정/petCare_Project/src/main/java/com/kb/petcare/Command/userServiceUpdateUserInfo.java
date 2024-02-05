package com.kb.petcare.Command;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kb.petcare.DAO.userDAO;
import com.kb.petcare.DTO.userDTO;

public class userServiceUpdateUserInfo implements userService {

	@Override
	public ArrayList<userDTO> execute(HttpServletRequest request, HttpServletResponse response) {
		userDAO dao = new userDAO();
		String upName = request.getParameter("name");
		String Id = request.getParameter("id");
		String upPw = request.getParameter("pw");
		String upEmail = String.format("%s@%s", 
				request.getParameter("email1"), 
				request.getParameter("email2"));
		String upAddr = String.format("%s/%s/%s/%s",
				request.getParameter("addr2"),
				request.getParameter("addr3"),
				request.getParameter("addr4"),
				request.getParameter("addr1"));
		String upBirth = request.getParameter("birth");
		String upMobile = String.format("%s-%s-%s", 
				request.getParameter("mobile1"),
				request.getParameter("mobile2"),
				request.getParameter("mobile3"));

		 // 사용자 정보 업데이트
	    dao.updateUserInfo(upName, Id, upPw, upEmail, upAddr, upBirth, upMobile);

	    // 업데이트된 정보를 다시 가져와서 반환
	    ArrayList<userDTO> updatedUserInfo = dao.selectUserInfo(Id);

	    return updatedUserInfo;
	}
}

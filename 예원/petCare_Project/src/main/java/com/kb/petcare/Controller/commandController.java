package com.kb.petcare.Controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kb.petcare.Command.userService;
import com.kb.petcare.Command.userServiceCheckDuplicateId;
import com.kb.petcare.Command.userServiceFindId;
import com.kb.petcare.Command.userServiceFindPw;
import com.kb.petcare.Command.userServiceLogin;
import com.kb.petcare.Command.userServiceSignUp;
import com.kb.petcare.DTO.userDTO;

/**
 * Servlet implementation class commandController
 */
@WebServlet("*.do")
public class commandController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public commandController() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doAction(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doAction(request, response);
	}

	protected void doAction(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String uri = request.getRequestURI(); // 사용자가 불러온 링크를 반환 ex)/20040117_JSP/insert.do
		String conPath = request.getContextPath(); // 프로젝트명 반환
		String command = uri.substring(conPath.length()); // insert.do, delete.do ... 형식으로 command에 저장

		userService uService = null; // 객체생성
		
		if (command.equals("/signup.do")) {
			System.out.println("<회원가입>을 수행합니다.");
			uService = new userServiceSignUp();
			uService.execute(request, response);
			response.sendRedirect("Login.html"); // 회원가입 성공하면 로그인 페이지로 가기
			
		} else if (command.equals("/login.do")) {
			System.out.println("<로그인 테스트> 수행");
			uService = new userServiceLogin();
			uService.execute(request, response);

	        // 로그인 후 세션에 저장된 사용자 ID 확인
	        HttpSession session = request.getSession();
	        String loggedInUserId = (String) session.getAttribute("loggedInUserId");
	        if (loggedInUserId != null) {
	            System.out.println("로그인한 사용자 ID: " + loggedInUserId);
	        } else {
	            System.out.println("로그인한 사용자 ID가 세션에 없습니다.");
	        }			
		}
		else if (command.equals("/checkDuplicateId.do")) {
			System.out.println("<아이디 중복확인> 수행");
			uService = new userServiceCheckDuplicateId();
			uService.execute(request, response);
		}
		else if (command.equals("/findId.do")) {
		    System.out.println("<아이디 찾기> 수행");
		    uService = new userServiceFindId();
		    uService.execute(request, response);
		    		    
		    RequestDispatcher rd = request.getRequestDispatcher("/FindGetId.jsp");
		    rd.forward(request, response);
		}
		else if (command.equals("/findPw.do")) {
		    System.out.println("<비밀번호 찾기> 수행");
		    uService = new userServiceFindPw();
		    uService.execute(request, response);
		    RequestDispatcher rd = request.getRequestDispatcher("/FindGetPw.jsp");
		    rd.forward(request, response);
		}
		
		
		// ArrayList<userDTO> result = uService.execute(request, response);
	}

}

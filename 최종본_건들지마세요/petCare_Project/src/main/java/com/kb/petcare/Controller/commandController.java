package com.kb.petcare.Controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kb.petcare.Command.paginationService;
import com.kb.petcare.Command.userService;
import com.kb.petcare.Command.userServiceCheckDuplicateId;
import com.kb.petcare.Command.userServiceDelete;
import com.kb.petcare.Command.userServiceDeleteReserve;
import com.kb.petcare.Command.userServiceFindId;
import com.kb.petcare.Command.userServiceFindPw;
import com.kb.petcare.Command.userServiceLogin;
import com.kb.petcare.Command.userServiceLogout;
import com.kb.petcare.Command.userServiceMypagePw;
import com.kb.petcare.Command.userServiceReserve1;
import com.kb.petcare.Command.userServiceReserve2;
import com.kb.petcare.Command.userServiceSelect;
import com.kb.petcare.Command.userServiceSelectUserInfo;
import com.kb.petcare.Command.userServiceSignUp;
import com.kb.petcare.Command.userServiceUpdateUserInfo;
import com.kb.petcare.DAO.userDAO;
import com.kb.petcare.DTO.userDTO;
import com.kb.petcare.Session.sessionManager;

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
		paginationService pService = null;

		if (command.equals("/signup.do")) {
			System.out.println("<회원가입>을 수행합니다.");
			uService = new userServiceSignUp();
			response.sendRedirect("Login.jsp"); // 회원가입 성공하면 로그인 페이지로 가기
		} else if (command.equals("/login.do")) {
			System.out.println("<로그인 테스트> 수행");
			uService = new userServiceLogin();
		} else if (command.equals("/logout.do")) {
			System.out.println("<로그아웃 테스트> 수행");
			uService = new userServiceLogout();
		} else if (command.equals("/checkDuplicateId.do")) {
			System.out.println("<아이디 중복확인> 수행");
			uService = new userServiceCheckDuplicateId();
		} else if (command.equals("/findId.do")) {
			System.out.println("<아이디 찾기> 수행");
			uService = new userServiceFindId();
		} else if (command.equals("/findPw.do")) {
			System.out.println("<비밀번호 찾기> 수행");
			uService = new userServiceFindPw();
		} else if (command.equals("/mypagecheckpw.do")) {
			System.out.println("<마이페이지 비밀번호확인> 수행");
			uService = new userServiceMypagePw();
		}else if (command.equals("/selectuserinfo.do")) {
			System.out.println("<개인정보>를 출력합니다.");
			uService = new userServiceSelectUserInfo();

			ArrayList<userDTO> result = uService.execute(request, response);

			if (result != null) {
				RequestDispatcher dis = request.getRequestDispatcher("/MyPageEdit.jsp");
				dis.forward(request, response);
			}
			return;
		} else if (command.equals("/updateuserinfo.do")) {
			System.out.println("<개인정보 수정> 수행");
			uService = new userServiceUpdateUserInfo();
			uService.execute(request, response);
			
			// 업데이트 후 새로운 정보를 포함하는 페이지로 이동
			RequestDispatcher dispatcher = request.getRequestDispatcher("MyPageEdit.jsp");
			dispatcher.forward(request, response);
			return;
		} else if(command.equals("/delete.do")) {//회원 삭제 요청할 시
			System.out.println("<회원 삭제>를 수행합니다.");
			uService = new userServiceDelete();
		}else if (command.equals("/reserve1.do")) {
			System.out.println("<예약하기> 수행");
			uService = new userServiceReserve1();
		} else if (command.equals("/reserve2.do")) {
			System.out.println("<예약하기> 수행");
			uService = new userServiceReserve2();
		} else if (command.equals("/select.do")) {
			System.out.println("<예약내역 출력>을 수행합니다.");
			uService = new userServiceSelect();
			
			// 페이지 번호를 가져오기
			String pageStr = request.getParameter("page");
			// 삼항 연산자 :: 페이지 번호 설정 (값이 없으면 기본으로 1페이지)
			int page = (pageStr != null) ? Integer.parseInt(pageStr) : 1;
			// 페이지당 보여줄 항목 수 설정
			int itemsPerPage = 10;
			// 페이징 처리를 위한 데이터를 가져오기
			pService = (paginationService) uService;
			// 전체 항목 수를 로그인한 사용자의 ID를 기반으로 가져옴
			HttpSession session = request.getSession();
			String userId = (String) session.getAttribute("loggedInUserId");
			int totalItems = pService.getTotalItems(userId);
			// 페이징 처리를 위해 필요한 데이터 설정
			int totalPages = (int) Math.ceil((double) totalItems / itemsPerPage);
			int offset = (page - 1) * itemsPerPage;
			// 예약내역 가져오기 :: select.do(예약내역 출력)가 실행될 때는, result로 실질적인 값이 반환될 것
			ArrayList<userDTO> result = pService.executePaging(request, response, offset, itemsPerPage);
			if (result != null) { // 결과값이 null이 아닐 경우
				// request 객체에 결과값과 페이징 정보 등을 속성으로 추가
				request.setAttribute("list", result);
				request.setAttribute("currentPage", page);
				request.setAttribute("totalPages", totalPages);
				// View 역할(RequestDispatcher 사용) :: MyPageReserve.jsp로 결과값과 함께 이동
				RequestDispatcher dis = request.getRequestDispatcher("/MyPageReserve.jsp");
				dis.forward(request, response);
			}
			return;
		}
		else if (command.equals("/deleteReserve.do")) {
		    System.out.println("<예약내역 삭제>를 수행합니다.");
		    uService = new userServiceDeleteReserve();
		}
		uService.execute(request, response);

		// ArrayList<userDTO> result = uService.execute(request, response);
	}
}

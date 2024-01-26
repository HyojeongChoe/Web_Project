package com.kb.petcare.Session;
// SessionManager.java

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

public class sessionManager {

	// 세션에 속성 추가
	public static void setSessionAttribute(HttpServletRequest request, String attributeName, Object attributeValue) {
		HttpSession session = request.getSession();
		session.setAttribute(attributeName, attributeValue);
	}

	// 세션에서 속성 가져오기
	public static Object getSessionAttribute(HttpServletRequest request, String attributeName) {
		HttpSession session = request.getSession();
		return session.getAttribute(attributeName);
	}

	// 세션에서 속성 삭제
	public static void removeSessionAttribute(HttpServletRequest request, String attributeName) {
		HttpSession session = request.getSession();
		session.removeAttribute(attributeName);
	}
}

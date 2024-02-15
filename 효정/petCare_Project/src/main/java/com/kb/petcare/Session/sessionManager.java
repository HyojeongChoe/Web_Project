package com.kb.petcare.Session;
// SessionManager.java

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

public class sessionManager {
    public static void setLoggedInUserId(HttpServletRequest request, String userId) {
        HttpSession session = request.getSession();
        System.out.println("Setting loggedInUserId: " + userId);
        session.setAttribute("loggedInUserId", userId);
    }

    public static String getLoggedInUserId(HttpServletRequest request) {
        HttpSession session = request.getSession();
        String userId = (String) session.getAttribute("loggedInUserId");
        System.out.println("Getting loggedInUserId: " + userId);
        return userId;
    }

    public static void invalidateSession(HttpServletRequest request) {
        HttpSession session = request.getSession();
        System.out.println("Invalidating session");
        session.invalidate();
    }
}



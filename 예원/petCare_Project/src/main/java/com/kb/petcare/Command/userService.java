package com.kb.petcare.Command;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kb.petcare.DTO.*;

public interface userService {
	public ArrayList<userDTO> execute (HttpServletRequest request, HttpServletResponse response);
		//추상클래스 생성
}

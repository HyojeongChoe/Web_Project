package com.kb.petcare.Command;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kb.petcare.DTO.*;

public interface paginationService {
	// 페이징을 위한 메서드
    public ArrayList<userDTO> executePaging(HttpServletRequest request, HttpServletResponse response);

    // 전체 항목 수를 반환하는 메서드
    public int getTotalItems(String id);
    
    public int getTotalPages(int totalItems, int itemsPerPage);
}

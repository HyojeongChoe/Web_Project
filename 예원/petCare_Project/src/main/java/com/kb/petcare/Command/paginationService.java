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
    
    // 전체 항목 수와 페이지당 보여줄 항목 수를 기반으로 총 페이지 수를 반환하는 메서드
    public int getTotalPages(int totalItems, int itemsPerPage);
}

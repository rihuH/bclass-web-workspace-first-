package com.kh.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/01.page")
public class includeForwardController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public includeForwardController() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 응답화면 지정
		request.getRequestDispatcher("/WEB-INF/views/actiontag/01_include.jsp").forward(request, response);
		// 01_include.jsp의 properties에 있는 경로를 webapp 밑에서부터 똑같이 적어주면 된다.
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}

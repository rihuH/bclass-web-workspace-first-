package com.kh.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.model.vo.Person;

@WebServlet("/core.page")
public class CoreForwardController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public CoreForwardController() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setAttribute("value1", 1);
		request.setAttribute("value2", 2);
		request.setAttribute("str", "안녕하세요");
		
		// DB 갔다왔다고 가정. 사람테이블에서 조회해옴
		List<Person> list = new ArrayList();
		list.add(new Person("콩쥐", 15, "서울"));
		list.add(new Person("팥쥐", 16, "서울"));
		list.add(new Person("홍길동", 15, "서울"));
		//DB에서 조회된 결과
		request.setAttribute("personList", list);
		
		
		
		request.getRequestDispatcher("/WEB-INF/views/CustomActiontag/core.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}

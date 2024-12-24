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

@WebServlet("/operation.do")
public class OperationServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public OperationServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// a태그로 요청이 왔기 때문에 GET방식으로 온 것이다.
		// 만약 GET으로 왔는데 doGET이 없고 doPost만 있으면 405에러가 뜬다.(GET처리할 수 없음 에러)
		
		// 연산을 할 수 있는 값 넘기기
		request.setAttribute("big", 10);
		request.setAttribute("small", 3);
		request.setAttribute("strOne", "안녕");
		request.setAttribute("strTwo", new String("안녕"));
		request.setAttribute("personOne", new Person("홍길동", 15, "한양"));
		request.setAttribute("personTwo", null);
		List<String> list1 = new ArrayList();
		request.setAttribute("listOne", list1);
		List<String> list2 = new ArrayList();
		list2.add("안녕");
		request.setAttribute("listTwo", list2);
		
		// 일단 여기까지 requestScope에 총 8개의 값을 담았음
		
		request.getRequestDispatcher("/WEB-INF/views/02_operation.jsp").forward(request, response);
						//contextroot부터 위임할 경로 정해준 다음에 포워딩
		
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}

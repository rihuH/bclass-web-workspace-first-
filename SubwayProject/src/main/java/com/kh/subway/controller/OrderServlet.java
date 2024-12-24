package com.kh.subway.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.subway.model.service.OrderService;
import com.kh.subway.model.vo.Order;

@WebServlet("/order.do")
public class OrderServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public OrderServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException { // doGet 메소드 안은 깔끔하게
		
		// 0) 요청 전송방식이 뭐지??
		// GET / POST
		// POST방식일 경우 => 인코딩
//		request.setCharacterEncoding("UTF-8");
		
		// 1) 전달값이 있는가?? => 값 뽑기 => request의 Parameter
		// request.getParameter("키값")
		// request.getParameterValues("키값")
		
		// 값을 뽑아서 변수에 대입
		// 주문자 정보
		String name = request.getParameter("userName");
		String phone = request.getParameter("phone");
		String address = request.getParameter("address");
		String message = request.getParameter("message");
		
		// 주문 정보
		String sandwich = request.getParameter("sandwich");
		// checkbox == request.getParameterValues() : String[]
		// 체크된 게 하나도 없을 때 null값
		String[] vegetables = request.getParameterValues("vegetable");
		String[] sauces = request.getParameterValues("sauce");
		String[] cookies = request.getParameterValues("cookie");
		String payment = request.getParameter("payment");
		
		// 2) 가공 -> VO클래스를 객체로 생성해서 필드에 값을 담았음.
		// VO 객체에 담기
		Order order = new Order();
		order.setName(name);
		order.setPhone(phone);
		order.setAddress(address);
		order.setRequest(message);
		order.setSandwich(sandwich);
		order.setVegetable(vegetables != null ? String.join(",", vegetables) : "선택안함");
		order.setSauce(sauces != null ? String.join(",", sauces) : "선택안함");
		order.setCookie(cookies != null ? String.join(",", cookies) : "선택안함");
		order.setPayment(payment);
		
		// 3) Services단으로 전달
		int result = new OrderService().insert(order);
		
		// 4) 응답화면 지정
		if(result > 0) {
			// 여기서 할 일은?
			
			// request의 Attribute에 담기
			request.setAttribute("order", order);
			
			// 응답 뷰 지정(위임)
			RequestDispatcher view = request.getRequestDispatcher("/views/result.jsp");
			
			view.forward(request, response);
			
			
		}
		
		// 참고 : a태그로 요청보내는 것은 get방식임
		// url을 만들 수만 있으면 form 태그나 a태그나 상관 없다
	
		
		
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}

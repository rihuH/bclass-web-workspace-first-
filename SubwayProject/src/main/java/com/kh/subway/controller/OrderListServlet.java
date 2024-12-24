package com.kh.subway.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.subway.model.service.OrderService;
import com.kh.subway.model.vo.Order;

@WebServlet("/orderList.sandwich")
public class OrderListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public OrderListServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		// GET ?? POST ?? 
		// a태그 요청 == GET방식
		
		// 요청 시 전달값이 존재하는가?
		// 1) 데이터 가공 => X
		
		// 2) Service로 요청~ (SELECT 해주라~)
		List<Order> orderList = new OrderService().findAll();
		
		request.setAttribute("list", orderList);
		
		// 조회 결과가 있는지 없는지 판단 후 메시지를 리스트 화면에 보낼 것!
		
		if(orderList.isEmpty()) { // 생성자로 생성한 리스트이므로 null인 경우는 없고, 비어있는지 판단해야함
			request.setAttribute("alertMsg", "조회 결과가 존재하지 않습니다.");
		} else {
			request.setAttribute("alertMsg", "조회 결과가 존재합니다.");
		}
		
		request.getRequestDispatcher("/views/order_list.jsp").forward(request, response);
		// jsp 명명규칙/ 파일명은 소문자로 쓰되 띄어쓰기 필요하면  _로 구분
	
	
	
	
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}

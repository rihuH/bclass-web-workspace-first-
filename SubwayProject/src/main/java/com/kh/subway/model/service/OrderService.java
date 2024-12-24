package com.kh.subway.model.service;

import java.sql.Connection;
import java.util.List;

import com.kh.subway.common.JDBCTemplate;
import com.kh.subway.model.dao.OrderDao;
import com.kh.subway.model.vo.Order;

public class OrderService {
	
	static {
		JDBCTemplate.registDriver();
	}
	
	public int insert(Order order) {
		//Service에서 할 일 ! : Connection 객체생성
		Connection conn = JDBCTemplate.getConnection();
		
		// DAO 메소드 호출
		// => Connection객체, Controller로부터 전달받은 무언가랑 같이 인자값으로 넘겨주어야함.
		int result = new OrderDao().insert(conn, order);
		
		// INSERT, UPDATE, DELETE
		// 테이블의 내용물이 바뀜 => 확정(COMMIT) / 돌아가기(ROLLBACK)
		
		if(result > 0) {
			JDBCTemplate.commit(conn);
		} else {
			
		}
		// Connection 객체 반납
		JDBCTemplate.close(conn);
		
		return result;
	}
	
	public List<Order> findAll() {
		// Connection 만들기
		Connection conn = JDBCTemplate.getConnection();
		// connection 보내는 이유 - ?????
		List<Order> orderList = new OrderDao().findAll(conn);
		
		JDBCTemplate.close(conn);
		
		return orderList;
		
	}
	

}

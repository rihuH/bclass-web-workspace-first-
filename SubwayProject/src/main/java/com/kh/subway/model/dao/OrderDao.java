package com.kh.subway.model.dao;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import com.kh.subway.common.JDBCTemplate;
import com.kh.subway.model.vo.Order;

public class OrderDao {
	
	// Properties를 생성을 해서
	private Properties prop = new Properties();
	// 호출 될 때마다 xml 을 읽어올 수 있도록
	// 기본 생성자 블록에서 xml을 파일을 입력받기
	public OrderDao() {
		// mapper파일 경로 담기
		String filePath = OrderDao.class.getResource("/sql/order-mapper.xml").getPath();
		
		try {
			prop.loadFromXML(new FileInputStream(filePath));
		} catch(IOException e) {
			e.printStackTrace();
		}
	}
	
	public int insert(Connection conn, Order order) {
		// INSERT
		PreparedStatement pstmt = null;
		int result = 0;
		
		String sql = prop.getProperty("insert");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, order.getName());
			pstmt.setString(2, order.getPhone());
			pstmt.setString(3, order.getAddress());
			pstmt.setString(4, order.getRequest());
			pstmt.setString(5, order.getSandwich());
			pstmt.setString(6, order.getVegetable());
			pstmt.setString(7, order.getSauce());
			pstmt.setString(8, order.getCookie());
			pstmt.setString(9, order.getPayment());
			
			result = pstmt.executeUpdate();
			
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(pstmt);
		}
		
		return result;
	}
	
	public List<Order> findAll(Connection conn) {
		// SELECT => Result Set => 배열/ List, Set, Map
		// 필요한 변수 세팅
		List<Order> list = new ArrayList();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("findAll");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				Order order = new Order(rset.getString("NAME"), rset.getString("PHONE"),
										rset.getString("ADDRESS"), rset.getString("REQUEST"),
										rset.getString("SANDWICH"), rset.getString("VEGETABLE"),
										rset.getString("SAUCE"), rset.getString("COOKIE"),
										rset.getString("PAYMENT"), rset.getDate("ORDER_DATE"));
				list.add(order);
				// 자바에서 제일 중요한 것은 객체지향. 그 특징을 살린 클래스기반 언어이기 때문
				// 자바 말고 프로그래밍 언어라는 개념으로 접근하면 메모리영역이 제일 중요함
				// arrayList라는 객체배열에 들어간다는 것은 주소값이 들어가는 것이고
				// 주소를 누가 가리키고 있어서 사라지지 않는 것임
			} 
			
			
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		
		return list;
		
		
	}
	

}

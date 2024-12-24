<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.kh.subway.model.vo.Order, java.util.List" %>
<%
	// .getAttribute("키값") : Object
	String alertMsg = (String)request.getAttribute("alertMsg"); // 클래스형변환
	List<Order> list = (List<Order>)request.getAttribute("list"); // ******
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문내역</title>
</head>
<body>

	<h1>샌드위치 주문내역 목록</h1>
	
	<table border="1">
		<tr>
			<th>주문자명</th>
			<th>전화번호</th>
			<th>주소</th>
			<th>요청사항</th>
			<th>샌드위치</th>
			<th>채소</th>
			<th>소스</th>
			<th>쿠키</th>
			<th>결제수단</th>
			<th>주문일자</th>
		</tr>
		
		<% if(list.isEmpty()){ %>
			<tr>
				<th colspan="10"><%=alertMsg %> </th>
			</tr>
		<% } else { %>
			<!-- 조회결과가 한 개라도 있음 -->
			<!-- 리스트를 반복하면서 요소들에 순차적으로 접근해서 HTML요소를 생성 -->
			<tr>
				<th colspan="10"><%=alertMsg %> </th>
			</tr>
			<% for(Order o : list) { %>
				<tr>
					<td><%= o.getName() %></td>
					<td><%= o.getPhone() %></td>
					<td><%= o.getAddress() %></td>
					<td><%= o.getRequest() %></td>
					<td><%= o.getSandwich() %></td>
					<td><%= o.getVegetable() %></td>
					<td><%= o.getSauce() %></td>
					<td><%= o.getCookie() %></td>
					<td><%= o.getPayment() %></td>
					<td><%= o.getOrderDate() %></td>
				</tr>
			<% } %>
		<% } %>
		
	</table>

</body>
</html>
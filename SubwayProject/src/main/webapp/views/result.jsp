<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.kh.subway.model.vo.Order" %>
<%
	// 스크립틀릿 : 자바코드를 그대로 작성(세미콜론을 포함한 완전한 형태로)
	// 포장 풀기 = > request의 Attribute
	// request.getAttribute("키값") : Object
	
	Order order = (Order)request.getAttribute("order");
	
	

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문확인 페이지</title>
</head>
<body>
	
	<h1>주문내역</h1>
	
	<%-- 출력식 : <%= %> --%>
	
	<h3>주문자 정보</h3>
	
	이름 : <%= order.getName() %> <br>
	
	전화번호 : <%= order.getPhone() %> <br>
	
	주소 : <%= order.getAddress() %> <br>
	
	요청사항 : <%= order.getRequest() %> <br>
	
	<h3>메뉴 정보</h3>
	
	샌드위치 : <%= order.getSandwich() %> <br>
	
	채소 : <%= order.getVegetable() %> <br>
	
	소스 : <%= order.getSauce() %> <br>
	
	쿠키 : <%= order.getCookie() %> <br>
	
	결제 방식 : <%= order.getPayment() %> <br>
	
	위와 같이 주문하시겠습니까? <br><br>
	
	<button>확인</button><button>취소</button>
	

</body>
</html>
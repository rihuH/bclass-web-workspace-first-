<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// 이 구문을 스크립틀릿(scriptlet)이라고 해서 자바코드를 있는 그대로 작성할 수 있는 영역
	
	// 현재 이 JSP상 필요한 데이터들 => request의 Attribute 값 뽑기
	
	// request.getAttribute("키값"); : Object
	
	String name = (String)request.getAttribute("name");
	int age = (int)request.getAttribute("age");
	String gender = (String)request.getAttribute("gender");
	String city = (String)request.getAttribute("city");
	double height = (double)request.getAttribute("height");
	String[] foods = (String[])request.getAttribute("foods");
	String msg = (String)request.getAttribute("result");
	
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- 얘는 init() destroy()는 필요 없으니까 service()부분 등만 해서 servlet으로 변환된다.
		컴파일이 된다. -->
	<h1><%= msg %></h1>
	<!-- 출력하고싶으면 스크립틀릿을 만들어준다 <%%> 그리고 변수 출력하고 싶으면 = 도 추가-->
	<h3><%= name %>님의 개인정보</h3>
	나이 : <%= age %> <br>
	키 : <%= height %> <br>
	지역 : <%=city %> <br><br>
	
	성별 : 
	<!-- 성별을 선택하지 않았을 경우 -->
	<% if(gender == null){ %> <!--  스크립틀릿 한 줄당 한 라인임. -->
		선택하지 않았습니다.<br>
	<%} else { %>
	<!-- 성별을 선택했을 경우 -->
		<% if(gender.equals("M")) { %>
			남자 입니다. <br>
		<% } else { %>
			여자 입니다. <br>
		<% } %>
	<% } %>
	
	좋아하는 음식은
	<% if(foods == null) { %>
		없습니다.
	<% } else { %>
		<ul>
		<% for(int i = 0; i < foods.length; i++) { %>
			<li><%= foods[i] %></li>
		<% } %>
		</ul>
		입니다
	<% } %>
	


	
	
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList, java.util.Date"%>
<%@ page import="java.util.List"%>
 <%-- 위와 같이 쓸 수도 있다. 여러 개 import하려면 , 로 구분하면 된다.
그런데 너무 많아지면 보기가 안 좋으므로 많은 경우 3행에 아예 새롭게 page주석을 적는 것이 일반적이다 --%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<h1>page 지시어</h1>
	<%
		// ArrayList써야지~~
		ArrayList list = new ArrayList();
	
		Date date = new Date();
	%>
	
	<%
	// 억지로 예외 발생시키기
	list.get(0);
	// 일반 사용자가 에러 화면을 보게 할 수는 없으니까
	%>

</body>
</html>
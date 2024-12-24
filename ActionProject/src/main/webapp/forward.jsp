<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<h1>핫하 나는 포워드페이지다</h1>
	
	<jsp:forward page="WEB-INF/views/actiontag/footer.jsp" />
	<!-- 이러면 footer의 값이 서블릿을 거치지 않고 나옴. url은 여기의 url인 forward가 나와있음 
	화면전환태그인 것
	http://www.localhost/action/forward.jsp 라고 URL에 찍혀있음
	jsp:forward > 화면전환태그. 서블릿을 거치지 않고 화면전환해준다.
	특징 : URL은 그대로고 화면만 바뀐다. -->
	
		
	
	
	
</body>
</html>
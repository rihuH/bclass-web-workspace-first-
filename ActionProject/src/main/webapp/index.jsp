<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>웰컴</title>
</head>
<body>

	<h1>안녕 나는 웰컴파일이야</h1>
	
	<h2> * EL(Expression Language) 표현 언어</h2>
	
	<p>
		기존에 사용 했던 출력식(표현식) &lt;%= 변수 %> <br>
		JSP상에 표현하고자 하는 값을 \${ 변수 }의 형식으로 표현해서 작성하는 것 <!-- \는 코드가 아닌 일반 문자로 사용하겠다는 의미 -->
	</p>
	
	
	<h3>1. EL구문 기본 학습</h3>
	
	<a href="/action/el.do">01_EL</a>
	<br>
	<!-- 참고로 위의 것은 절대경로방식, /로 시작하면 
	 http://서버도메인/contextroot/서블릿매핑값 이므로
	 			/ 가 서버도메인 뒤에 시작하는 것이라서, contextroot부터 작성을 해야함. -->
	
	<h3>2. EL구문을 이용해서 사용할 수 있는 연산자!</h3>
	
	<a href = "operation.do">02_EL연산자</a>
	<br><br>
	<!-- 위의 것은 상대경로방식. 이건 현재 URL의 제일 뒤에 붙은 슬래시 즉
	http://서버도메인/contextroot/서블릿매핑값
										/ 여기에 슬래시가 붙는 것이다.그래서 이렇게 쓰려면 현재 URL이 어떤지 봐야함 -->
										
	<h2>* JSP Action Tag</h2>
	<h3>1. 표준 액션 태그</h3>
	
	<a href="01.page">01_jsp:include</a>
	
	<br>
	
	<a href="forward.jsp">02_jsp:forward</a>
	
	<hr>
	
	<h3>2. Custom Action Tag</h3>
	
	<a href="jstl.page">JSTL</a>
	
	
	
	
	
	
	
	
	

</body>
</html>
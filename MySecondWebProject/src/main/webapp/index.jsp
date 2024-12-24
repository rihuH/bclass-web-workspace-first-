<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<h1>* JSP(Java Server Page)</h1>
	
	<p>
		Java Servlet 기반의 동적인 웹 페이지를 생성하는데 사용되는 기술 <br>
		작업이 끝나면 JSP 페이지가 컴파일되며 서블릿으로 변환! <br>
		이건 서버에서 동작하는 자바 문서임 <br>
		SSR (Server Side Rendering) 이라고 한다. 자바코드를 적고 html을 보낼지 말지 판단해서 출력하는 자바기술
		<br> ===> Java기술!! <br>
		JSP의 가장 큰 장점은 Controller/ View의 분리 <br>
		비즈니스 로직과 프레젠테이션 로직을 각각 구분해서 작업할 수 있음 <br>
	
	</p>
	
	<hr>
	
	<h2> *JSP 문법 </h2>
	
	<h3> 1. JSP Scripting Element</h3>
	
	<!-- 사람들이 잘 사용하진 않음 jQuery랑 비슷. 아직 사용해서 개발하고 있는 곳은 있음 -->
	
	<ol>
		<li>
			선언문 : <%! %> <br>
			변수 또는 메소드를 선언할 때 사용, 진짜 쓸 일 없음 <br>
		</li>
		<li>
			스크립틀릿 : <% %> <br>
			JSP에서 자바코드를 기술하기 위한 가장 기본적인 표현법 <br>
		</li>
		<li>
			표현식(출력식) : &lt;%= %> <br> <!-- 꺽쇠<는 문법으로 인식해서 오류. 
			화면상에는 꺽쇠를 표현해야하지만 코드로는 쓸 수 없으면 &lt; (less then) 
			>이거는 &gt;(greaterthan) -->
			자바에서 작성한 값(변수 또는 메소드)을 출력하기 위해 사용하는 문법 <br>
		</li>
	</ol>
	
	<a href="views/01_ScriptingElement.jsp">View Detail &raquo;</a>
	
	<h3>2. Directive</h3>
	
	<p>
		JSP page 전체에 영향을 미치는 정보를 기술할 때 쓰임 <br> <!-- 페이지에 대한 설정 -->
		
		[ 표현법 ]
		&lt;%@ page/ include/ taglib 속성 = "속성값" %>
	</p>
	
	<ol>
		<li>
			taglib : (tag library) JSP문법들을 조금 더 쉽고 많은 기능들을 이용할 수 있도록 
			라이브러리를 등록하는 구문 <br>
		</li>
		<li>
			page 지시어 : 현재 JSP페이지를 처리하는데 필요한 각종 속성들을 기술하는 부분 <br>
				지금도 이 페이지 맨 위에 있음. page 하고 시작함.<br>
		</li>
		<ul>
			<li>language : 사용할 언어 유형을 지정. 이미 적혀있으므로 건들 이유 없음</li>
			<li>contentType : 웹브라우저가 받아볼 페이지의 형식, 인코딩 방식 text/html</li>
			<li>pageEncoding : JSP파일에 기록하는 자바코드의 인코딩방식 UTF-8</li>
			<li>import : 자바의 import와 동일한 의미 </li>
			<li>errorPage : 해당 JSP상에서 에러가 발생했을 경우 보여줄 에러페이지의 경로</li>
			<a href="views/02_DirectivePage.jsp">View Detail &raquo;</a>
		</ul>
		<li>
			include 지시어 : JSP파일 안에 또 다른 JSP파일을 포함시키고자 할 때 사용하는 지시어<br>
			<a href="views/03_DirectiveInclude.jsp">View Detail &raquo;</a>
		</li>
	</ol>

</body>
</html>
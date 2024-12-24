<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자신과의 싸움</title>
</head>
<body>
	
	<h1>JSTL이란...?</h1>
	
	<p>
		JSP Standard Tag Library 의 약어로 JSP에서 사용할 수 있는 커스텀 액션 태그 <br>
		공통적으로 사용하는 코드들의 집합을 보다 쉽게 사용할 수 있도록 태그화해서 표준으로 제공하는 라이브러리(클래스 모음집)
	</p>
	
	<hr>
	<!-- 라이브러리는 같이 배포해야하므로 이제 WEB-INF의 lib파일에 넣어줘야함 -->
	<h3>* 라이브러리를 추가 </h3>
	<!-- 톰캣에서 taglib 다운로드 / jar파일 4개를 다 받는다 -->
	
	1) https://tomcat.apache.org/download-taglibs.cgi접속 <br>
	2) Standard-1.2.5.jar파일 4개 다 다운로드 <br>
	3) WEB-INF/lib 폴더에 추가 <br>
	
	<h4>* JSTL 선언방법 </h4>
	
	<p>
		JSTL을 사용하고자 하는 해당 JSP페이지 상단에 <br>
		taglib지시어를 사용해서 선언을 함 <br><br>
		
		[표현법] <br>
		&lt;@ taglib prefix="접두어" uri="사용하고자하는 파일상의 uri주소"> i는 indentified의미로 식별하는 문자열이라는 의미다.
	</p>
	
	<hr>
	
	<h3>* JSTL 분류</h3>
	
	<h4>1. ☆★☆★JSTL Core Library ☆★☆★☆★☆★☆★</h4>
	
	<p>
		변수와 조건문, 반복문 등의 로직과 관련된 문법 제공
	</p>
	
	<a href="core.page">core</a>
	
	<!-- 아래에서부턴 알면좋고 아님말고 -->
	
	<br>
	
	<h4>2. JSTL Formatting Library</h4>
	
	<p>
		숫자, 날짜 및 시간데이터의 출력형식을 지정할 때 사용하는 태그들을 제공
	</p>
	
	<a href="format.page">format</a>
	
	<br>
	
	
	
	
	
	
	
	
	

</body>
</html>
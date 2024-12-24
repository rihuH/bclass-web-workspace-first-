<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>재밌게 하면 됨</title>
</head>
<body>

	<h1>연산해보기</h1>
	
	<h3>1. 산술연산</h3>
	
	<p>
		* 기존 방식 <br>
		big + small = <%= (int)request.getAttribute("big") + (int)request.getAttribute("small") %>
		<%--Object끼리의 값이라 주소값끼리 연산이므로 위와 같이 연산할 수 없고 int로 타입변환을 해주어야한다. --%>
	</p>
	
	<p>
		*EL구문<br><br>
		
		big + small = ${ big + small } <br>
		big * small = ${ big - small } <br>
		big X small = ${ big * small } <br>
		big / small = ${ big / small } 또는 ${ big div small } <br>
		big % small = ${ big % small } 또는 ${ big mod small } <br>
		
	</p>
	
	<hr>
	
	<h3>2. 숫자간 대소비교 연산</h3>
	
	<p>
		big이 small보다 크니? : ${ big > small } 또는 ${ big gt small } <br>
		big이 small보다 작니? : ${ big < small } 또는 ${ big lt small } <br>
		big이 small보다 크거나 같니? : ${ big >= small } 또는 ${ big ge small } <br> 		
		big이 small보다 작거나 같니? : ${ big <= small } 또는 ${ big le small } <br>
		<%--greater than/ less than/ greater equals/ less equals --%>
	</p>
	
	<hr>
	
	<h3>3. 동등비교 연산</h3>
	
	<p>
		big과 small이 같습니까? : ${ big == small } 또는 ${ big eq small }<br>
		<%-- equals/// 외국인이 만든거라서 gt등 키워드로 쓰는 것이 권장됨 --%>
		big과 10이 같습니까?  ${ big == 10 } 또는 ${ big eq 10 } <br>
		strOne과 strTwo가 같습니까? : ${ strOne == strTwo } 또는 ${ strOne eq strTwo } <br>
		<!-- EL에서의 문자열의 ==비교는 자바에서의 equals()와 같은 동작을 함 -->
		strOne에 담긴 값과 "안녕"이 일치합니까? : ${ strOne == "안녕" } 또는 ${ strOne == '안녕' }<br>
		<%--'안녕'도 true라고 나온다 --%>
		strOne과 strTwo가 같지 않습니까? : ${ strOne != strTwo } 또는 ${ strOne ne strTwo } <br>
		<!-- ne : not equals -->
		
	</p>
	
	<h3>4. 객체가 null인지 또는 리스트가 비어있는지 체크</h3>
	
	<p>
		* 기존방식<br>
		
		스크립틀릿으로 조건문()
		객체명 == null <br>
		리스트명.isEmpty() <br>
	</p>
	
	<p>
		* EL구문 <br>
		personOne이 null과 일치합니까? : <br>
		${ personOne == null } 또는 ${ personOne eq null } 또는 { empty personOne } <br>
		personTwo와 null이 아닙니까? : <br>
		${ personTwo != null } 또는 ${ personTwo ne null } 또는 ${ !empty personTwo } <br>
		
		listOne이 비었습니까? : ${ empty listsOne } <br>
		listTwo가 비어있지 않습니까? : ${ !empty listTwo } <br>
	
	</p>
	
	<hr>
	
	<h3>5. 논리연산자</h3>
	
	<p>
		AND연산 : ${ true && true } 또는 ${true and true } <br>
		OR연산 : ${ true || true } 또는 ${ true or false } <br>
	</p>
	
	<!--
		JSP를 이루는 구성요소
		1. Scripting Element : JSP상에서 자바코드를 직접 기술할 수 있도록 해주는 요소
		2. 지시어 : JSP페이지 정보를 기술한다거나(page 지시어)
				또 다른 페이지를 포함할 때 사용(include)
		3. JSP Action Tag : XML기술을 이용하여 기존의 JSP문법을 확장하는 태그 
	 -->	
	 
	<h2>* JSP Action Tag</h2>
	
	<h3>1. 표준 액션 태그</h3>
	
	<a>01_jsp : include</a>
	
	
	
		 
	 
	
	
	
	
	
	
</body>
</html>
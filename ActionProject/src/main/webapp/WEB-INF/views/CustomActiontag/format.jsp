<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>많이 써야함</title>
</head>
<body>
	
	<h1>1. formatNumber 태그</h1>
	
	<p>
		숫자형 데이터의 형식을 지정 <br>
		
		[ 표현법 ] <br>
		&lt;fmt:formatNumber value="출력할속성" groupingUsed="true/false" type="percent/currency" /&gt;
	</p>
	
	<br>
	<c:set var="num1" value="123456789" />
	<c:set var="num2" value="0.75" />
	<c:set var="num3" value="50000" />
	
	<br>
	num1 : ${ num1 } <br>
	
	<!-- groupingUsed속성 기본값이 true인데, 세 자리 마다 쉼표를 찍어줌. 123,456,789 이렇게 나옴 -->
	formatNumber사용 : <fmt:formatNumber value="${ num1 }" /> <br><br>
	
	<!-- percent같은 것으로 단위치환해서 보고 싶은 경우 -->
	num2의 경우 <br>
	percent : <fmt:formatNumber value="${ num2 }" type="percent" /> <br><br>
	
	<!-- 앞에 단위 붙여주기. 그리고 3자리마다 , 도 찍어줌 -->
	num3의 경우 <br>
	currency : <fmt:formatNumber value="${ num3 }" type="currency" /> <br><br>
	<!--
		type="currency" : 통화(돈)단위가 보여짐. 그런데 현재 사용하고 있는 컴퓨터의 시스템에 따라서 단위가 정해짐.
						+groupingUsed속성의 기본값이 true이기 때문에 3자리마다 , 찍혀있음 
	 -->
	 
	 currency $ : <fmt:formatNumber value="${ num3 }" type="currency" currencySymbol="상품가격 : " />
	 <!-- 
	 	currencySymbol : 통화기호 문자의 종류를 지정할 수 있음.
	  -->
	  
	  <hr>
	  
	  <h3>2. formatDate 태그</h3>
	  
	  <p>
	  	날짜 및 시간 데이터의 포맷(형식)을 지정 <br>
	  	단, java.util.Date클래스의 객체를 이용해야만 함!<br>
	  </p>
	  
	  
	  <c:set var="current" value="<%= new java.util.Date() %>"/>
	  
	  current출력 : ${ current } <br>
	  
	  <ul>
	  	<li>
	  		현재 날짜 : <fmt:formatDate value="${ current }" />
	  		<!-- type속성을 생략. type속성의 기본값은 type="date" . 그러면 년.월.일 출력 -->
	  	</li>
	  	<li>
	  		현재 시간 : <fmt:formatDate value="${ current }" type="time"/>
	  		<!-- type="time" : 시간 -->
	  	</li>
	  	<li>
	  		날짜 및 시간 : <fmt:formatDate value="${ current }" type="both" />
	  		<!-- 날짜와 시간 둘 다 나옴 -->
	  	</li>
	  	<li>
	  		medium : <fmt:formatDate value="${ current }" type="both" dateStyle="medium" timeStyle="medium"/>
	  		<!-- 위의 것과 똑같이 나옴 -->
	  	</li>
	  	<li>
	  		long : <fmt:formatDate value="${ current }" type="both" dateStyle="long" timeStyle="long"/>
	  		<!-- 년월일 시분초// 그리고 date랑 time 스타일은 서로 같지 않아도 된다. -->
	  	</li>
	  	<li>
	  		full : <fmt:formatDate value="${ current }" type="both" dateStyle="full" timeStyle="full"/>
	  		<!-- 더 길어짐 요일도 나옴 -->
	  	</li>
	  	<li>
	  		short : <fmt:formatDate value="${ current }" type="both" dateStyle="short" timeStyle="short"/>
	  		<!-- 효율중시타입 -->
	  	</li>
	  	<li>
	  		pattern : <fmt:formatDate value="${ current }" type="both" pattern="a HH:mm:ss yyyy/MM/dd(E)"/>
	  		<!-- 나만의 스타일 -->
	  	</li>
	  </ul>
	  
	  <!-- 
	  	yyyy : 4자리년도
	  	MM : 2자리 월
	  	dd : 2자리 일
	  	E : 요일
	  	a : 오전 / 오후
	  	HH : 2자리 시간
	  	mm : 2자리 분
	  	ss : 2자리 초
	   -->
	   
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
	<!-- 얘는 이런 게 있다 알아만두기 -->
	<hr>
	<br>
	
	<h4>functions라이브러리</h4>
	
	
	<p>
		functions 라이브러리는 따로 태그를 제공하지는 않음 <br>
		EL구문안에서 메소드를 호출하는 형태로 사용 <br>
		주로 문자열과 관련된 메소드들을 제공 <br>
	</p>
	
	<c:set var="str" value="How are you?" />
	
	문자열의 길이 : ${ fn:length(str) } 글자 <br>
	문자열의 길이 : ${ str.length() } 글자 <br> <!-- 이 방식으로 바로 메소드호출할 수 있으므로 상대적으로 사용 의미가 없어진다 -->
	<!-- 다만 문자열 길이뿐 아니라 인자로 list를 넘기면 사이즈를 반환해준다. 범용성이 있다는 장점 -->
	
	
	   
	   
	   
	   
	   

	  
	

</body>
</html>
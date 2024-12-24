<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>오늘의 주인공</title>
</head>
<body>

	<h1>JSTL Core Library</h1>
	
	<h3>1. 변수(속성 == Attribute)</h3>
	
	<pre>
		* 속성 추가 방법(&lt;접두사(를 보통 c라고 쓰고 작업한다):set(이게 태그명) var="키값" value="리터럴값" scope="스코프영역지정(생략가능, a.s.r.p중 어느 attribute?)" />)
		- 속성을 선언하고 초기값을 대입할 수 있는 태그
		- 더 나아가서 어떤 scope영역에 담아둘 건지 지정 가능(생략 시 pageScope에 담김)
		
		=> 해당 scope영역에 setAttribute라는 메소드를 통해 key + value형태로 데이터를 담아둔다 라고 생각하면 됨
		=> set태그를 통해 선언된 속성은 EL구문으로 접근해서 사용가능(스크립팅 요소로는 접근 불가능)
		
		* 주의 사항
		- 타입을 별도로 지정하지 않음
		- 반드시!!!!*** 해당 속성에 담을 값(value속성에 담긴 리터럴)을 꼭 선언해야함!!
		(초기값을 반드시 넣어야함!! 선언과 동시에 초기화!!!!!!!!!!!!!!)
	</pre>
	
	<c:set var="num1" value="10" /> <!-- pageContext.setAttribute("num1", "10"); -->
	<!-- end태그와 , c:set을 위에 taglib 선언해주는 과정이 필요하다. taglib선언에는 prefix와 uri속성이 꼭 필요하다. -->
	<c:set var="num2" value="20" /> <!--  request.setAttribute("num2", "20"); -->
	
	num1의 값 : ${ num1 } <br> 
	num2의 값 : ${ num2 } <br> 
	
	<c:set var="result" value="${ num1 + num2 }" scope="session"/>
	
	result 값 : ${ result } <br>
	
	<c:set var="result" scope="request">9999</c:set>
	<!-- value속성 말고 시작태그와 종료태그 사이에도 대입할 값을 기술할 수 있음. -->
	
	${ requestScope.result }<br>
	<hr>
	
	<pre>
		* 속성 삭제(&lt;c:remove var="제거하고자하는 키값" scope="스코프영역(생략가능)"/>)
		- 해당 속성을 scope영역에서 제거하는 태그
		- scope지정 생략 시 모든 scope에서 해당 속성을 찾아서 다 제거함
		=> removeAttribute("키값")과 동일하게 동작함
		
	</pre>
	
	삭제전 result : ${ result } <br>
	
	1) requestScope에서 result속성을 삭제 <br>
	<c:remove var="result" scope="request" />
	삭제 후 result : ${ result }<br>
	<!-- 30이 나옴. scope속성을 지정하지 않고 remove 하면 모든 스코프 result를 지우는데 request라고 해서 request것만 지움.
	그래서 request에 없으니까 session 가서 찾음 -->
	
	<hr>
	
	<pre>
		* 속성 출력(&lt;c:out value="출력하려고 하는 값" default="기본값" escapeXml="true(기본값)")
		- 데이터를 출력하려고 할 때 사용하는 태그
		- default : 기본값, value속성에 출력하고자 하는 값이 없을 경우 대체해서 출력할 내용물을 쓸 수 있음(생략가능)
		- escapeXml : HTML태그를 인식시킬 수도 있음.
	</pre>
	
	num1 출력! : <c:out value="${ num1 }" />
	EL구문으로 출력 : ${ num1 } <br>
	<!-- 그러면 위에 걸 왜 쓰지 EL이 편한데. -->
	
	<br>
	
	result를 EL구문으로 출력 : ${ requestScope.result } <br> <!-- 만약 값이 없으면 ""가 나옴. -->
	<!-- 그런데 값이 없을 때 아무것도 안나오는 것 말고 다른 것 나오고 싶을 때 out태그로 하면 -->
	out태그로 해볼까? : <c:out value="${ requestScope.result }" default="값이 존재하지 않습니다."/>
	<!-- default 값을 사용해서 값이 없을 때 출력구문을 지정해줄 수 있다. -->
	
	<c:set var="outTest" value="<strong>강한정보</strong>" />
	<br>
	${ outTest } <br> <!-- EL구문은 HTML태그를 인식해서 출력해준다. -->
	<!-- 그런데 글자 그대로 출력하고 싶다면 -->
	<c:out  value="${ outTest }" />
	<!-- out태그도 HTML태그를 인식하 ㄹ수 있다. excapeXml속성값은 생략 시 기본값이 true이고 HTML태그가 해석되지 않음. -->
	
	<hr>
	
	<h3>2. 조건문 - if(&lt; c:if test="조건식"> 조건식이 true일 경우 실행할 내용 &lt;/c:if>)</h3>
	
	<pre>
		- JAVA의 단일 if문과 비슷한 역할을 하는 태그
		- 조건식은 test라는 속성에 작성(제발 부탁드립니다 조건식을 만들 때 반드시 EL구문으로 작성해주세요.)
	</pre>
	
	<c:if test="${ value1 gt value2 }">
		<strong>value1이 value2보다 큽니다.</strong> <br>
	</c:if>
	
	<c:if test="${ value1 le value2 }">
		<strong>value1이 value2보다 작거나 같습니다.</strong> <br>
	</c:if>
	
	<c:if test="${ str eq '안녕하세요' }">
		<mark>Hello World!</mark> <br>
	</c:if>
	<!-- ''로 스트링 써도 괜찮음 -->
	<!-- 그러나 else가 따로 없어서 단일if문 역할밖에 할 수 없음 -->
	<br>
	
	<h3>3. 조건문 - choose, when, otherwise</h3>
	
	<pre>
		[ 표현법 ]
		&lt; c:choose &gt;
			&lt;c:when test="조건1"&gt; ~~~~ &lt;/c:when &gt;
			&lt;c:when test="조건2"&gt; ~~~~ &lt;/c:when &gt;
			...
			&lt; c:otherwise&gt; ~~~~~~&lt;/c:otherwise&gt;
		&lt; /c:choose &gt;
			
		- JAVA의 if-else문, switch문과 비슷한 역할을 하는 태그
		- 각 조건들은 choose의 하위요소로 when을 통해서 작성
		- otherwise에는 조건을 적어주지 않음(적으면 에러. else, default와 같은 역할)
			
		<!-- 웹서버는 정적자원처리, 동적자원처리가 필요하면 WAS -->
		<!-- session은? 서버 측 저장소 -->
	</pre>
	
	
	회원 등급 출력 : <br>
	<c:set var="point" value="500" />
	
	이거 무조건 출력할건데 : 1 <!-- 하지만 choose 등은 가질 수 있는 자식요소가 정해져있음. 그래서 안에 적을 수 없다.-->
	<!-- 100, 300, 500.. -->
	<c:choose>
		<c:when test="${ point le 100 }">
			일반회원 <br>
		</c:when>
		<c:when test="${ point le 300 }">
			우수회원 <br>
		</c:when>
		<c:otherwise>
			<strong>최우수회원</strong>
		</c:otherwise>
	</c:choose>
	
	<!-- c:choose안에는 when/otherwise말고 다른 내용이 들어가선 안 됨 -->
	
	<h3>4. 반복문 - forEach </h3>
	
	<pre>
		[ 표현법 ]
		for loop문
		&lt;c:forEach var="속성명" begin="초기값" end="끝값" step="증가시킬값(생략가능)" %gt;
			반복적으로 실행할 내용
		&lt;/c:forEach &gt;
		
		=> step생략 시 기본값이 1
		
		향상된 for문
		&lt;c:forEach var="속성명" items="순차적으로접근할배열또는컬렉션" [varStatus="요소의상태값"]&gt;
			반복적으로 실행할 내용
		&lt;/c:forEach&gt;
		
		var속성으로 선언된 제어변수 사용할 때는 반드시 EL구문으로 접근해야함!
		
		
	</pre>
	
	
	<br>
	
	<c:forEach var="i" begin="0" end="9">
		${ i }
	</c:forEach>
	
	<br>
	
	<c:forEach var="i" begin="1" end="6">
		<h${ i }>이런것도 가능</h${ i }>
	</c:forEach>
	<!-- 태그에 붙일 수도 있다 -->
	
	<c:set var="color">
		red, orangered, orange, yellow, yellowgreen, greenyellow, forestgreen
	</c:set>
	<!-- 이렇게 선언하면 이건 배열처럼 쓸 수 있다 -->
	
	color : ${ color }
	
	<ul>
		<c:forEach var="c" items="${ color }">
			<li style="color:${ c }">${ c }</li>
		</c:forEach>
	</ul>
	
	
	<br>
	<hr>
	
	<table border="1">
		<tread>
			<tr>
				<th>이름</th>
				<th>나이</th>
				<th>주소</th>				
			</tr>
		</tread>
		<tbody>
			<c:choose>
				<c:when test="${ empty personList }">
					<tr>
						<td colspan="3">조회 결과가 존재하지 않습니다.</td>
					</tr>
				</c:when>
				<c:otherwise>
					<c:forEach var="p" items="${ requestScope.personList }" varStatus="s">
						<tr>
							<td>${ p.name }</td>
							<td>${ p.age }</td>
							<td>${ p.address }</td>
							<td>${ s.count }</td>
						</tr>
					</c:forEach>
				</c:otherwise>			
			</c:choose>
		</tbody>
	</table>
	<!-- varStatus속성을 통해서(s라고 이름붙임, s는 바꿀수있고) index(0부터시작), count(1부터시작) 등의 속성을 사용해서 조회된 순서를 보여줄 수 있다. -->
	
	<hr>
	
	<h3>5. 반복문 - forTokens</h3>
	
	<pre>
		[ 표현법 ] <br>
		
		&lt;c:forTokens var="각값을보관할속성명 items="분리하고자하는문자열" delims="구분자"&gt;
			반복적으로 실행할 문구(출력만)
		&lt;/c:forTokens&gt;
		
	- JAVA의 StringTokenizer와 비슷한 역할
	- 구분자를 통해 분리된 각각의 문자열에 순차적으로 접근하면서 반복 수행
	
	</pre>
	
	<!-- 테스트할 값 -->
	<c:set var="device" value="컴퓨터,핸드폰,TV/에어컨.냉장고-세탁기"/>
	
	<ul>
		<c:forTokens var="d" items="${ device }" delims=",/.-">
			<li>${ d }</li>
		</c:forTokens>
	</ul>
	
	<hr>
	
	<h3>6. 쿼리스트링(href="게시글목록?currentPage=1&boardLimite=10&...")관련태그 : url, param </h3>
	요청보내자
	<c:url var="query" value="게시글목록">
		<c:param name="currentPage" value="1" />
		<c:param name="boardLimit" value="10" />
		<c:param name="pageLimit" value="10" />
	</c:url>	
	<a href="${ query }">요청~~</a>
	 <!-- 가독성을 증가시킬 수 있는 태그. 중요한건 아님 -->
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

</body>
</html>
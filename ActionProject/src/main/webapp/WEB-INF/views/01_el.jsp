<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.kh.model.vo.Person"
 %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>EL 구문 써보기</title>
</head>
<body>

	<h1>안녕 나는 el.jsp야</h1>
	<!-- webapp은 배포되기때문에 이 파일의 경로를 웹상에서 사용자가 알 수가 있음. 외부에서 접근도 가능하고
	그럼 직접 접근할 수도 있고 폴더 구조도 외부에 노출됨
	 -->
	 
	 <%--
	 	String classroom = (String)request.getAttribute("classroom");
	 
	 --%>
	 <%--= classroom --%> <!-- 경로를 직접 입력해서 서블릿을 거쳐오지 않으면 이 키값은 없으므로 null이 출력되게 된다.
	 그래서 반드시 서블릿을 거쳐서 가게 하고 싶은 필요.
	 views폴더 위치를 WEB-INF로 옮길 수 있다. 여기는 외부에서 직접접근할 수 없는 곳이므로 -->
	 
	 
	<hr>
	
	<%-- 
	<h1>EL 기본구문</h1>
	<h3>1. 기존 방식대로 스크립틀릿과 표현식을 이용해서 각 영역에 담겨있는 값을 뽑아서 화면에 출력</h3>
	
	<%
	
		// requestScope => classroom, student
		String classroom = (String)request.getAttribute("classroom");
		Person student = (Person)request.getAttribute("student");
		
		// sessionScope => academy, lecture
		String academy = (String)session.getAttribute("academy");
		Person lecture = (Person)session.getAttribute("lecture");
		
	%>
	
	
	<p>
		학원명 : <%= academy %> <br>
		강의장 : <%= classroom %> <br>
		강사정보 : <%= lecture.getName()%>, <%= lecture.getAge() %>, <%=lecture.getAddress() %>
		
		수강생 정보 <br>
		<ul>
			<li> 이름 : <%= student.getName() %> </li>
			<li> 나이 : <%= student.getAge() %> </li>
			<li> 주소 : <%= student.getAddress() %> </li>
		</ul>
	</p>
	
	--%>
	
	
	
	<h3>2. EL을 이용해서 request/ session Scope에 담긴 값들을 출력 <br>
	
	<p>
	학원명 : ${academy} <br>
	강의장 : ${classroom} <br>
	강사정보 : ${lecture.name}, ${lecture.age}, ${lecture.address} <br>
	<!-- 필드에 직접 접근하는 모양새. 
	실제로는 필드에 직접 접근한 것이 아님. name이라는 이름을 가지는 getter를 찾는다. (name필드는 멀쩡하고 getter 메소드에 오타가 나면 500오류)
	내부적으로 getter메소드를 찾아서 그 반환값을 화면상에 출력해주는 구조.
	그래서 get필드명 모양의 메소드를 반드시 만들어놔야한다. 그렇지 않으면 el구문을 사용하지 못하기 때문 
	=> 항상 까먹지 말고 getter메소드를 생성
	
	lecture에 접근했을 때 value는 Person타입 객체
	해당 Person객체의 각 필드 값을 출력하고자 한다면 키값.필드명 을 작성하면
	
	해당 필드에 네이밍 컨벤션에 부합하는 getter를 찾아서 호출해줌
	
	-->
	
	<p>
	수강생정보 <br>
	<ul>
		<li>이름 : ${student.name }</li>
		<li>나이 : ${student.age }</li>
		<li>주소 : ${student.address }</li>
	</ul>
	</p>
	
	<p>없는 키값을 출력하느 ㄴ경우</p>
	<p>출력식을 이용한 출력 : &lt;%= num %> </p>
	<p>EL구문을 이용해서 없는 키값을 출력하는 경우 : ${ekeke }</p> <!-- 오류도 안 나고 아무것도 출력 안 됨 -->
	
	<h3>3. EL 사용 시 객체들의 키 값이 동일한 경우 </h3>
	
	key 키값에 담긴 밸류값 : ${key } <br> <!--  request의 값이 나옴 -->
	
	<%
		// pageScope에 담기 -> 딱 여기에서만 쓸 수 있음
		pageContext.setAttribute("key", "page");
	%>
	
	다시 찍어보기 : ${key } <br> <!-- page의ㅐ 값ㅣ이 나옴 -->
	<!-- EL구문은 키값이 들어오면 검색을 하는데 가장 작은 범위의 Scope부터 키값을 검색함
		 page => request => session => application순으로 키값을 찾음
		 만약 모든 영역에서 해당 키에 담긴 값을 못 찾으면 아무 것도 출력이 안 됨  오류 안 남!! 아무것도 출력 안됨
	 -->
	 
	 pageScope에 값이 담겨있는데 동일한 키값으로 담겨있는 request/session의 값을 사용하고 싶다면? <br>
	 Scope에 직접접근 하는 방법! <br>
	 requestScope : ${requestScope.key } <br>
	 sesstionScope : ${sessionScope.key } <br>
	 applicationScope : ${applicationScope.key } <br>
	 
	 <%
	 	session.setAttribute("abc", "사과");
	 %>
	 
	 abc 밸류값 : %{abc} <!-- scope에 가서 하나씩 검색하므로, 한 번에 갈 수 있게 sessionScope.abc라고 적어주는 게 바람직하고, 나중에 같은 키 값이
	 들어오게 될 경우의 문제도 방지할 수 있다 -->
	 
	 
	
	
	
	
	
	
	

</body>
</html>


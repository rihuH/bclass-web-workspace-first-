<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<h1>include</h1>
	
	<p>
		다른 페이지를 포함할 때 사용
		
	</p>
	
	<h4>기존의 include지시어를 이용한 방식(정적 include방식 == 컴파일 시 포함하는 형태)</h4>
	
	<%-- 
	<%@ include file = "footer.jsp" %> 기존의 방식. footer를 통째로 포함되는 형태. 
	include 하고 저장하는 시점에 포함이 된다. 이 아래부터는 footer에 있는 변수, 메소드도 사용할 수 있다.
	--%>
	
	<hr>
	
	<h4>2. JSP표준 액션 태그를 이용한 방식(동적 include)</h4>
	<!-- 실행할 때 읽어들이는 방식. 본체는 태그. jsp로 시작하는 태그들이 표준액션태그이다. jsp 내에서만 사용할 수 있다. 공통적으로 jsp:하고 시작한다. -->
	<!-- jsp:include는 경로를 적는 것은 같은데 속성명만 file이 아닌 page로 씀 -->
	<jsp:include page="footer.jsp"></jsp:include> <!-- 요소이려면 닫는 태그가 있어야함. 이건 html이 아니고
	XML기술이기 때문에 반드시 시작,종료태그가 둘 다 있어야 한다.(실제 XML파일에서도 태그 둘 다 안쓰면 못씀)
	닫는태그 써주지 않으면 500에러 발생. -->
	
	<jsp:include page="footer.jsp"/> <!-- 컨텐트 없으면 br같은 것처럼 /를 붙여서 닫아줄 수 있다. -->
	<jsp:include page="footer.jsp"/>
	<jsp:include page="footer.jsp"/>
	<!-- 여러번 include 가능, 그럼 footer내용이 여러 번 나옴 기존의 &lt;%@ include %> 방식은 불가능 -->
	
	특징 1 : include하고 있는 페이지에 선언된 변수를 공유하지 않음!! <br>
	 
	특징 2 : 포함 시 여기에서 include하는 페이지로 값을 전달할 수 있음 <br>
	
	<hr>
	
	<jsp:include page="footer.jsp">
		<jsp:param name="test" value="Hello...?"/> 
	</jsp:include>
	<!-- param 태그로 값을 넘겨줄 수 있다.
	절대로 Content영역에 주석을 달면 안된다. 그럼 500에러남.
	각 요소들은 자기가 내포할 수 있는 요소들이 정해져 있기 때문이다.-->
	
	<br>
	
	<jsp:include page="footer.jsp">
		<jsp:param name="test" value="GoodBye~"/>
	</jsp:include>
	
	
	
	
	
	
	 

</body>
</html>
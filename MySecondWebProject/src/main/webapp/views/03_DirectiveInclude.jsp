<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<h1>include 지시어</h1>
	<div style="width : 100%; border : 1px solid red;">
		<%@ include file="01_ScriptingElement.jsp" %> <!-- 같은 폴더 안에 존재하면 파일명만 적으면 됨. 
		그러면 적은 저 파일내용이 자동으로 복붙해서 옴-->
	</div>
	
	<hr>
	
	<h4>1부터 100까지의 총 합계 : <%=sum %></h4> <!-- 저 file에서 선언한 변수들을 다 사용할 수 있음. 
	자바코드를 포함시키는 형태이기 때문이다.
	(하지만 새로운 기술을 배우면 안 쓸 것이므로 특징이라고 기억만 해 둘 것. -->
	
	특징 : 포함한 JSP상에 있는 모든 화면 구성요소들을 JSP에 출력 <br>
		포함한 JSP에 존재하는 모든 변수/메소드들을 가져다 쓸 수 있음 <br>
		
	<%
		//int sum; // 반대로 말하면 저 파일에 있는 변수명/ 메소드명을 내가 사용할 수 없다는 뜻. 
		//중복된 변수명 사용 불가
	%>
	
	<hr>
	<%@ include file="datePrint.jsp" %> <!-- footer는 밑에다 붙일 것이니까 -->

</body>
</html>
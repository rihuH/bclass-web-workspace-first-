<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이것은 중요한 것이 틀림없다 웹에서 요청응답 받는 것</title>
</head>
<body>

	<h1>스크립팅 요소를 사용해보자!!!!</h1>
	
	<!-- HTML주석은 사용자가 화면 소스 보기로 다 확인할 수 있다. -->
	
	<%-- JSP주석 : 클라이언트에게는 보여지지 않음 --%>
	
	<%!
		public void test(){
			// 선언은 가능한데 굳이 사용하지 않음. 그냥 스크립틀릿 써도 되고 여기서 선언할 이유가 없음.
		}
	%>
	
	<%
		//주의할 점. 자바코드와 똑같음. 
		// 아래에 선언한 sum은 다른 스크립틀릿이어도 사용할 수 없음.
		// 그래서 스크립틀릿을 사용하게 되면 주로 3행에 작성한다. 아래에서 다 쓸 수 있도록.
		// 스크립틀릿 안에서 자바코드는 순수 자바 클래스와 마찬가지로 위에서 아래 순서대로 흐름
	%>
	
	<%
		// 스크립틀릿 : 자바코드를 작성할 수 있음.(변수 선언, 제어문, 반복문 등)
		int sum = 0;
		for(int i = 1; i <= 100; i++){
			sum += i;
		}
	%>
	
	<p>
		응답 데이터로 HTML상에 출력하고 싶다면?? <br>
		
		표현식(출력식)으로 출력 : <%= sum %> <br>
		스크립틀릿으로도 가능 <% out.println(sum);%> <!--자바코드로 출력식 쓰려면 ; 도 붙여줘야함 --> <br>
		
	</p>
	
	<%
		// 배열 사용
		String[] names = {"홍길동", "이승철", "이름"};
		
	
	%>
	
	<h5>배열의 길이 : <%= names.length %></h5>
	
	<%=String.join("-",names) %>
	
	<%= java.util.Arrays.toString(names)%> <!-- import 못 해서 직접 경로 적어줘야함 -->
	
	<h4>반복문을 통해 HTML요소를 반복적으로 화면에 출력!!</h4>
	<ul>
		<% for(int i = 0; i < names.length; i++) { %>
			<li><%=names[i] %> </li>
		<% } %>
		<br>
		<% for(String s : names) { %>
			<li><%= s %></li>
		<% } %>
	</ul>
	
	
	
	
	
	

</body>
</html>
package com.kh.first.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Arrays;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/getTest") // 먼저 확인하기. 이름 잘못썼으면 여기서 고칠 수 있음. 이 getTest를 서블릿매핑값이라고 한다.
public class RequestGetServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public RequestGetServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//System.out.println("request_Get.html에서 form태그의 GET방식으로 요청이 들어옴!");
		// 크롬에서 요청을 보냄 http://localhost:80/first/getTest
		// 인터넷세상으로 감
		// IP주소로 서버 컴퓨터로 옴
		// 포트번호로 Tomcat으로 옴
		// Tomcat에 어플리케이션 3개 올라가있음 --> 무슨 요청이 왔는지 context root로 구분
		// Servlet 매핑값 : getTest -> 맞는 서블릿을 출동시킴
		// 톰캣은 WAS라고 표현을 함. 웹서버+서블릿컨테이너라고 표현/ 컨테이너는 밖에서 안을 볼 수 없다는 특징
		// 톰캣에 서블릿들이 들어가는 컨테이너가 있는 것
		// 메서드는 클래스가 객체로 생성되어있어야 사용할 수 있다
		// 참고 ) super클래스가 가지고 있는 메소드 / init() service() doGet()/doPost() destroy()
		// 톰캣이 처음 요청 때 getTest를 객체 생성 --> 톰캣은 한 번이라도 생성된 객체는 지우지 않는다. 매번 지우고 다시 만드는게 더 자원낭비이기 때문
		// 여러 요청이 들어왔을 때의 멀티스레드는 톰캣 서버 자체내장으로 처리해줌.
		
		/*
		 * Controller <- 얘는 하는 일이..? 
		 * 
		 * 1. 데이터가공
		 * 2. Service호출
		 * 3. 응답화면 지정
		 * 
		 * View에서 GET방식 요청 시 doGet()가 호출됨!!
		 * 인자값으로 두 개 넘어옴
		 * 첫 번째 매개변수 HttpServletRequest request에는 요청 시 전달된 내용들이 담김
		 * => 요청 전송방식, 요청한 사용자 ip주소, 사용자가 입력한 값... 등등...
		 * 
		 * 두 번째 매개변수 HttpServletResponse response는 요청 처리 후 응답할 때 사용하는 객체
		 * 
		 * 요청 처리 스텝
		 * 
		 * 1. 우선 요청을 처리하기 위해 요청 시 전달된 값(사용자가 입력한 값)들을 뽑는다
		 * => key-value세트로 담겨있음(name속성값=value속성값)
		 * => request의 Parameter영역에서 전달값을 뽑아내야함
		 * 
		 * 2. 뽑아낸 값을 가공해서 요청 처리를 진행해야함(Service->DAO->DB)
		 * 
		 * 3. 처리 결과에 따른 성공/ 실패 페이지 응답
		 */
		
		/*
		 * request의 parameter영역으로부터 전달된 데이터를 뽑아내는 방법
		 * 
		 * - request.getParameter("키값") : String(HTML요소에 적어놓은 name속성값)
		 * => 반환타입이 String이기 때문에 다른 자료형으로 활용해야한다면 Parsing해야함
		 * 
		 * - request.getParameterValues("키값") : String[]
		 * => 하나의 key값으로 여러 개의 value들을 받는 경우 (checkbox등등)
		 * 
		 */
		
		// 1단계. 값뽑기
		String name = request.getParameter("name");
		// 셀 수 없음
		System.out.println(name); // 아무것도 안 넘기면 빈 문자열이 넘어온다. input요소의 value속성 기본값은 null이 아니고 ""이기 때문.
		// input은 값이 없어도 무조건 넘김 
		
		String gender = request.getParameter("gender");
		// "M" "F"  // 라디오버튼은 checked되었을 때만 값을 넘긴다. 아무것도 체크하지 않았다면 아무것도 안 넘기므로 null/
		// 라디오버튼의 경우 체크된 것이 없을 경우 null
		System.out.println(gender);
		
		int age = Integer.parseInt(request.getParameter("age"));
		//빈문자열은 숫자로 바꿀 수 없다 NumberFormatException
		// Wrapper클래스를 이용한 파싱
		// "" : NumberFormatException 발생
		System.out.println(age);
		
		String city = request.getParameter("city");
		// 얘는 무조건 넘어옴
		System.out.println(city);
		
		double height = Double.parseDouble(request.getParameter("height"));
		// 얘도 무조건 값이 옴
		System.out.println(height);
		
		String[] foods = request.getParameterValues("food");
		// ["곱창", "커피"]/ 얘도 checked되어야 값이 넘어오기 때문에 check안 되었으면 값이 오지 않는다
		// null(checked된 것이 없다면 null)
		if(foods != null) {
			System.out.println(Arrays.toString(foods));
		} else {
			System.out.println("없음");
		}
		// 자주보는 에러
		// 404 : 파일이나 요청을 받아주는 서블릿을 찾지 못했을 때 발생
		// => 경로를 잘못 적었거나 파일명에 오타가 났을 때
		
		// 500 : 자바 소스코드상의 오류(예외발생)
		
		// 2단계. 데이터 가공
		// 원래라면 Person객체같은 것 하나 만들어서 담았겠지만 스킵
		
		// 3단계. 요청 처리(DB와의 상호작용 ==> JDBC) 
		// 보통의 흐름 : Controller단에서 Service단의 메소드를 호출하면서 값을 전달
		// -> DAO 호출 -> DB SQL문 실행 - 결과반환
		
		// int result = new PersonService().insertPerson(person);
		
		// 4단계. 응답화면 지정
		// if(result>0) {성공}
		// else {실패}
		
		// 순수 Servlet만 사용하여 응답데이터 넘기기
		// 사용자에게 HTML + CSS + JS 전달
		
		/*
		 * 요청 처리에 성공했습니다!
		 * 
		 * XXX님은
		 * XX살이며
		 * XXX에 삽니다.
		 * 키는 XXXcm이고
		 * 
		 * 성별은 case1. 선택을 안 했습니다.
		 * 		case2. 남성/여성입니다.
		 * 
		 * 좋아하는 음식 case1. 없습니다
		 * 			case2. ~~~
		 * 
		 */
		
		// 1단계 ) 응답데이터 형식 지정 -> 문서 형태의 HTML / 인코딩방식 UTF-8
		response.setContentType("text/html; charset=UTF-8");
		// 2단계) 출력 스트림 생성
		PrintWriter out = response.getWriter();
		// 3단계) 스트림을 통해 HTML 데이터 출력
		out.println("<html>");
		out.println("<head>");
		out.println("<title>서블릿으로 응답해보기~</title>");
		
		out.println("<style>");
		
		out.println("#name{color : skyblue}");
		out.println("#age{color : orangered}");
		out.println("#city{color : forestgreen}");
		out.println("#height{color : yellowgreen}");
		out.println("#gender{color : greenyellow}");
		
		out.println("</style>");
		
		out.println("</head>");
		out.println("<body>");
		
		out.println("<h1>요청처리에 성공했습니다~</h1>");
		
		out.printf("<span id='name'>%s</span>님은 <br>", name);
		out.printf("<span id='age'>%d</span>살이며, <br>", age);
		out.printf("<span id='city'>%s</span>에 삽니다.<br>", city);
		
		out.printf("키는 <span id='height'>%.1f</span>cm이고 <br><br>", height);
		
		out.print("성별은 ");
		if(gender==null) {
			out.println("선택을 안 했습니다.");
		} else {
			String str = (gender.equals("M"))? "남자" : "여자";
			out.printf("<span id='gender'>%s</span>입니다.<br>", str);
		}
		
		out.print("좋아하는 음식은 ");
		if(foods == null) {
			out.println("없습니다.");
		} else {
			out.println("<ul>");
			for(int i = 0; i < foods.length; i++) {
				out.printf("<li style='color : \"plum\"'>%s</li>", foods[i]);
			}
			out.println("입니다.");
			
			out.println("</ul>");
		}
		
		out.println("<script>");
		out.println("alert('축하해~~')");
		out.println("</script>");
		
		out.println("</body>");
		out.println("</html>");
		
		
		
		
		
		
		
		
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}

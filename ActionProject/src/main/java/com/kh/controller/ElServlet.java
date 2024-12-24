package com.kh.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kh.model.vo.Person;

@WebServlet("/el.do")
public class ElServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public ElServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// 서블릿에서 응답데이터가 존재한다면
		// request에 담아서 보내줬음! --> Servlet내장객체(= Scope 객체)도 담아서 갈 수 있음
		// 얘네는 서블릿이 클라이언트 요청 처리 후 응답해줄 때 사용하느 객체들인데 서블릿에 내장되어 있는 것.
		// JSP는 나중에 서블릿으로 변환되니까, 이것들은 서블릿과 JSP 둘 다에서 사용할 수 있다.
		
		// 종류
		// application / **session / **request / page
		
		/* 
		 * 1. ServletContext (application scope)
		 * 한 애플리케이션 당, 단 한 개 존재하는 객체
		 * 이 영역에 데이터를 담으면 어플리케이션 전역에서 사용가능
		 * 
		 * 2. HttpSession (session scope)
		 * 하나의 브라우저 당, 한 개 존재하는 객체
		 * 이 영역에 데이터를 담으면 JSP/Servlet단에서 사용 가능
		 * 값이 한 번 담기면 서버를 중지하거나, 세션을 비우거나, 브라우저가 닫히기 전까지는 어디에서든 사용 가능
		 * 
		 * 3. HttpServletRequest (request scope)
		 * 요청 및 응답 시 매 번 생성되는 객체
		 * 이 영역에 데이터를 담으면 해당 request객체를 포워딩받는 응답 JSP에서만 사용가능(1회성)
		 * 
		 * 톰캣에 요청 들어왔을 때 동적인 처리면 서블릿컨테이너에서 서블릿을 하나 올림
		 * doGet/doPost 중 하나를 호출 할 때 , 클라이언트 요청이 들어올 때마다 서블릿이 올라가면서 request, response가 생긴다. 요청때마다 생기는 것
		 * jsp로 이걸 포워딩해줄 때, jsp에서는 넘겨준 response 등으로 뭘 만들어주고 응답하면 request, response는 역할을 다 하고 jsp의 응답이 끝나면 사라짐.
		 * 서브웨이에서 request attribute에 order 담아서 넘겨주고 응답을 해줌, 포워드 하고 응답하면서 메소드 종료되어 그 order객체는 더 이상 사용을 할 수 없다
		 * jsp는 html을 만들어내는 독립적인 개체. 메소드와 비슷하게 느껴지지만(내기준) 그렇게 같다고 치면 안 됨.
		 * jsp는 서버에서 동작하고 사용자에게는 html이 전달된다.
		 * 
		 * 톰캣이 요청을 받음 / 그 요청은 서블릿이 처리해야 하는 작업임
		 * 서블릿을 생성하면서 request, response를 각각 1개씩 생성하게 됨.
		 * 서블릿이 작업을 한 다음 jsp로 넘겨줌
		 * jsp에서 request랑 response를 사용하고 사용자에게 응답을 해줌
		 * 메소드블록이 사라짐 그러니까 request랑 response는 응답을 한 번 하면 사라지므로 더 이상 사용할 수가 없는 것이다.
		 * 
		 * 따라서 로그인 과 같이 한 번 로그인하면 지속되어야 하는 경우는 request에 저장하기 적합하지 않다
		 * 일반적으로 사용되는 것은 2번 세션이다. 세션을 비우거나 브라우저가 종료되기 전까지는 사용할 수 있다
		 * 
		 * 4. PageContext(page scope)
		 * JSP페이지 내에서만 사용가능. 서블릿에서도 사용 못함
		 * 
		 * => 위 4 객체들에 값을 담을 때는 .setAttribute("키", 밸류); 로 값을 담는다.
		 * 			값을 뽑을 때는 .getAttribute("키");
		 * 			값을 지울 때는 .removeAttribute("키");
		 * -> 4개 모두 메소드가 같다. 사용법이 같다.
		 * 
		 * 
		 * 
		 */
		
		// requestScope
		request.setAttribute("classroom", "B강의장");
		request.setAttribute("student", new Person("홍길동", 15, "한양"));
		
		// sessionScope -> 서버 측 저장소
		HttpSession session = request.getSession(); // 세션객체 생성. 브라우저 하나당 하나씩 생성. 크롬 하나 열어서 여러 탭 쓰면 그 탭에서 다 로그인되어 사용되는 것이 이거
		session.setAttribute("academy", "KH 정보교육원");
		session.setAttribute("lecture", new Person("고길동", 19, "마포"));
		
		// requestScope와 sessionScope에 동일한 키 값으로 값을 담아보기
		request.setAttribute("key", "request");
		session.setAttribute("key", "session");
	
		// 응답 뷰 지정 -> 포워딩
		RequestDispatcher view = request.getRequestDispatcher("/WEB-INF/views/01_el.jsp");
		view.forward(request, response);
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}

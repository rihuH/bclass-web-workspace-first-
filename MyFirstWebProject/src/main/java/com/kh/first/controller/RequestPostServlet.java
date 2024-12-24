package com.kh.first.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

//톰캣이 하는 일 중 하나 >> 서블릿의 라이프 사이클을 관리함
@WebServlet(name = "RequestGetPostServlet", urlPatterns = { "/postTest" })
public class RequestPostServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public RequestPostServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		System.out.println("여기서 작업");
		// 1. 데이터 가공 -> 값 뽑기로 대체
		// 2. 요청 처리 -> 요번주는 패스
		// 3. 응답화면 지정
		
		// 0단계)
		// POST방식일 경우 인코딩 설정 ISO-8859-1 방식으로 바뀌기 때문에
		// POST방식일 때만 <값을 뽑기 전에 미리> (뽑고 나서는 바꿔도 의미 없음. 뽑기 전에 바꾸고 변경된 값을 뽑아야함)
		// 미리 UTF-8방식으로 변경해주어야함!!
		request.setCharacterEncoding("UTF-8");
		
		
		// 1단계) 값 뽑아서 변수에 대입하고 출력해보기
		// request.getParameter("key값") 또는 request.getParameterValues()//key값 같은 게 여러개가 올 때는 뒤에걸로 값 뽑아내기
		String name = request.getParameter("name"); // :String // ""
		System.out.println(name); // íê¸¸ë => 인코딩 방식이 바뀜. 아무나 못 알아보도록. 암호화까지는 아니지만
		
		String gender = request.getParameter("gender");
		System.out.println(gender); // null(체크 안 되어있을 때)  M F 
		
		int age = Integer.parseInt(request.getParameter("age"));
		System.out.println(age);
		
		String city = request.getParameter("city");
		System.out.println(city);
		
		Double height = Double.parseDouble(request.getParameter("height"));
		System.out.println(height);
		
		String[] foods = request.getParameterValues("food");
		if(foods != null) {
			System.out.println(String.join("-", foods)); //처음보는 ??
		} else {
			System.out.println("없음");
		}
		
		// 2단계
		// 요청처리~
		// Service -> DAO -> DB
		// List / VO/ int
		
		// 3단계
		// 응답데이터
		
		// 3_1. JSP를 이용해서 응답페이지를 만들기
		
		// JSP(JavaServerPage) : JAVA기반의 서버 사이드 스크립트 언어
		// ASP, PHP <= 비스므리한 친구들
		//----------------------------------------------------
		// 응답화면(JSP)에서 필요한 데이터를 넘겨줄 것(request에 담아서)
		// parameter는 getParameter("xx")만 있고/ setParameter() 는 없음 그래서 Parameter에는 담을 수가 없다.
		// 그래서 다른 곳에 담아야함
		// request에 attribute => 키-밸류 세트로 묶어서 담을 수 있음
		// request.setAttribute("키", "밸류");
		
		request.setAttribute("result",  "요청처리에 성공했습니다!");
		request.setAttribute("name", name);
		request.setAttribute("gender", gender);
		request.setAttribute("age", age);
		request.setAttribute("city",city);
		request.setAttribute("height", height);
		request.setAttribute("foods", foods);
		
		// 응답 페이지를 JSP에게 위임(배정)
		// 위임 시 필요한 객체 : RequestDispatcher 타입
		// cpu라는 연산장치 얘가 1가지 일만 할 수 있음 작업을 배정하는 것을 디스패처 한다고 표현함
		// 리퀘스트디스패처는 요청에 해당하는 응답을 배정해주는 역할을 의미
		// request.getRequestDispatcher("어떤 JSP에게 배정?? JSP파일의 경로"); : RequestDispatcher
		
		RequestDispatcher view =  request.getRequestDispatcher("/views/responsePage.jsp"); // 경로의 시작은 content directory인 webapp부터 시작함
		// 절대경로는 최상위폴더인 content directory부터 찾아가는 방식임.
		// / 를 적으면 이게 webapp이라는 의미가 된다.
		
		view.forward(request, response); 
		// forward메소드로 전달해준다.
		
		
		
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		System.out.println("정말로?? POST방식이면??? 여기에 들어옴???");
		doGet(request, response); // 작업의 편의성을 위해 doGet을 호출하도록 만들어둠 doGet에서만 작업하면 되도록
	}

}

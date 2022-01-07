package com.test.servlet;
//- javax.servlet.http.HttpServlet 클래스를 상속 받는다. > 간편함 > 선택
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Hello extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException{

		//3. 동적 HTML 문서 작성 구현
		response.setCharacterEncoding("UTF-8");
		PrintWriter writer = response.getWriter();
		
		writer.print("<html>");
		writer.print("<head>");
		writer.print("<meta charset='utf-8'>");
		writer.print("<title>Hello</title>");
		writer.print("</head>");
		writer.print("<body>");
		writer.print("<h1>Hello World!!</h1>");
		writer.print("<p>Servlet Pages</p>");
		writer.print("</body>");
		writer.print("<html>");
		
		writer.close(); // 동적으로 페이지 1장 완성
		
		//Ctrl + F11
		
		//﻿자바 파일은 웹(http://)에서 호출이 불가능해서 그런 일
		//http://localhost:8090/servlet/servlet/Hello
		
		//﻿자바를 브라우저를 통해서 호출할 방법이 필요하다!
		//- 가상 주소
		//- http://localhost:8090/servlet/hello.do
		// >> 이건 이클립스가 일종의 서비스를 해주는데 그건 버그를 못잡음;
		
		
		//자바 파일의 컴파일
		// 1. Ctrl + F11 > 사전 준비용
		// 2. 브라우저가 요청
		
		
	}
}


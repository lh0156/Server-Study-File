package com.test.mvc;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Hello extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		//서블릿 업무
		//- DB 작업
		//- 데이터 가공, 조작
		String name = "홍길동";
		int age = 20;
		
		req.setAttribute("name", name);
		req.setAttribute("age", age);
		
		
		//돌려줄 HTML 페이지 제작 중단!!!
		//PrintWriter writer;
		//writer.println("<div>" + name + "</div>");
		
		
		//JSP 페이지 호출하기 > 업무 위임
		RequestDispatcher dispatcher = req.getRequestDispatcher("/mvc/hello.jsp");
		
		dispatcher.forward(req, resp); //페이지 이동
		
	}
	
}












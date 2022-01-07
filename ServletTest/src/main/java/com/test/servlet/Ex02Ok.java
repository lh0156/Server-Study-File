package com.test.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Ex02Ok extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("GET 요청을 감지했습니다.");

		//전송하는 값 한글 깨지지 마!
		req.setCharacterEncoding("UTF-8");
		//가져오는 값 한글 깨지지 마!		
		resp.setCharacterEncoding("UTF-8");

		String data = req.getParameter("data");


		PrintWriter writer = resp.getWriter();

		writer.println("<html>");
		writer.println("<head>");
		writer.println("<meta charset='UTF-8'>");
		writer.println("</head>");
		writer.println("<body>");
		writer.println("<h1>결과</h1>");
		writer.println("data:" + data);
		writer.println("</body>");
		writer.println("</html>");

		writer.close();
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		System.out.println("POST 요청을 감지했습니다.");

		// <form action='/servlet/ex02ok.do' method='POST'>
		// <input type='text' name='data'>
		req.setCharacterEncoding("UTF-8");
		resp.setCharacterEncoding("UTF-8");

		String data = req.getParameter("data");


		PrintWriter writer = resp.getWriter();

		writer.println("<html>");
		writer.println("<head>");
		writer.println("<meta charset='UTF-8'>");
		writer.println("</head>");
		writer.println("<body>");
		writer.println("<h1>결과</h1>");
		writer.println("data:" + data);
		writer.println("</body>");
		writer.println("</html>");

		writer.close();
		
		
	}

}

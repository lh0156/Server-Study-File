package com.test.mvc;

import java.io.IOException;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

//Controller > 모든 흐름을 통제(제어)하는 역할
//			 > 자신은 일을 안함;; > 무조건 다른 객체에게 위임
@WebServlet("/address.do")
public class Address extends HttpServlet  {
	
	/* Address.java */
	@Override
	public void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException{
		
		// 1. DB 작업 > select
		// 2. ResultSet
		// 3. JSP 호출하기 + ResultSet 전달하기
		
		//DB 작업 위임 객체(담당자) > 모델
		AddressDAO dao = new AddressDAO();
		
		//ResultSet rs = dao.list();
		//req.setAttrivute("rs", rs);
		
		ArrayList<AddressDTO> list = dao.list();
		
		req.setAttribute("list", list);
		
		
		//View
		RequestDispatcher dispatcher = req.getRequestDispatcher("/mvc/address.jsp");
		dispatcher.forward(req, resp); // pageContext.forward() 동일
		
	}
}

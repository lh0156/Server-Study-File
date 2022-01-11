package com.test.mvc;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class EL extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException{
		
		//el.do?seq=5
		String seq = req.getParameter("seq");
		
		AddressDAO dao = new AddressDAO();
		AddressDTO dto = dao.get(seq);
		 
		
		req.setAttribute("num", 100);
		req.setAttribute("color", "노랑");
		
		req.setAttribute("dto", dto);
		req.setAttribute("list", list);
		
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/mvc/el.jsp");
		dispatcher.forward(req, resp);
		
	}
	
}

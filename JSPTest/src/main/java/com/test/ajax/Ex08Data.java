package com.test.ajax;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/ajax/ex08data.do")
public class Ex08Data extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		String name = req.getParameter("name");
		String lat = req.getParameter("lat");
		String lng = req.getParameter("lng");
		
		AjaxDAO dao = new AjaxDAO();
		
		MapDTO dto = new MapDTO();
		dto.setName(name);
		dto.setLat(lat);
		dto.setLng(lng);
		
		int result = dao.addMap(dto);
		
		PrintWriter writer = resp.getWriter();
		writer.print(result);
		writer.close();	

	}

}








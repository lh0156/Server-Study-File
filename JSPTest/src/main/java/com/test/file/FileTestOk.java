package com.test.file;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

@WebServlet("/file/filetestok.do")
public class FileTestOk extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		req.setCharacterEncoding("UTF-8");
		
		//<form method="POST" enctype="multipart/form-data">
		// - request의 getParameter 정상 동작하지 않는다.
		
		//String txt = req.getParameter("txt"); //텍스트 박스
		//System.out.println("txt: " + txt);
		
		//cos.jar > 해결책
		try {

			//Request -> (대신 + 파일업로드) -> MultipartRequest
			
			//MultipartRequest 객체 생성 순간 파일 업로드 처리도 같이 완료!!!
			MultipartRequest multi = new MultipartRequest(
											req,
											req.getRealPath("/files"),
											1024 * 1024 * 100,
											"UTF-8",
											new DefaultFileRenamePolicy()
										);
			
			//D:\class\server\.metadata\.plugins\org.eclipse.wst.server.core\tmp0\wtpwebapps\JSPTest\files
			
			
			System.out.println(req.getRealPath("/files"));
			
			String txt = multi.getParameter("txt");
			System.out.println("txt: " + txt);
			
			String orgfilename = multi.getOriginalFileName("attach");
			String filename = multi.getFilesystemName("attach");
			System.out.println("orgfilename: " + orgfilename);
			System.out.println("filename: " + filename);
			
			
			req.setAttribute("orgfilename", orgfilename);
			req.setAttribute("filename", filename);
			

		} catch (Exception e) {
			System.out.println("FileTestOk.doPost()");
			e.printStackTrace();
		}

		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/file/filetestok.jsp");
		dispatcher.forward(req, resp);
	}

}












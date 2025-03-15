package com.Servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.dbcp.pool2.PooledObjectState;

import com.DAO.PostDAO;
import com.Db.DBConnect;
import com.User.post;

@WebServlet("/AddNotesServlet")
public class AddNotesServlet extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		int uid=Integer.parseInt(request.getParameter("uid"));
		String title=request.getParameter("title");
		String content=request.getParameter("content");
 
		PostDAO dao=new PostDAO(DBConnect.getConn());
		boolean f=dao.addNotes(title, content, uid);
	if(f)
	{
		System.out.println("Data Inserted Suecssfully");
		response.sendRedirect("showNotes.jsp");
		
	}
	else
	{
		System.out.println("Data Not Inserted ");
		
	}
		
	}

}

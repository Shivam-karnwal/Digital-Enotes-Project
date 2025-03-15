package com.Servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.UserDAO;
import com.Db.DBConnect;
import com.User.UserDetails;

@WebServlet("/loginServlet") // Servlet mapping to URL
public class loginServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        // Sample code to handle login
        String email = request.getParameter("uemail");
        String password = request.getParameter("upassword");
        
        UserDetails us= new UserDetails();
        us.setEmail(email);
        us.setPassword(password);
        
      UserDAO dao=new UserDAO(DBConnect.getConn());
      UserDetails user=dao.logInUser(us);
       if(user!=null)
       {
    	  HttpSession session=request.getSession();
    	  session.setAttribute("userD", user);
    	   response.sendRedirect("home.jsp");

    	   
       }
       else {
    	   HttpSession session = request.getSession();
    	   session.setAttribute("login-failed","Invalid UserName and Password");
    	   response.sendRedirect("login.jsp");
       }
       
    }
}

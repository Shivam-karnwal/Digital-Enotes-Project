package com.Servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import com.DAO.PostDAO;
import com.Db.DBConnect;

@WebServlet("/NoteEditServlet")
public class NoteEditServlet extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			// Validate and parse note ID
			String noteIdStr = request.getParameter("noteid");
			String title = request.getParameter("title");
			String content = request.getParameter("content");

			HttpSession session = request.getSession();

			if (noteIdStr == null || noteIdStr.isEmpty()) {
				session.setAttribute("updateMsg", "Invalid Note ID.");
				response.sendRedirect("showNotes.jsp");
				return;
			}

			int noteId = Integer.parseInt(noteIdStr);

			// Ensure title and content are not empty
			if (title == null || title.trim().isEmpty() || content == null || content.trim().isEmpty()) {
				session.setAttribute("updateMsg", "Title and Content cannot be empty.");
				response.sendRedirect("showNotes.jsp");
				return;
			}

			// Update note
			PostDAO dao = new PostDAO(DBConnect.getConn());
			boolean success = dao.postUpdate(noteId, title.trim(), content.trim());

			if (success) {
				session.setAttribute("updateMsg", "Note updated successfully.");
			} else {
				session.setAttribute("updateMsg", "Failed to update note.");
			}

			response.sendRedirect("showNotes.jsp");

		} catch (NumberFormatException e) {
			e.printStackTrace();
			HttpSession session = request.getSession();
			session.setAttribute("updateMsg", "Invalid Note ID format.");
			response.sendRedirect("showNotes.jsp");
		} catch (Exception e) {
			e.printStackTrace();
			HttpSession session = request.getSession();
			session.setAttribute("updateMsg", "Something went wrong. Please try again.");
			response.sendRedirect("showNotes.jsp");
		}
	}
}

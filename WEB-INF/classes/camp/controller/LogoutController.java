package camp.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;

import camp.dao.UserDAO;

/**
 * Servlet implementation class LogoutController
 */

public class LogoutController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private UserDAO dao;
	HttpSession session;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public LogoutController() {
		super();
		dao = new UserDAO();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			// Retrieve the current session
			HttpSession session = request.getSession(false);

			if (session != null) {
				// Invalidate the session
				session.invalidate();
			}

			// Redirect to the login page
			response.sendRedirect("index.html");
		} catch (Throwable ex) {
			System.out.println(ex);
		}
	}

}

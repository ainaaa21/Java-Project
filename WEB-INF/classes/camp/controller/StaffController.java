package camp.controller;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
//import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

import camp.dao.StaffDAO;
import camp.dao.UserDAO;
import camp.model.StaffBean;
//import camp.model.UserBean;


public class StaffController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private StaffDAO dao;
	private UserDAO user;
	String action = "";
	String forward = "";
	RequestDispatcher view;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public StaffController() {
		super();
		dao = new StaffDAO();
		user = new UserDAO();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		action = request.getParameter("action");

		if (action.equalsIgnoreCase("viewProfileStaff")) {
			forward = "ProfileStaff.jsp";
			int userId = Integer.parseInt(request.getParameter("userId"));
			String userEmail=request.getParameter("userEmail");
			// Retrieve user details from the session
			HttpSession session = request.getSession();
			// Set staff data in the session
			System.out.println("Staff Data: " + StaffDAO.getStaffId(userId));
			System.out.println("Logged In User Data: " + UserDAO.getUserById(userId));
			session.setAttribute("staff", StaffDAO.getStaffId(userId));
			session.setAttribute("loggedInUser", UserDAO.getUserById(userId));		
			request.setAttribute("staff", StaffDAO.getStaffEmail(userEmail));
		}

		if (action.equalsIgnoreCase("updateStaff")) {
			forward = "updateStaff.jsp";
			int staffId = Integer.parseInt(request.getParameter("staffId"));
			request.setAttribute("staff", StaffDAO.getStaffId(staffId));
		}
		

		view = request.getRequestDispatcher(forward);
		view.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		StaffBean staff = new StaffBean();

		// Retrieve user details from the session
		HttpSession session = request.getSession();

		staff.setStaffName(request.getParameter("staffname"));
		staff.setStaffAddress(request.getParameter("staffaddress"));
		staff.setStaffContact(request.getParameter("staffcontact"));
		staff.setUserId(Integer.parseInt(request.getParameter("userid")));

		String staffId = request.getParameter("staffid");

		if (staffId == null || staffId.isEmpty()) {
			dao.addStaff(staff);
		} else {
			staff.setStaffId(Integer.parseInt(staffId));
			dao.updateStaff(staff);
		}
		// Set user data in the session
		session.setAttribute("loggedInUser", UserDAO.getUserById(staff.getUserId()));

		// Set staff data in the session
		session.setAttribute("staff", StaffDAO.getStaffId(staff.getStaffId()));

		view = request.getRequestDispatcher("homeStaff.jsp");
		view.forward(request, response);
	}
}

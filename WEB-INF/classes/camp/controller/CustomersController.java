package camp.controller;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
//import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

import camp.dao.CustomerDAO;
import camp.model.CustomerBean;
import camp.dao.StaffDAO;
import camp.dao.UserDAO;
//import camp.model.UserBean;

/**
 * Servlet implementation class CustomersController
 */
public class CustomersController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private CustomerDAO dao;
	private UserDAO user;
	String action = "";
	String forward = "";
	RequestDispatcher view;
	int staffId;
	

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public CustomersController() {
		super();
		dao = new CustomerDAO();
		user = new UserDAO();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		action = request.getParameter("action");

		if (action.equalsIgnoreCase("viewAllCustomers")) {
		    forward = "CustomerList.jsp";
		    try {
		    	request.setAttribute("customer", CustomerDAO.getAllCustomers());
				RequestDispatcher view = request.getRequestDispatcher("CustomerList.jsp");
				view.forward(request, response);	
		    } catch (Exception e) {
		        e.printStackTrace();
		    }
		}

		if (action.equalsIgnoreCase("viewProfileCustomer")) {
			forward = "custViewProfile.jsp";
			int userId = Integer.parseInt(request.getParameter("userId"));
			String userEmail=request.getParameter("userEmail");
			// Retrieve user details from the session
			HttpSession session = request.getSession();
			// Set staff data in the session
			System.out.println("Customer Data: " + CustomerDAO.getCustomerId(userId));
			System.out.println("Logged In User Data: " + UserDAO.getUserById(userId));
			session.setAttribute("customer", CustomerDAO.getCustomerId(userId));
			session.setAttribute("loggedInUser", UserDAO.getUserById(userId));		
			request.setAttribute("customer", CustomerDAO.getCustomerEmail(userEmail));
		}

		if (action.equalsIgnoreCase("updateCustomerByStaff")) {
			forward = "updateCustomerStaff.jsp";
			int custId = Integer.parseInt(request.getParameter("custId"));
			request.setAttribute("customer", CustomerDAO.getCustomerById(custId));
			staffId = Integer.parseInt(request.getParameter("staffId"));
			request.setAttribute("staff", StaffDAO.getStaffId(staffId));
		}

		if (action.equalsIgnoreCase("backHome")) {
			int custId = Integer.parseInt(request.getParameter("custId"));
			request.setAttribute("customer", CustomerDAO.getCustomerById(custId));
			forward = "custMain.jsp";
			System.out.println("Back to Customer Home");
			
		}
		
		view = request.getRequestDispatcher(forward);
		view.forward(request, response);

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		CustomerBean customer = new CustomerBean();
		
		// Retrieve user details from the session
		HttpSession session = request.getSession();
				
		customer.setCustName(request.getParameter("custName"));
		customer.setCustAddress(request.getParameter("custAddress"));
		customer.setCustContact(request.getParameter("custContact"));
		customer.setUserId(Integer.parseInt(request.getParameter("userId")));

		String custId = request.getParameter("custId");
		
		if (custId == null || custId.isEmpty())
			CustomerDAO.addCustomer(customer);
		
		else {
			customer.setCustId(Integer.parseInt(custId));
			dao.updateCustomer(customer);
		}
		
		// Set user data in the session
		session.setAttribute("loggedInUser", UserDAO.getUserById(customer.getUserId()));

		// Set customer data in the session
		session.setAttribute("customer", CustomerDAO.getCustomerId(customer.getCustId()));
				
		if(action.equalsIgnoreCase("updateCustomer"))
		{
			forward = "homeCustomer.jsp";
			request.setAttribute("customer", CustomerDAO.getCustomerById(Integer.parseInt(custId)));
		}
		
		if(action.equalsIgnoreCase("updateCustomerByStaff"))
		{
			forward = "listCustomers.jsp";
			request.setAttribute("staff", StaffDAO.getStaffId(staffId));
			request.setAttribute("customers", CustomerDAO.getAllCustomers());
		}
		
		view = request.getRequestDispatcher("custMain.jsp");
		view.forward(request, response);
		
	}

}

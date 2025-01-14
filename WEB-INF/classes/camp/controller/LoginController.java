package camp.controller;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

import camp.dao.CustomerDAO;
import camp.dao.LogInDAO;
import camp.dao.StaffDAO;
import camp.dao.UserDAO;
import camp.model.UserBean;

public class LoginController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private StaffDAO dao;
    private CustomerDAO dao2;
    private UserDAO user;

    public LoginController() {
        super();
        dao = new StaffDAO();
        dao2 = new CustomerDAO();
        user = new UserDAO();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");

        if ("viewProfileStaff".equalsIgnoreCase(action)) {
            int userId = Integer.parseInt(request.getParameter("userId"));
            String userEmail = request.getParameter("userEmail");

            HttpSession session = request.getSession();
            session.setAttribute("staff", StaffDAO.getStaffId(userId));
            session.setAttribute("loggedInUser", UserDAO.getUserById(userId));
            request.setAttribute("staff", StaffDAO.getStaffEmail(userEmail));

            RequestDispatcher dispatcher = request.getRequestDispatcher("ProfileStaff.jsp");
            dispatcher.forward(request, response);
        }
        
        else if ("viewProfileCustomer".equalsIgnoreCase(action)) {
            int userId = Integer.parseInt(request.getParameter("userId"));
            String userEmail = request.getParameter("userEmail");

            HttpSession session = request.getSession();
            session.setAttribute("customer", CustomerDAO.getCustomerId(userId));
            session.setAttribute("loggedInUser", UserDAO.getUserById(userId));
            request.setAttribute("customer", CustomerDAO.getCustomerEmail(userEmail));

            RequestDispatcher dispatcher = request.getRequestDispatcher("custViewProfile.jsp");
            dispatcher.forward(request, response);
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            String userEmail = request.getParameter("useremail");
            String userPassword = request.getParameter("userpassword");

            String role = LogInDAO.getUserRole(userEmail, userPassword);

            if (role != null) {
                UserBean loggedInUser = UserDAO.getUserByEmail(userEmail);

                request.setAttribute("user", loggedInUser);

                HttpSession session = request.getSession(true);
                session.setAttribute("sessionEmail", userEmail);
                session.setAttribute("sessionRole", role);

                if ("staff".equalsIgnoreCase(role)) {
                    response.sendRedirect("HomepageStaff.jsp?userId=" + loggedInUser.getUserId() + "&userEmail=" + userEmail);
                } else {
                    response.sendRedirect("custMain.jsp?userId=?" + loggedInUser.getUserId() + "&userEmail=" + userEmail);
                }
            } else {
                request.setAttribute("errorMessage", "Invalid email or password");
                RequestDispatcher view = request.getRequestDispatcher("login.jsp");
                view.forward(request, response);
            }
        } catch (Throwable ex) {
            ex.printStackTrace(); // Print the exception stack trace for debugging purposes
            response.sendRedirect("errorPage.jsp"); // Redirect to an error page
        }
    }
}

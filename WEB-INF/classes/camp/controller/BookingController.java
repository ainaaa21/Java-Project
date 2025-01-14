package camp.controller;

import java.io.IOException;
import java.sql.Date;
//import java.util.List;

import camp.dao.BookingDAO;
import camp.dao.CustomerDAO;
import camp.model.BookingBean;
import camp.model.CustomerBean;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class BookingController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private BookingDAO dao;
	String action = "";
	String forward = "";
	RequestDispatcher view;

	public BookingController() {
		super();
		dao = new BookingDAO();
		// TODO Auto-generated constructor stub
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		action = request.getParameter("action");

		if (action != null && action.equalsIgnoreCase("deleteBooking")) {
            int bookId = Integer.parseInt(request.getParameter("bookId"));
            dao.deleteBooking(bookId);
            response.sendRedirect("BookingStaff.jsp");
            return; // Exit the method to avoid forwarding the request
        }

		if (action.equalsIgnoreCase("viewBooking")) {
			forward = "custViewHistory.jsp";
			int custId = Integer.parseInt(request.getParameter("custId"));
			int bookId = Integer.parseInt(request.getParameter("bookId"));
			request.setAttribute("customer", CustomerDAO.getCustomerById(custId));
			request.setAttribute("booking", BookingDAO.getAllBookingsByCust(custId));
		}

		if (action.equalsIgnoreCase("historyBooking")) {
			forward = "custHistory.jsp";
			int custId = Integer.parseInt(request.getParameter("custId"));
			request.setAttribute("customer", CustomerDAO.getCustomerById(custId));
			request.setAttribute("bookings", BookingDAO.getAllBookingsByCust(custId));
		}
		
		if(action.equalsIgnoreCase("addBooking"))
		{
			forward = "bookingForm.jsp";
			int custId = Integer.parseInt(request.getParameter("custId"));
			CustomerBean cust = CustomerDAO.getCustomerById(custId);
			
			if(cust.getCustName().isEmpty() && cust.getCustAddress().isEmpty() && cust.getCustContact().isEmpty())
			{
				forward = "incomplete.jsp";
				request.setAttribute("customer", CustomerDAO.getCustomerById(custId));
			}
			else
			{
			
			request.setAttribute("customer", CustomerDAO.getCustomerById(custId));
			}
		}

		view = request.getRequestDispatcher(forward);
		view.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		BookingBean book = new BookingBean();

		// Set properties from the request parameters
		book.setCheckIn(Date.valueOf(request.getParameter("checkIn")));
		book.setCheckOut(Date.valueOf(request.getParameter("checkOut")));
		book.setAddOn(request.getParameter("addOn"));
		book.setCustId(Integer.parseInt(request.getParameter("custId")));
		book.setCampType(request.getParameter("campType"));
		book.setCampPrice(Double.parseDouble(request.getParameter("campPrice")));

		// Your existing code for forwarding and updating/adding bookings
		String bookId = request.getParameter("bookId");

		if (bookId == null || bookId.isEmpty()) {
            // New booking
            forward = "custMain.jsp";
            dao.addBooking(book);
            int custId = Integer.parseInt(request.getParameter("custId"));
            request.setAttribute("customer", CustomerDAO.getCustomerById(custId));
            request.setAttribute("message", "Booking added successfully.");
        } else {
            // Existing booking
            forward = "listBookings.jsp";
            book.setBookId(Integer.parseInt(bookId));
            dao.updateBooking(book);
            request.setAttribute("bookings", BookingDAO.getAllBookings());
            request.setAttribute("message", "Booking updated successfully.");
        }

		view = request.getRequestDispatcher(forward);
		view.forward(request, response);
	}

}
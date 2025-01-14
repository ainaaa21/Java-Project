package camp.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import camp.connection.ConnectionManager;
import camp.model.BookingBean;

public class BookingDAO {
	static Connection con = null;
	static PreparedStatement ps = null;
	static ResultSet rs = null;

	// Add booking
	public void addBooking(BookingBean bean) {
		Date checkIn = bean.getCheckIn();
		Date checkOut = bean.getCheckOut();
		String addOn = bean.getAddOn();
		int custId = bean.getCustId();
		String campType = bean.getCampType();
		double campPrice = bean.getCampPrice();
		try {
			con = ConnectionManager.getConnection();
			String sql = "INSERT INTO booking(checkIn, checkOut, addOn, custId, campType, campPrice) VALUES(?, ?, ?, ?, ?, ?)";
			ps = con.prepareStatement(sql);
			ps.setDate(1, new java.sql.Date(checkIn.getTime()));
			ps.setDate(2, new java.sql.Date(checkOut.getTime()));
			ps.setString(3, addOn);
			ps.setInt(4, custId);
			ps.setString(5, campType);
			ps.setDouble(6, campPrice);
			ps.executeUpdate();
			con.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	// Get all bookings
	public static List<BookingBean> getAllBookings() {
		List<BookingBean> bookings = new ArrayList<BookingBean>();
		try {
			con = ConnectionManager.getConnection();
			String sql = "SELECT * FROM booking ORDER BY bookId";
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			while (rs.next()) {
				BookingBean booking = new BookingBean();
				booking.setBookId(rs.getInt("bookId"));
				booking.setCheckIn(rs.getDate("checkIn"));
				booking.setCheckOut(rs.getDate("checkOut"));
				booking.setAddOn(rs.getString("addOn"));
				booking.setCustId(rs.getInt("custId"));
				booking.setCampType(rs.getString("campType"));
				booking.setCampPrice(rs.getDouble("campPrice"));

				bookings.add(booking);
			}
			con.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return bookings;
	}

// Get all bookings by customer ID
	public static List<BookingBean> getAllBookingsByCust(int custId) {
		List<BookingBean> bookings = new ArrayList<BookingBean>();
		try {
			con = ConnectionManager.getConnection();
			String sql = "SELECT * FROM booking WHERE custId=? ORDER BY bookId";
			ps = con.prepareStatement(sql);
			ps.setInt(1, custId);
			//ps.setInt(2,  bookId);

			rs = ps.executeQuery();
			while (rs.next()) {
				BookingBean booking = new BookingBean();
				booking.setBookId(rs.getInt("bookId"));
				booking.setCheckIn(rs.getDate("checkIn"));
				booking.setCheckOut(rs.getDate("checkOut"));
				booking.setAddOn(rs.getString("addOn"));
				booking.setCustId(rs.getInt("custId"));
				booking.setCampType(rs.getString("campType"));
				booking.setCampPrice(rs.getDouble("campPrice"));
				bookings.add(booking);
			}
			con.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return bookings;
	}

	// Get all bookings by booking ID
	public static List<BookingBean> getAllBookingsByBookId(int bookId) {
		List<BookingBean> bookings = new ArrayList<BookingBean>();
		try {
			con = ConnectionManager.getConnection();
			String sql = "SELECT * FROM booking WHERE bookId=? ORDER BY bookId";
			ps = con.prepareStatement(sql);
			ps.setInt(1, bookId);
			rs = ps.executeQuery();
			while (rs.next()) {
				BookingBean booking = new BookingBean();
				booking.setBookId(rs.getInt("bookId"));
				booking.setCheckIn(rs.getDate("checkIn"));
				booking.setCheckOut(rs.getDate("checkOut"));
				booking.setAddOn(rs.getString("addOn"));
				booking.setCustId(rs.getInt("custId"));
				booking.setCampType(rs.getString("campType"));
				booking.setCampPrice(rs.getDouble("campPrice"));
				bookings.add(booking);
			}
			con.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return bookings;
	}

	// Update booking - only update specific fields
	public void updateBooking(BookingBean bean) {
		int bookId = bean.getBookId();
		Date checkIn = bean.getCheckIn();
		String addOn = bean.getAddOn();
		Date checkOut = bean.getCheckOut();
		try {
			con = ConnectionManager.getConnection();
			String sql = "UPDATE booking SET checkIn=?, addOn=?, checkOut=? WHERE bookId=?";
			ps = con.prepareStatement(sql);
			ps.setDate(1, new java.sql.Date(checkIn.getTime()));
			ps.setString(2, addOn);
			ps.setDate(3, new java.sql.Date(checkOut.getTime()));
			ps.setInt(4, bookId);
			ps.executeUpdate();
			con.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	// Delete booking by ID
	public void deleteBooking(int bookId) {
		try {
			con = ConnectionManager.getConnection();
			String sql = "DELETE FROM booking WHERE bookId=?";
			ps = con.prepareStatement(sql);
			ps.setInt(1, bookId);
			ps.executeUpdate();
			con.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}

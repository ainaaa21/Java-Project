package camp.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import camp.connection.ConnectionManager;
import camp.model.CustomerBean;
//import camp.model.StaffBean;
import camp.model.UserBean;

public class CustomerDAO {
	static Connection con = null;
	static ResultSet rs = null;
	static PreparedStatement ps = null;
	static Statement stmt = null;

	private int custId;
	private static int userId;
	private static String custName;
	private static String custAddress;
	private static String custContact;
	private static String custMail;

	// add customer
	public static void addCustomer(CustomerBean bean) {
		// get customer
		custName = bean.getCustName();
		custAddress = bean.getCustAddress();
		custContact = bean.getCustContact();
		userId = bean.getUserId();

		try {

			// call getConnection() method from ConnectionManager class
			con = ConnectionManager.getConnection();

			// 3. create statement
			String sql = "INSERT INTO customer(custName, custAddress, custContact, custMail, userId) VALUES(?, ?, ?, ?, ?)";
			ps = con.prepareStatement(sql);
			ps.setString(1, custName);
			ps.setString(2, custAddress);
			ps.setString(3, custContact);
			ps.setString(4, custMail);
			ps.setInt(5, userId);

			// 4. execute query
			ps.executeUpdate();

			// 5. close connection
			con.close();

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	// register customer
	public void register(CustomerBean bean) {
		// get customer
		custId = bean.getCustId();
		custName = bean.getCustName();
		custAddress = bean.getCustAddress();
		custContact = bean.getCustContact();
		userId = bean.getUserId();

		try {

			// call getConnection() method from ConnectionManager class
			con = ConnectionManager.getConnection();

			// 3. create statement
			String sql = "UPDATE customer SET custName=?, custAddress=?, custContact=?, custMail=? WHERE userId=?";
			ps = con.prepareStatement(sql);
			ps.setString(1, custName);
			ps.setString(2, custAddress);
			ps.setString(3, custContact);
			ps.setString(4, custMail);
			ps.setInt(5, userId);

			// 4. execute query
			ps.executeUpdate();

			// 5. close connection
			con.close();

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	// get all customers
	public static List<CustomerBean> getAllCustomers() {
		List<CustomerBean> customers = new ArrayList<CustomerBean>();

		try {
			con = ConnectionManager.getConnection();
			String sql = "SELECT * FROM customer ORDER BY custId";
			stmt = con.createStatement();
			rs = stmt.executeQuery(sql);

			while (rs.next()) {
				CustomerBean customer = new CustomerBean();
				customer.setCustId(rs.getInt("custId"));
				customer.setCustName(rs.getString("custName"));
				customer.setCustContact(rs.getString("custContact"));
				customers.add(customer);
			}
			con.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return customers;
	}

	// get customer by custId
	public static CustomerBean getCustomerById(int custId) {
		CustomerBean customer = new CustomerBean();

		try {

			// call getConnection() method from ConnectionManager class
			con = ConnectionManager.getConnection();

			// 3. create statement
			String sql = "SELECT * FROM customer WHERE custId=?";
			ps = con.prepareStatement(sql);
			ps.setInt(1, custId);

			// 4. execute query
			rs = ps.executeQuery();
			if (rs.next()) {
				customer.setCustId(rs.getInt("custId"));
				customer.setCustName(rs.getString("custName"));
				customer.setCustAddress(rs.getString("custAddress"));
				customer.setCustContact(rs.getString("custContact"));
				customer.setUserId(rs.getInt("userId"));
			}

			// 5. close connection
			con.close();

		} catch (Exception e) {
			e.printStackTrace();
		}

		return customer;
	}

	// get customer by userId
	public static CustomerBean getCustomerId(int userId) {
		CustomerBean customer = new CustomerBean();

		try {

			// call getConnection() method from ConnectionManager class
			con = ConnectionManager.getConnection();

			// 3. create statement
			String sql = "SELECT * FROM customer WHERE userId=?";
			ps = con.prepareStatement(sql);
			ps.setInt(1, userId);

			// 4. execute query
			rs = ps.executeQuery();

			if (rs.next()) {
				customer.setCustId(rs.getInt("custId"));
				customer.setCustName(rs.getString("custName"));
				customer.setCustAddress(rs.getString("custAddress"));
				customer.setCustContact(rs.getString("custContact"));
				customer.setUserId(rs.getInt("userId"));
			}

			// 5. close connection
			con.close();

		} catch (Exception e) {
			e.printStackTrace();
		}

		return customer;
	}

	// update customer
	public void updateCustomer(CustomerBean bean) {
		// get customer
		custId = bean.getCustId();
		custName = bean.getCustName();
		custAddress = bean.getCustAddress();
		custContact = bean.getCustContact();
		userId = bean.getUserId();

		try {

			// call getConnection() method from ConnectionManager class
			con = ConnectionManager.getConnection();

			// 3. create statement
			String sql = "UPDATE customer SET custName=?, custAddress=?, custContact=?, custMail=?, userId=? WHERE custId=?";
			ps = con.prepareStatement(sql);
			ps.setString(1, custName);
			ps.setString(2, custAddress);
			ps.setString(3, custContact);
			ps.setString(4, custMail);
			ps.setInt(5, userId);
			ps.setInt(6, custId);

			// 4. execute query
			ps.executeUpdate();

			// 5. close connection
			con.close();

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	// delete customer
	public void deleteCustomer(int custId) {
		try {

			// call getConnection() method from ConnectionManager class
			con = ConnectionManager.getConnection();

			// 3. create statement
			String sql = "DELETE FROM customer WHERE custId=?";
			ps = con.prepareStatement(sql);
			ps.setInt(1, custId);

			// 4. execute query
			ps.executeUpdate();

			// 5. close connection
			con.close();

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	// get customer by email
	public static CustomerBean getCustomerEmail(String email) {
		CustomerBean customer = new CustomerBean();
		UserBean user = new UserBean();
		try {

			// call getConnection() method from ConnectionManager class
			con = ConnectionManager.getConnection();

			// 3. create statement
			String sql = "SELECT u.*, s.*\r\n" + "FROM user u\r\n" + "LEFT JOIN customer c ON u.custId = c.custId\r\n"
					+ "WHERE u.email = ?;\r\n";
			ps = con.prepareStatement(sql);
			ps.setString(1, email);

			// 4. execute query
			rs = ps.executeQuery();

			if (rs.next()) {
				customer.setCustName(rs.getString("custName"));
				user.setUserEmail(rs.getString("custMail"));
				customer.setCustContact(rs.getString("custContact"));
				customer.setCustAddress(rs.getString("custAddress"));
				customer.setUserId(rs.getInt("userId"));
			}

			// 5. close connection
			con.close();

		} catch (Exception e) {
			e.printStackTrace();
		}
		return customer;
	}
	
	// get customers by name (case-insensitive) - new method
		public static List<CustomerBean> searchCustomersByName(String name) {
		    List<CustomerBean> customers = new ArrayList<>();

		    try {
		        con = ConnectionManager.getConnection();
		        String sql = "SELECT * FROM customer WHERE LOWER(custName) LIKE LOWER(?)";
		        ps = con.prepareStatement(sql);
		        ps.setString(1, "%" + name + "%");
		        rs = ps.executeQuery();

		        while (rs.next()) {
		            CustomerBean customer = new CustomerBean();
		            customer.setCustId(rs.getInt("custId"));
		            customer.setCustName(rs.getString("custName"));
		            customer.setCustContact(rs.getString("custContact"));
		            customers.add(customer);
		        }
		        con.close();
		    } catch (SQLException e) {
		        e.printStackTrace();
		    }

		    return customers;
		}

}

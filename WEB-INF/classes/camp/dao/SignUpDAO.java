package camp.dao;

import java.sql.Connection;
//import java.sql.Driver;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import camp.model.SignUpBean; 

public class SignUpDAO {

	private String dbUrl = "jdbc:mysql://localhost/campsite";
	private String dbUname = "root";
	private String dbPassword = "";
	private String dbDriver = "com.mysql.jdbc.Driver";

	public void loadDriver(String dbDriver) {
		try {
			Class.forName(dbDriver);
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public Connection getConnection() {
		Connection con = null;
		try {
			con = DriverManager.getConnection(dbUrl, dbUname, dbPassword);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return con;
	}

	// insert user details
	public String insert(SignUpBean user) {
		loadDriver(dbDriver);
		Connection con = getConnection();
		String result = "Data entered successfully";
		String sqlUser = "INSERT INTO user (name, address, contact, email, password, role) VALUES (?, ?, ?, ?, ?, ?)";
		String sqlCustomer = "INSERT INTO customer (custName, custAddress, custContact) VALUES (?, ?, ?)";
		String sqlStaff = "INSERT INTO staff (staffName, staffAddress, staffContact) VALUES (?, ?, ?)";

		PreparedStatement psUser, psRole;

		try {
			con.setAutoCommit(false);

			// Insert into the user table
			psUser = con.prepareStatement(sqlUser, Statement.RETURN_GENERATED_KEYS);
			psUser.setString(1, user.getName());
			psUser.setString(2, user.getAddress());
			psUser.setString(3, user.getContact());
			psUser.setString(4, user.getEmail());
			psUser.setString(5, user.getPassword());
			psUser.setString(6, user.getRole());
			psUser.executeUpdate();

			// Retrieve the generated user ID
			ResultSet generatedKeys = psUser.getGeneratedKeys();
			int userId = -1;
			if (generatedKeys.next()) {
				userId = generatedKeys.getInt(1);
			} else {
				throw new SQLException("Failed to retrieve user ID.");
			}

			// Insert into the corresponding role table (Customer or Staff)
			if ("Customer".equalsIgnoreCase(user.getRole())) {
				psRole = con.prepareStatement(sqlCustomer);
				psRole.setString(1, user.getName());
				psRole.setString(2, user.getAddress());
				psRole.setString(3, user.getContact());
				psRole.executeUpdate();
			} else if ("Staff".equalsIgnoreCase(user.getRole())) {
				psRole = con.prepareStatement(sqlStaff);
				psRole.setString(1, user.getName());
				psRole.setString(2, user.getAddress());
				psRole.setString(3, user.getContact());
				psRole.executeUpdate();
			}

			con.commit();
			con.setAutoCommit(true);

		} catch (SQLException e) {
			// Rollback in case of an error
			try {
				con.rollback();
			} catch (SQLException rollbackException) {
				rollbackException.printStackTrace();
			}
			e.printStackTrace();
			result = "Data not entered";
		}

		return result;
	}

}

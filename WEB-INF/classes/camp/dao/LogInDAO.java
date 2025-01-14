package camp.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import camp.connection.ConnectionManager;

public class LogInDAO {
	private static final String SELECT_USER_QUERY = "SELECT * FROM user WHERE email = ? AND password = ?";

	public static String getUserRole(String email, String password) {
		String role = null;

		try (Connection con = ConnectionManager.getConnection();
				PreparedStatement preparedStatement = con.prepareStatement(SELECT_USER_QUERY)) {
			preparedStatement.setString(1, email);
			preparedStatement.setString(2, password);

			try (ResultSet resultSet = preparedStatement.executeQuery()) {
				if (resultSet.next()) {
					role = resultSet.getString("role");

					// Assuming role 'staff', you can pass the email to StaffDAO
					if ("staff".equalsIgnoreCase(role)) {
						StaffDAO.getStaffEmail(email);
					}
					
					else if ("customer".equalsIgnoreCase(role)) {
						CustomerDAO.getCustomerEmail(email);
					}

				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return role;
	}
	// Static method to check the validity of login credentials
	public static boolean isValidLogin(String email, String password) {
		try (Connection con = ConnectionManager.getConnection();
				PreparedStatement preparedStatement = con.prepareStatement("SELECT * FROM user WHERE email = ? AND password = ?")) {
			preparedStatement.setString(1, email);
			preparedStatement.setString(2, password);

			try (ResultSet resultSet = preparedStatement.executeQuery()) {
				return resultSet.next(); // Returns true if there is at least one row (login is valid)
			}
		} catch (SQLException e) {
			e.printStackTrace();
			return false; // Handle exceptions and return false for invalid login
		}
	}
}

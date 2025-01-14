package camp.dao;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import camp.connection.ConnectionManager;
import camp.model.UserBean;

public class UserDAO {
	
	static Connection con = null;
	static ResultSet rs = null; 
	static PreparedStatement ps = null;
	static Statement stmt = null;
	
	static int userId;
	public static String userEmail;
	static String userPassword;
	static String userRole;
	static String query;
	
	// method for login
	public static UserBean getUserByEmail1(String email) {
        UserBean user = null;

        try (Connection con = ConnectionManager.getConnection();
             PreparedStatement preparedStatement = con.prepareStatement("SELECT * FROM user.campsite WHERE email=?")) {
            preparedStatement.setString(1, email);

            try (ResultSet resultSet = preparedStatement.executeQuery()) {
                if (resultSet.next()) {
                    user = new UserBean();
                    user.setUserId(resultSet.getInt("userId"));
                    user.setUserEmail(resultSet.getString("userEmail"));
                    user.setUserPassword(resultSet.getString("userPassword"));
                    user.setUserRole(resultSet.getString("userRole"));
                    user.setValid(true);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return user;
    }

	// add new user (sign-up)
	public static int add (UserBean bean) throws NoSuchAlgorithmException{
		//get email and password
		userEmail = bean.getUserEmail();
		userPassword = bean.getUserPassword();
		userRole = bean.getUserRole();

		MessageDigest md = MessageDigest.getInstance("MD5");
		md.update(userPassword.getBytes());

		byte byteData[] = md.digest();

		//convert the byte to hex format
		StringBuffer sb = new StringBuffer();
		for (int i = 0; i < byteData.length; i++) {
			sb.append(Integer.toString((byteData[i] & 0xff) + 0x100, 16).substring(1));
		}
		try {
			//call getConnection() method 
			con = ConnectionManager.getConnection();
			
			//3. create statement  
			String sql = "INSERT INTO user(userEmail, userPassword, userRole) VALUES(?, ?, ?)";
		    ps = con.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
		    ps.setString(1, userEmail);
		    ps.setString(2, userPassword);
		    ps.setString(3, userRole);

		    // Execute query and get generated keys
		    ps.executeUpdate();
		    ResultSet generatedKeys = ps.getGeneratedKeys();

		    if (generatedKeys.next()) {
		    }
			
			//4. execute query
			ps.executeUpdate();			
			
			//5. close connection
			generatedKeys.close();
		    ps.close();
			con.close();
		}catch(Exception e) {
			e.printStackTrace();		
		}
		return userId;
	}
	
	
	//method to get user
		public static UserBean getUser(UserBean bean)  {   
			//get email
			userEmail = bean.getUserEmail();
			String searchQuery = "select * from user where userEmail='" + userEmail + "'";
			try {
				//call getConnection() method 
				con = ConnectionManager.getConnection();
				//3. create statement  
				stmt = con.createStatement();
				//execute statement
				rs = stmt.executeQuery(searchQuery);

				boolean more = rs.next();

				// if user exists set the isValid variable to true
				if (more) {
					String userEmail = rs.getString("userEmail");
					bean.setUserEmail(userEmail);
					bean.setValid(true);
				}
				// if user does not exist set the isValid variable to false
				else if (!more) {
					bean.setValid(false);
				}
				//5. close connection
				con.close();	
			}catch(Exception e) {
				e.printStackTrace();		
			}
			return bean;
		}

		//get user by email
		public static UserBean getUserByEmail(String userEmail) {
			UserBean us = new UserBean();
			try {
				//call getConnection() method 
				con = ConnectionManager.getConnection();
				//3. create statement  
				ps=con.prepareStatement("select * from user where userEmail=?");
				ps.setString(1, userEmail);
				//4. execute query
				rs = ps.executeQuery();

				if (rs.next()) {	            
					us.setUserId(rs.getInt("userId"));
					us.setUserEmail(rs.getString("userEmail"));				
					us.setUserPassword(rs.getString("userPassword"));

				}
				//5. close connection
				con.close();
			}catch(Exception e) {
				e.printStackTrace();		
			}

			return us;
		}

		//get user by id
		public static UserBean getUserById(int userId) {
			UserBean us = new UserBean();
			try {
				//call getConnection() method 
				con = ConnectionManager.getConnection();
				//3. create statement  
				ps=con.prepareStatement("select * from user where userId=?");
				ps.setInt(1, userId);
				//4. execute query
				rs = ps.executeQuery();

				if (rs.next()) {
					us.setUserId(rs.getInt("userId"));
					us.setUserEmail(rs.getString("userEmail"));				
					us.setUserPassword(rs.getString("userPassword"));

				}
				//5. close connection
				con.close();
			}catch(Exception e) {
				e.printStackTrace();		
			}

			return us;
		}
		

		public static List<UserBean> getUserId() {
			List<UserBean> users = new ArrayList<UserBean>();
			try {
				//call getConnection() method 
				con = ConnectionManager.getConnection();
				//3. create statement  
				stmt = con.createStatement();
				//4. execute query
				rs = stmt.executeQuery("select userId, userEmail from user");

				while (rs.next()) {
					UserBean us = new UserBean();
					us.setUserId(rs.getInt("userId"));
					us.setUserEmail(rs.getString("userEmail"));
					users.add(us);

				}
				//5. close connection
				con.close();
			}catch(Exception e) {
				e.printStackTrace();		
			}

			return users;
		}			
		//delete staff and supplier from table users
		public void deleteUser(int userId) {
			try {
				//call getConnection() method 
				con = ConnectionManager.getConnection();
				//3. create statement  
				ps=con.prepareStatement("delete from user where userId=?");
				ps.setInt(1, userId);
				//4. execute query
				ps.executeUpdate();

				//5. close connection
				con.close();
			}catch(Exception e) {
				e.printStackTrace();		
			}
		}
}
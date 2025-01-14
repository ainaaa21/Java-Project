package camp.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import camp.model.StaffBean;
import camp.model.UserBean;
import camp.connection.ConnectionManager;

public class StaffDAO {
	static Connection con = null;
	static ResultSet rs = null;
	static PreparedStatement ps = null;
	static Statement stmt = null;

	private static int staffId, userId;
	private static String staffName;
	private static String staffAddress;
	private static String staffContact;

	// add staff
	public static void addStaff(StaffBean bean)
	{
		// get staff
		staffName = bean.getStaffName();
		staffAddress = bean.getStaffAddress();
		staffContact = bean.getStaffContact();
		userId = bean.getUserId();

		try {

			//call getConnection() method from ConnectionManager class			
			con = ConnectionManager.getConnection(); 

			//3. create statement
			String sql = "INSERT INTO staff(staffname, staffaddress, staffphone, userid) VALUES(?, ?, ?, ?)";
			ps = con.prepareStatement(sql);
			ps.setString(1, staffName);
			ps.setString(2, staffAddress);
			ps.setString(3, staffContact);
			ps.setInt(4, userId);

			//4. execute query
			ps.executeUpdate();

			//5. close connection
			con.close();

		}catch(Exception e) {
			e.printStackTrace();
		}
	}

	// register staff
	public void register(StaffBean bean)
	{
		// get staff
		staffId = bean.getStaffId();
		staffName = bean.getStaffName();
		staffAddress = bean.getStaffAddress();
		staffContact = bean.getStaffContact();
		userId = bean.getUserId();

		try {

			//call getConnection() method from ConnectionManager class			
			con = ConnectionManager.getConnection(); 

			//3. create statement
			String sql = "UPDATE staff SET staffname=?, staffaddress=?, staffphone=? WHERE userid=?";
			ps = con.prepareStatement(sql);
			ps.setString(1, staffName);
			ps.setString(2, staffAddress);
			ps.setString(3, staffContact);
			ps.setInt(4, userId);

			//4. execute query
			ps.executeUpdate();

			//5. close connection
			con.close();

		}catch(Exception e) {
			e.printStackTrace();
		}
	}

	// get all staffs
	public static List<StaffBean> getAllStaff()
	{
		List<StaffBean> staffs = new ArrayList<StaffBean>();

		try {

			//call getConnection() method from ConnectionManager class			
			con = ConnectionManager.getConnection(); 

			//3. create statement
			String sql = "SELECT * FROM staff ORDER BY staffid";
			stmt = con.createStatement();

			//4. execute query
			rs = stmt.executeQuery(sql);

			while(rs.next())
			{
				StaffBean staff = new StaffBean();
				staff.setStaffId(rs.getInt("staffid"));
				staff.setStaffName(rs.getString("staffname"));
				staff.setStaffAddress(rs.getString("staffaddress"));
				staff.setStaffContact(rs.getString("staffcontact"));
				staff.setUserId(rs.getInt("userid"));

				staffs.add(staff);
			}

			//5. close connection
			con.close();

		}catch(Exception e) {
			e.printStackTrace();
		}

		return staffs;
	}
	
	// get staff by userid
	public static StaffBean getStaffId(int userid)
	{
		StaffBean staff = new StaffBean();

		try {

			//call getConnection() method from ConnectionManager class			
			con = ConnectionManager.getConnection(); 

			//3. create statement
			String sql = "SELECT * FROM staff WHERE userid=?";
			ps = con.prepareStatement(sql);
			ps.setInt(1, userid);

			//4. execute query
			rs = ps.executeQuery();

			if(rs.next())
			{
				staff.setStaffId(rs.getInt("staffid"));
				staff.setStaffName(rs.getString("staffname"));
				staff.setStaffAddress(rs.getString("staffaddress"));
				staff.setStaffContact(rs.getString("staffphone"));
				staff.setUserId(rs.getInt("userid"));
			}

			//5. close connection
			con.close();

		}catch(Exception e) {
			e.printStackTrace();
		}

		return staff;
	}

	// update staff
	public void updateStaff(StaffBean bean)
	{
		// get staff
		staffId = bean.getStaffId();
		staffName = bean.getStaffName();
		staffAddress = bean.getStaffAddress();
		staffContact = bean.getStaffContact();
		userId = bean.getUserId();

		try {

			//call getConnection() method from ConnectionManager class			
			con = ConnectionManager.getConnection(); 

			//3. create statement
			String sql = "UPDATE staff SET staffname=?, staffaddress=?, staffphone=?, userid=? WHERE staffid=?";
			ps = con.prepareStatement(sql);
			ps.setString(1, staffName);
			ps.setString(2, staffAddress);
			ps.setString(3, staffContact);
			ps.setInt(4, userId);
			ps.setInt(5, staffId);
			

			//4. execute query
			ps.executeUpdate();

			//5. close connection
			con.close();

		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	//get staff by email
	public static StaffBean getStaffEmail(String email)
	{
		StaffBean staff = new StaffBean();
		UserBean user= new UserBean();
		try {

			//call getConnection() method from ConnectionManager class			
			con = ConnectionManager.getConnection(); 

			//3. create statement
			String sql = "SELECT u.*, s.*\r\n"
					+ "FROM user u\r\n"
					+ "LEFT JOIN staff s ON u.staffId = s.staffId\r\n"
					+ "WHERE u.email = ?;\r\n";
			ps = con.prepareStatement(sql);
			ps.setString(1, email);

			//4. execute query
			rs = ps.executeQuery();

			if(rs.next())
			{
				staff.setStaffName(rs.getString("staffName"));
				user.setUserEmail(rs.getString("userEmail"));
				staff.setStaffContact(rs.getString("staffPhone"));
				staff.setStaffAddress(rs.getString("staffAddress"));
				staff.setUserId(rs.getInt("userId"));
			}

			//5. close connection
			con.close();

		}catch(Exception e) {
			e.printStackTrace();
		}
		return staff;
	}
}

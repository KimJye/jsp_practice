package jdbc2;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import jdbc1.DB;
import jdbc1.User;

public class UserListExample {

	public static User createUser(ResultSet resultSet) throws SQLException{
		User user = new User();
		user.setId(resultSet.getInt("id"));
		user.setUserid(resultSet.getString("userid"));
		user.setName(resultSet.getString("name"));
		user.setEmail(resultSet.getString("email"));
		user.setDepartmentId(resultSet.getInt("departmentId"));
		user.setDepartmentName(resultSet.getString("departmentName"));
		user.setEnabled(resultSet.getInt("enabled")==1?true:false);
		user.setUserType(resultSet.getString("userType"));
		return user;
	}

	public static List<User> findAll() throws Exception{
		String sql = "SELECT u.*, d.departmentName FROM user u LEFT JOIN department d ON u.departmentId=d.id";
		try(Connection connection = DB.getConnection("student1");
			PreparedStatement statement = connection.prepareStatement(sql);
			ResultSet resultSet = statement.executeQuery()){

			ArrayList<User> list = new ArrayList<User>();
			while(resultSet.next()) {
				list.add(createUser(resultSet));
			}
			return list;
		}
	}

	 public static List<User> findByable(String enable) throws Exception {
	        String sql = "SELECT u.*, d.departmentName FROM user u LEFT JOIN department d ON u.departmentId=d.id " +
	                     "WHERE enabled=?";
	        int number=(enable.equals("true"))?1:0;
	        try (Connection connection = DB.getConnection("student1");
	             PreparedStatement statement = connection.prepareStatement(sql)) {

	            statement.setInt(1, number);
	            try (ResultSet resultSet = statement.executeQuery()) {
	                ArrayList<User> list = new ArrayList<User>();
	                while (resultSet.next()) {
	                	   list.add(createUser(resultSet));
	                }
	                return list;
	            }
	        }
	    }
	  public static List<User> findByUserType(String[] userType) throws Exception {
	        String sql = "select u.*, d.departmentName " +
	                     "from user u left join department d on u.departmentId = d.id ";

	        if (userType.length > 0) {
	            String s = " where userType in ('" + String.join("', '", userType) + "')";
	            sql = sql + s;
	        }

	        try (Connection connection = DB.getConnection("student1");
	             PreparedStatement statement = connection.prepareStatement(sql)) {
	            try (ResultSet resultSet = statement.executeQuery()) {
	                ArrayList<User> list = new ArrayList<User>();
	                while (resultSet.next()) {
	                	   list.add(createUser(resultSet));
	                }
	                return list;
	            }
	        }
	    }
}

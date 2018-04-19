package jdbc3;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import jdbc1.DB;
import jdbc1.User;

public class UserDAO {
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

	public static List<User>findAll(int currentPage, int pageSize)throws Exception{
		String sql = "SELECT u.*, d.departmentName "+
					 "FROM user u LEFT JOIN department d ON u.departmentId=d.id "+
					 "LIMIT ?,?";
		try(Connection connection=DB.getConnection("student1");
			PreparedStatement statement =connection.prepareStatement(sql)){
			statement.setInt(1,(currentPage-1)*pageSize);
			statement.setInt(2, pageSize);
			try(ResultSet resultSet = statement.executeQuery()){
				ArrayList<User> list = new ArrayList<User>();
				while(resultSet.next()) {

					list.add(createUser(resultSet));
				}
				return list;
			}
		}
	}

	 public static List<User> findByName(String name,int currentPage, int pageSize) throws Exception {
	        String sql = "SELECT u.*, d.departmentName FROM user u LEFT JOIN department d ON u.departmentId=d.id " +
	                     "WHERE u.name LIKE ? LIMIT ?,?";
	        try (Connection connection = DB.getConnection("student1");
	             PreparedStatement statement = connection.prepareStatement(sql)) {

	            statement.setString(1, name + "%");
	            statement.setInt(2, (currentPage-1)*pageSize);
	            statement.setInt(3, pageSize);
	            try (ResultSet resultSet = statement.executeQuery()) {
	                ArrayList<User> list = new ArrayList<User>();
	                while (resultSet.next()) {
	                	   list.add(createUser(resultSet));
	                }
	                return list;
	            }
	        }
	    }

	 public static List<User> findByDepartmentId(int departmentId,int currentPage, int pageSize) throws Exception {
	        String sql = "SELECT u.*, d.departmentName FROM user u LEFT JOIN department d ON u.departmentId=d.id " +
	                     "WHERE u.departmentId=? LIMIT ?,?";
	        try (Connection connection = DB.getConnection("student1");
	             PreparedStatement statement = connection.prepareStatement(sql)) {

	            statement.setInt(1, departmentId);
	            statement.setInt(2, (currentPage-1)*pageSize);
	            statement.setInt(3, pageSize);
	            try (ResultSet resultSet = statement.executeQuery()) {
	                ArrayList<User> list = new ArrayList<User>();
	                while (resultSet.next()) {
	                	   list.add(createUser(resultSet));
	                }
	                return list;
	            }
	        }
	    }
	public static int count() throws Exception{
		String sql="SELECT COUNT(*) FROM user";
		try(Connection connection=DB.getConnection("student1");
			PreparedStatement statement = connection.prepareStatement(sql);
			ResultSet resultSet = statement.executeQuery()){
			if(resultSet.next())
				return resultSet.getInt(1);
		}
		return 0;
	}
}

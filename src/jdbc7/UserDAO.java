package jdbc7;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import jdbc1.DB;

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

	public static List<User>findAll(int currentPage, int pageSize, String st, String od)throws Exception{
		String sql = "call user_findAll(?,?,?,?)";
		try(Connection connection=DB.getConnection("student1");
				PreparedStatement statement =connection.prepareStatement(sql)){
			statement.setInt(1,(currentPage-1)*pageSize);
			statement.setInt(2, pageSize);
			statement.setString(3, st+"%");
			statement.setString(4,od);
			try(ResultSet resultSet = statement.executeQuery()){
				ArrayList<User> list = new ArrayList<User>();
				while(resultSet.next()) {

					list.add(createUser(resultSet));
				}
				return list;
			}
		}
	}
	  public static User findOne(int id)throws Exception{
		   String sql = "SELECT * FROM user WHERE id=?";
		   try(Connection connection = DB.getConnection("student1");
			   PreparedStatement statement = connection.prepareStatement(sql)){
			   statement.setInt(1,id);
			  try(ResultSet resultSet = statement.executeQuery()){
				  if(resultSet.next()) {
						User user = new User();
						user.setId(resultSet.getInt("id"));
						user.setUserid(resultSet.getString("userid"));
						user.setName(resultSet.getString("name"));
						user.setEmail(resultSet.getString("email"));
						user.setDepartmentId(resultSet.getInt("departmentId"));
						user.setEnabled(resultSet.getInt("enabled")==1?true:false);
						user.setUserType(resultSet.getString("userType"));
					  return user;
				  }
			  }
			  return null;
		   }

	   }
	public static List<User> findByName(int currentPage, int pageSize, String name,String od) throws Exception {
		String order="ID";
		switch(od) {
		case"1":order="departmentName"; break;
		case"2":order="enabled";break;
		case"3":order="userType";break;
		}
		String sql = "SELECT u.*, d.departmentName FROM user u LEFT JOIN department d ON u.departmentId=d.id" +
				" WHERE u.name LIKE ?"+
				" ORDER BY "+order+
				" LIMIT ?,?";
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

	public static List<User> findByDepartmentId(int currentPage, int pageSize, int departmentId, String od) throws Exception {
		String order="ID";
		switch(od) {
		case"1":order="departmentName"; break;
		case"2":order="enabled";break;
		case"3":order="userType";break;
		}
		String sql = "SELECT u.*, d.departmentName FROM user u LEFT JOIN department d ON u.departmentId=d.id " +
				"WHERE u.departmentId=? "+
				"ORDER BY "+order+" LIMIT ?,?";
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
	 public static List<User> findByable(String enable,int currentPage, int pageSize) throws Exception {
	        String sql = "SELECT u.*, d.departmentName FROM user u LEFT JOIN department d ON u.departmentId=d.id " +
	                     "WHERE enabled=? LIMIT ?,?";
	        int number=(enable.equals("true"))?1:0;
	        try (Connection connection = DB.getConnection("student1");
	             PreparedStatement statement = connection.prepareStatement(sql)) {

	            statement.setInt(1, number);
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
	 public static void update(User user)throws Exception{
		   String sql ="call user_update(?,?,?,?,?,?,?)";
		   try(Connection connection = DB.getConnection("student1");
			   PreparedStatement statement = connection.prepareStatement(sql)){
			   statement.setString(1, user.getUserid() );
			   statement.setString(2, user.getName());
			   statement.setString(3,user.getEmail());
			   statement.setInt(4, user.getDepartmentId());
			   statement.setBoolean(5, user.isEnabled());
			   statement.setString(6, user.getUserType());
			   statement.setInt(7, user.getId());
			   statement.executeUpdate();
		   }
	   }
	 public static void insert(User user) throws Exception{
		   String sql = "call user_insert('',?,?,?,?,?,?)";

		   try(Connection connection = DB.getConnection("student1");
			   PreparedStatement statement = connection.prepareStatement(sql)){
			   statement.setString(1, user.getUserid());
			   statement.setString(2, user.getName());
			   statement.setString(3, user.getEmail());
			   statement.setInt(4, user.getDepartmentId());
			   statement.setBoolean(5, user.isEnabled());
			   statement.setString(6, user.getUserType());
			   statement.executeUpdate();
		   }
	   }
	 public static void delete(int id) throws Exception{
		 String sql="DELETE FROM user WHERE id=?";
		 try(Connection connection = DB.getConnection("student1");
				  PreparedStatement statement = connection.prepareStatement(sql)){
				  statement.setInt(1, id);
				  statement.executeUpdate();
			}
	 }
	public static int count(String st) throws Exception{
		String sql="call user_count(?)";
		try(Connection connection = DB.getConnection("student1");
				PreparedStatement statement = connection.prepareStatement(sql)){
			statement.setString(1,  st + "%");

			try(ResultSet resultSet = statement.executeQuery()){
				if(resultSet.next())
					return resultSet.getInt(1);
			}
		}
		return 0;
	}


}

package jdbc7;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import jdbc1.DB;

public class StudentDAO {

	public static List<Student> findAll(int currentPage, int pageSize, String ss, String st, String od) throws Exception {//리턴타입이 List 타입인데 이렇게 가급적 부모타입으로 적어주는것이 좋다. 이유는 다형성때문. 다형성 구현할때는  1. 부모클래스나 인터페이스가  있어야 한다. 2. 자식이 부모 메소드를 재정의(오버라이딩)해야한다. 3. 부모타입의 변수로 메소드를 호출해야 다형성 호출이다.
		String sql = "call student_findAll(?,?,?,?,?)";
		try (Connection connection = DB.getConnection("student1");
				PreparedStatement statement = connection.prepareStatement(sql)){
			statement.setInt(1, (currentPage-1)*pageSize);//firstRecordIndex
			statement.setInt(2,pageSize);//pageSize
			statement.setString(3, ss);//조회방법
			statement.setString(4,st+"%");//검색 문자열
			statement.setString(5,od);//정렬 순서
			try(ResultSet resultSet = statement.executeQuery()) {
				ArrayList<Student> list = new ArrayList<Student>();
				while (resultSet.next()) {
					Student student = new Student();
					student.setId(resultSet.getInt("id"));
					student.setStudentNumber(resultSet.getString("studentNumber"));
					student.setName(resultSet.getString("name"));
					student.setDepartmentId(resultSet.getInt("departmentId"));
					student.setYear(resultSet.getInt("year"));
					student.setDepartmentName(resultSet.getString("departmentName"));
					list.add(student);
				}
				return list;
			}
		}
	}
    public static List<Student> findByName(String name, int currentPage, int pageSize, String od) throws Exception {
        String order="ID";
        switch(od) {
        case"1":order="departmentName"; break;
        case"2":order="year";break;
        }
    	String sql = "SELECT s.*, d.departmentName" +
                     " FROM student s LEFT JOIN department d ON s.departmentId = d.id" +
                     " WHERE name LIKE ?" +
                     " ORDER BY "+order +
                     " LIMIT ?, ?";
        try (Connection connection = DB.getConnection("student1");
             PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setString(1, name + "%");
            statement.setInt(2, (currentPage - 1) * pageSize);
            statement.setInt(3, pageSize);
            try (ResultSet resultSet = statement.executeQuery()) {
                ArrayList<Student> list = new ArrayList<Student>();
                while (resultSet.next()) {
                    Student student = new Student();
                    student.setId(resultSet.getInt("id"));
                    student.setStudentNumber(resultSet.getString("studentNumber"));
                    student.setName(resultSet.getString("name"));
                    student.setDepartmentId(resultSet.getInt("departmentId"));
                    student.setYear(resultSet.getInt("year"));
                    student.setDepartmentName(resultSet.getString("departmentName"));
                    list.add(student);
                }
                return list;
            }
        }
    }

	public static int count(String ss, String st) throws Exception{
		String sql ="call student_count(?,?)";
		try(Connection connection = DB.getConnection("student1");
				PreparedStatement statement = connection.prepareStatement(sql)){
			statement.setString(1,ss);//조회방법
			statement.setString(2, st+"%");//검색 문자열
			try(ResultSet resultSet = statement.executeQuery()){
				if(resultSet.next())
					return resultSet.getInt(1);
			}
		}
		return 0;
	}

	public static Student findOne(int id)throws Exception{
		String sql = "SELECT * FROM student WHERE id=?";
		try(Connection connection = DB.getConnection("student1");
				PreparedStatement statement = connection.prepareStatement(sql)){
			statement.setInt(1,id);
			try(ResultSet resultSet = statement.executeQuery()){
				if(resultSet.next()) {
					Student student = new Student();
					student.setId(resultSet.getInt("id"));
					student.setStudentNumber(resultSet.getString("studentNumber"));
					student.setName(resultSet.getString("name"));
					student.setDepartmentId(resultSet.getInt("departmentId"));
					student.setYear(resultSet.getInt("year"));
					return student;
				}
			}
			return null;
		}

	}

	public static void update(Student student)throws Exception{
		String sql ="call student_update(?,?,?,?,?)";
		try(Connection connection = DB.getConnection("student1");
				PreparedStatement statement = connection.prepareStatement(sql)){
			statement.setString(1, student.getStudentNumber());
			statement.setString(2, student.getName());
			statement.setInt(3,student.getDepartmentId());
			statement.setInt(4, student.getYear());
			statement.setInt(5, student.getId());
			statement.executeUpdate();
		}
	}

	public static void insert(Student student) throws Exception{
		String sql = "call student_insert(?,?,?,?)";
		try(Connection connection = DB.getConnection("student1");
				PreparedStatement statement = connection.prepareStatement(sql)){
			statement.setString(1, student.getStudentNumber());
			statement.setString(2, student.getName());
			statement.setInt(3, student.getDepartmentId());
			statement.setInt(4, student.getYear());
			statement.executeUpdate();
		}
	}

	public static void delete(int id) throws Exception{
		String sql="DELETE FROM student WHERE id=?";
		try(Connection connection = DB.getConnection("student1");
				PreparedStatement statement = connection.prepareStatement(sql)){
			statement.setInt(1, id);
			statement.executeUpdate();
		}
	}
}

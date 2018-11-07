package jdbc1;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class StudentDAO {

	   public static List<Student> findAll() throws Exception {//리턴타입이 List 타입인데 이렇게 가급적 부모타입으로 적어주는것이 좋다. 이유는 다형성때문. 다형성 구현할때는  1. 부모클래스나 인터페이스가  있어야 한다. 2. 자식이 부모 메소드를 재정의(오버라이딩)해야한다. 3. 부모타입의 변수로 메소드를 호출해야 다형성 호출이다.
		   String sql = "SELECT s.*, d.departmentName " +
		   "FROM student s LEFT JOIN department d ON s.departmentId = d.id"; //d.departmentName 이후 반드시 공백을 써준다. 안써주면 쿼리문 에러난다.
		   try (Connection connection = DB.getConnection("student1");
				   PreparedStatement statement = connection.prepareStatement(sql);
				   ResultSet resultSet = statement.executeQuery()) {
			   ArrayList<Student> list = new ArrayList<Student>();
			   while (resultSet.next()) {
				   Student student = new Student();
				   student.setId(resultSet.getString("id"));
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

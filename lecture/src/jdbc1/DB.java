package jdbc1;

import java.sql.Connection;
import java.sql.SQLException;

import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class DB {
	static DataSource dataSource = null; //context.xml에 적은 DB연결정보
	public static Connection getConnection(String databaseName) throws SQLException, NamingException {//Connection 객체를 얻는다.
		   if (dataSource == null) {
			   InitialContext context = new InitialContext();
			   dataSource = (DataSource)context.lookup("java:comp/env/jdbc/" + databaseName);
		   }
		   return dataSource.getConnection();
	}
}

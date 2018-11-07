package shop_manager;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class DBManager {

   static DataSource dataSource = null;

   public static Connection getConnection(String databaseName) throws SQLException, NamingException {
      if(dataSource == null) {
         InitialContext context = new InitialContext();
         dataSource = (DataSource)context.lookup("java:comp/env/jdbc/" + databaseName);
      }
      return dataSource.getConnection();
   }

   public static void close(Connection conn, Statement stmt, ResultSet rs) {
      try {
         rs.close();
         stmt.close();
         conn.close();
      }catch (Exception e) {
         e.printStackTrace();
      }
   }

   public static void close(Connection conn, Statement stmt) {
      try {
         stmt.close();
         conn.close();
      }catch (Exception e) {
         e.printStackTrace();
      }
   }
}
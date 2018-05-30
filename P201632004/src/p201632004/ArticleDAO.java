package p201632004;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
public class ArticleDAO {

	public static Article createArticle(ResultSet resultSet) throws SQLException{
		Article art = new Article();
		art.setId(resultSet.getInt("id"));
		art.setBoardId(resultSet.getInt("boardId"));
		art.setUserId(resultSet.getInt("userId"));
		art.setNo(resultSet.getInt("no"));
		art.setWriteTime(resultSet.getTimestamp("writeTime"));
		art.setTitle(resultSet.getString("title"));
		art.setBody(resultSet.getString("body"));
		art.setNotice(resultSet.getInt("notice")==1?true:false);
		return art;
	}

	public static List<Article>findAll(int currentPage, int pageSize, String ss, String st, String od)throws Exception{
		String sql = "call article_findAll(?,?,?,?,?)";

		try(Connection connection=DB.getConnection("bbs2");
				PreparedStatement statement =connection.prepareStatement(sql)){

			statement.setInt(1, (currentPage-1)*pageSize);//firstRecordIndex
			statement.setInt(2,pageSize);//pageSize
			statement.setString(3, ss);//조회방법
			statement.setString(4,st+"%");//검색 문자열
			statement.setString(5,od);//정렬 순서

			try(ResultSet resultSet = statement.executeQuery()){
				ArrayList<Article> list = new ArrayList<Article>();
				while(resultSet.next()) {

					list.add(createArticle(resultSet));
				}
				return list;
			}
		}
	}

	public static Article findOne(int id)throws Exception{
		   String sql = "SELECT * FROM article WHERE id=?";
		   try(Connection connection = DB.getConnection("bbs2");
			   PreparedStatement statement = connection.prepareStatement(sql)){
			   statement.setInt(1,id);
			  try(ResultSet resultSet = statement.executeQuery()){
				  if(resultSet.next()) {
					  Article art = new Article();
						art.setId(resultSet.getInt("id"));
						art.setBoardId(resultSet.getInt("boardId"));
						art.setUserId(resultSet.getInt("userId"));
						art.setNo(resultSet.getInt("no"));
						art.setWriteTime(resultSet.getTimestamp("writeTime"));
						art.setTitle(resultSet.getString("title"));
						art.setBody(resultSet.getString("body"));
						art.setNotice(resultSet.getInt("notice")==1?true:false);
						return art;
				  }
			  }
			  return null;
		   }

	   }


	 public static void update(Article art)throws Exception{
		   String sql ="UPDATE article SET title=?, body=?, userId=?, notice=?" +
				   		" WHERE id = ?";
		   try(Connection connection = DB.getConnection("bb2");
			   PreparedStatement statement = connection.prepareStatement(sql)){
			   statement.setString(1, art.getTitle() );
			   statement.setString(2, art.getBody());
			   statement.setInt(3,art.getUserId());
			   statement.setBoolean(4, art.isNotice());
			   statement.setInt(5, art.getId());
			   statement.executeUpdate();
		   }
	   }

	 public static void insert(Article art) throws Exception{
		   String sql = "INSERT into article(title, body, userId, boardId, notice, writeTime)" +
				   		"VALUES(?,?,?,?,?,?)";
		   try(Connection connection = DB.getConnection("bbs2");
			   PreparedStatement statement = connection.prepareStatement(sql)){
			   statement.setString(1, art.getTitle());
			   statement.setString(2, art.getBody());
			   statement.setInt(3, art.getUserId());
			   statement.setInt(4, art.getBoardId());
			   statement.setBoolean(5, art.isNotice());
			   statement.setTimestamp(6, art.getWriteTime());
			   statement.executeUpdate();
		   }
	   }
	/*
	 public static void delete(int id) throws Exception{
		 String sql="DELETE FROM user WHERE id=?";
		 try(Connection connection = DB.getConnection("student1");
				  PreparedStatement statement = connection.prepareStatement(sql)){
				  statement.setInt(1, id);
				  statement.executeUpdate();
			}
	 }
	 */
	public static int count(String ss, String st) throws Exception{
		String sql="call article_count(?,?)";
		try(Connection connection = DB.getConnection("bbs2");
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

}

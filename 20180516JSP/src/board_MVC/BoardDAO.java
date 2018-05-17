package board_MVC;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class BoardDAO {
	private BoardDAO() {
	}
	private static BoardDAO instance = new BoardDAO();

	public static BoardDAO getInstance() {
		return instance;
	}

	public List<BoardVO> selectAllBoards(){
		String sql = "select * from board order by num desc";

		List<BoardVO> list = new ArrayList<BoardVO>();
		Connection conn =null;
		Statement stmt = null;
		ResultSet rs = null;

		try {
			conn = DBManager.getConnection();
			stmt = conn.createStatement();

			rs = stmt.executeQuery(sql);

			while(rs.next()) {
				BoardVO bvo = new BoardVO();

				bvo.setNum(rs.getInt("num"));
				bvo.setName(rs.getString("name"));
				bvo.setEmail(rs.getString("email"));
				bvo.setPass(rs.getString("pass"));
				bvo.setTitle(rs.getString("title"));
				bvo.setContent(rs.getString("content"));
				bvo.setReadcount(rs.getInt("readcount"));
				bvo.setWritedate(rs.getTimestamp("writedate"));

				list.add(bvo);
			}
			}catch(SQLException e) {
				e.printStackTrace();
			}finally {
				DBManager.close(conn, stmt,rs);
			}
			return list;
		}

		public void insertBoard(BoardVO bvo) {
			String sql = "insert into board(name,email,pass,title,content) values(?,?,?,?,?)";

			Connection conn = null;
			PreparedStatement pstmt = null;

			try {
				conn = DBManager.getConnection();
				pstmt = conn.prepareStatement(sql);

				pstmt.setString(1, bvo.getName());
				pstmt.setString(2, bvo.getEmail());
				pstmt.setString(3, bvo.getPass());
				pstmt.setString(4, bvo.getTitle());
				pstmt.setString(5, bvo.getContent());

				pstmt.executeUpdate();
			}catch(SQLException e) {
				e.printStackTrace();
			}finally {
				DBManager.close(conn, pstmt);
			}
		}

		public void updateReadCount(String num) {
			String sql ="update board set readcount=readcount+1 where num=?";

			Connection conn = null;
			PreparedStatement pstmt =null;

			try {
				conn = DBManager.getConnection();

				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, num);

				pstmt.executeUpdate();
			}catch(SQLException e) {
				e.printStackTrace();
			}finally {
				DBManager.close(conn, pstmt);
			}
		}

		//게시판 글 상세 내용 보기 : 글 번호로 찾아 온다. : 실패 null
		public BoardVO selectOneBoardByNum(String num) {
			String sql ="select * from board where num=?";

			BoardVO bvo =null;
			Connection conn =null;
			PreparedStatement pstmt =null;
			ResultSet rs = null;

			try {
				conn = DBManager.getConnection();

				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, num);

				rs=pstmt.executeQuery();

				if(rs.next()) {
					bvo = new BoardVO();

					bvo.setNum(rs.getInt("num"));
					bvo.setName(rs.getString("name"));
					bvo.setPass(rs.getString("pass"));
					bvo.setEmail(rs.getString("email"));
					bvo.setTitle(rs.getString("title"));
					bvo.setContent(rs.getString("content"));
					bvo.setWritedate(rs.getTimestamp("writedate"));
					bvo.setReadcount(rs.getInt("readcount"));
				}
			}catch(Exception e) {
				e.printStackTrace();
			}finally {
				DBManager.close(conn, pstmt,rs);
			}
			return bvo;
		}

		public void updateBoard(BoardVO bvo) {
			String sql ="update board set name=?, email=?, pass=?, title=?, content=? where num=?";

			Connection conn = null;
			PreparedStatement pstmt =null;
			try {
				conn = DBManager.getConnection();

				pstmt = conn.prepareStatement(sql);

				pstmt.setString(1, bvo.getName());
				pstmt.setString(2, bvo.getEmail());
				pstmt.setString(3,bvo.getPass());
				pstmt.setString(4, bvo.getTitle());
				pstmt.setString(5, bvo.getContent());
				pstmt.setInt(6, bvo.getNum());

				pstmt.executeUpdate();
			}catch(SQLException e) {
				e.printStackTrace();
			}finally {
				DBManager.close(conn, pstmt);
			}
		}

		public BoardVO checkPassWord(String pass, String num) {
			String sql = "select * from board where pass=? and num=?";

			Connection conn =null;
			PreparedStatement pstmt = null;
			ResultSet rs =null;
			BoardVO bvo= null;
			try {
				conn = DBManager.getConnection();
				pstmt = conn.prepareStatement(sql);

				pstmt.setString(1,pass);
				pstmt.setString(2, num);

				rs = pstmt.executeQuery();

				if(rs.next()) {
					bvo = new BoardVO();

					bvo.setNum(rs.getInt("num"));
					bvo.setName(rs.getString("name"));
					bvo.setEmail(rs.getString("email"));
					bvo.setPass(rs.getString("pass"));
					bvo.setTitle(rs.getString("title"));
					bvo.setContent(rs.getString("content"));
					bvo.setReadcount(rs.getInt("readcount"));
					bvo.setWritedate(rs.getTimestamp("writedate"));
				}
			}catch(SQLException e) {
				e.printStackTrace();
			}
			return bvo;
		}

		public void deleteBoard(String num) {
			String sql = "delete from board where num=?";
			Connection conn =null;
			PreparedStatement pstmt = null;
			try {
				conn = DBManager.getConnection();
				pstmt = conn.prepareStatement(sql);

				pstmt.setString(1, num);

				pstmt.executeUpdate();
			}catch(SQLException e) {
				e.printStackTrace();
				System.out.println("삭제 실패");
			}
		}


}

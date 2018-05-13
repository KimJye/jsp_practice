package shop_manager;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class ProductDAO {
	private ProductDAO() {
	}
	private static ProductDAO instance = new ProductDAO();

	public static ProductDAO getInstance() {
		return instance;
	}

	public List<ProductVO> selectAllProducts(){
		String sql = "select * from product order by code desc";
		List<ProductVO> list = new ArrayList<ProductVO>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = DBManager.getConnection("sample1");
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				ProductVO pvo = new ProductVO();
				pvo.setCode(rs.getInt("code"));
				pvo.setName(rs.getString("name"));
				pvo.setPrice(rs.getInt("price"));
				pvo.setPictureUrl(rs.getString("pictureurl"));
				pvo.setDescription(rs.getString("description"));
				list.add(pvo);
				System.out.println("실행됨");
			}
		}catch (Exception e) {
			e.printStackTrace();
			System.out.println("실행안됨");
		}finally {
			DBManager.close(conn, pstmt, rs);
		}
		return list;
	}
	public ProductVO selectProductByCode(String code){
		String sql = "SELECT * FROM product WHERE code=?";
		ProductVO pVO=null;
		try {
			Connection conn = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			try {
				conn = DBManager.getConnection("sample1");
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, code);
				rs = pstmt.executeQuery();
				if(rs.next()) {
					pVO = new ProductVO();
					pVO.setCode(rs.getInt("code"));
					pVO.setName(rs.getString("name"));
					pVO.setPrice(rs.getInt("price"));
					pVO.setPictureUrl(rs.getString("pictureurl"));
					pVO.setDescription(rs.getString("description"));
				}
			}catch (Exception e) {
				e.printStackTrace();
				System.out.println("이미 등록된 상품 정보 변경 실행안됨");
			}finally {
				DBManager.close(conn, pstmt, rs);
			}
		}catch(Exception e) {
			e.printStackTrace();
			System.out.println("connection연결안됨");
		}
		return pVO;

	}
	public void insertProduct(ProductVO pVO){
		String sql ="insert into product (name, price, pictureurl, description) values(?,?,?,?)";
		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			conn = DBManager.getConnection("sample1");
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, pVO.getName());
			pstmt.setInt(2, pVO.getPrice());
			pstmt.setString(3, pVO.getPictureUrl());
			pstmt.setString(4, pVO.getDescription());
			pstmt.executeUpdate();
		}catch (Exception e) {
			e.printStackTrace();
			System.out.println("실행안됨");
		}finally {
			DBManager.close(conn, pstmt);
		}

	}
	public void updateProduct(ProductVO pVO) {
		String sql="update product set name=?, price=?, pictureurl=?, description=? where code=?";
		Connection conn = null;
		PreparedStatement pstmt = null;
		try{
			conn = DBManager.getConnection("sample1");
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, pVO.getName());
			pstmt.setInt(2, pVO.getPrice());
			pstmt.setString(3, pVO.getPictureUrl());
			pstmt.setString(4, pVO.getDescription());
			pstmt.setInt(5, pVO.getCode());
			pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
			System.out.println("수정하기 실패");
		}finally {
			DBManager.close(conn, pstmt);
		}
	}
	public void deleteProduct(String code){
		String sql = "delete from product where code=?";
		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			conn = DBManager.getConnection("sample1");
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, code);
			pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
			System.out.println("삭제 안됨");
		}finally {
			DBManager.close(conn, pstmt);
		}
	}
}

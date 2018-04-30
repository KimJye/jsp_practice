package product3;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import product1.DB;
import product1.Product;

public class ProductDAO3 {

	public static Product createProduct(ResultSet resultSet) throws SQLException{
		  Product product = new Product();
		   product.setId(resultSet.getInt("id"));
		   product.setTitle(resultSet.getString("title"));
		   product.setCategory(resultSet.getString("name"));
		   product.setUnitCost(resultSet.getInt("unitCost"));
		   product.setQuantity(resultSet.getInt("quantity"));
		return product;
	}
	   public static List<Product> findAll() throws Exception {//리턴타입이 List 타입인데 이렇게 가급적 부모타입으로 적어주는것이 좋다. 이유는 다형성때문. 다형성 구현할때는  1. 부모클래스나 인터페이스가  있어야 한다. 2. 자식이 부모 메소드를 재정의(오버라이딩)해야한다. 3. 부모타입의 변수로 메소드를 호출해야 다형성 호출이다.
		   String sql = "SELECT p.*, c.name " +
		   "FROM product p LEFT JOIN category c ON p.categoryId = c.id"; //d.departmentName 이후 반드시 공백을 써준다. 안써주면 쿼리문 에러난다.
		   try (Connection connection = DB.getConnection("product");
				   PreparedStatement statement = connection.prepareStatement(sql);
				   ResultSet resultSet = statement.executeQuery()) {
			   ArrayList<Product> list = new ArrayList<Product>();
			   while (resultSet.next()) {
				   list.add(createProduct(resultSet));
				   }
			   return list;
			   }
		   }

	   public static List<Product> findByid(int id) throws Exception {
			String sql = "SELECT p.*, c.name FROM product p LEFT JOIN category c ON p.categoryId=c.id " +
					"WHERE p.categoryId=?";
			try (Connection connection = DB.getConnection("product");
					PreparedStatement statement = connection.prepareStatement(sql)) {
				statement.setInt(1, id);
				try (ResultSet resultSet = statement.executeQuery()) {
					ArrayList<Product> list = new ArrayList<Product>();
					while (resultSet.next()) {
						list.add(createProduct(resultSet));
					}
					return list;
				}
			}
		}

}

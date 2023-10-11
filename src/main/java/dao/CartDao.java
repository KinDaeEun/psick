package dao;

import java.io.Reader;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import model.Cart;
import model.Product;

public class CartDao {
	// singleton
	private static CartDao Instance = new CartDao();

	private CartDao() {
	}

	public static CartDao getInstance() {
		return Instance;
	}

	private static SqlSession session;

	static {
		try {
			Reader reader = Resources.getResourceAsReader("configuration.xml");
			SqlSessionFactory ssf = new SqlSessionFactoryBuilder().build(reader);
			session = ssf.openSession(true);
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
	}
//	public List<Product> cartlist(String id) {
//	return session.selectList("productns.cartlist", id);
//}

	public int getTotalMy(String id) {
		return (int) session.selectOne("cartns.getTotalMy", id);
	}

	public List<Cart> cartlist(String id, int startRow, int endRow) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("id", id);
		map.put("startRow", startRow);
		map.put("endRow", endRow);
		return session.selectList("productns.cartlist", map);
	}

	public int insert(Cart cart) {
		return session.insert("cartns.insert",cart);
	}

}

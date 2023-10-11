package dao;

import java.io.Reader;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import model.Cart;
import model.Product;
import service.display.BuyList;

public class ProductDao {
	// singleton
	private static ProductDao Instance = new ProductDao();

	private ProductDao() {
	}

	public static ProductDao getInstance() {
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

	public List<Product> disList() {
		return session.selectList("productns.disList");
	}

	public List<Product> freshList() {
		return session.selectList("productns.freshList");
	}

	public List<Product> bestList() {
		return session.selectList("productns.bestList");
	}

	public int getTotal(String condition) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("condition", condition);
		return (int) session.selectOne("productns.getTotal", map);
	}

	public List<Product> discount(int startRow, int endRow) {
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("startRow", startRow);
		map.put("endRow", endRow);
		return session.selectList("productns.discount", map);
	}

	public List<Product> best(int startRow, int endRow) {
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("startRow", startRow);
		map.put("endRow", endRow);
		return session.selectList("productns.best", map);
	}

	public List<Product> fresh(int startRow, int endRow) {
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("startRow", startRow);
		map.put("endRow", endRow);
		return session.selectList("productns.fresh", map);
	}

	public List<Product> categoriesBest(int startRow, int endRow, String kind, String order) {

		Map<String, Object> map = new HashMap<>();
		map.put("kind", kind);
		map.put("order", order);
		map.put("startRow", startRow);
		map.put("endRow", endRow);

		return session.selectList("productns.categoriesBest", map);
	}

	public List<Product> categories(int startRow, int endRow, String kind, String order) {
		Map<String, Object> map = new HashMap<>();
		map.put("kind", kind);
		map.put("order", order);
		map.put("startRow", startRow);
		map.put("endRow", endRow);

		return session.selectList("productns.categories", map);
	}

	public List<Product> search(String search) {
		return session.selectList("productns.search", search);
	}

	public Product select(int pno) {
		return (Product) session.selectOne("productns.select", pno);
	}

	public List<Product> cartlist(String id) {
		return session.selectList("productns.cartlist", id);
	}

	public List<Product> selectAll(int startRow, int endRow) {
		Map<String, Object> map = new HashMap<>();
		map.put("startRow", startRow);
		map.put("endRow", endRow);
		return session.selectList("productns.selectAll", map);
	}

	public int getTotalAll() {
		return (int) session.selectOne("productns.getTotalAll");
	}

	public List<Product> adminSearch(String searchKey, String searchValue) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("searchKey", searchKey);
		map.put("searchValue", searchValue);
		return session.selectList("productns.adminSearch", map);
	}

	public List<Product> cartlist(String id, int startRow, int endRow) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("id", id);
		map.put("startRow", startRow);
		map.put("endRow", endRow);
		return session.selectList("productns.cartlist", map);
	}

	public int delete(Cart cart) {

		return session.delete("productns.delete", cart);
	}

	public int deleteAll(Cart cart) {

		return session.delete("productns.deleteAll", cart);
	}

	public int insert(Cart cart) {
		return session.insert("cartns.insert", cart);
	}

	public int insertPro(Product product) {
		return session.insert("productns.insertPro", product);
	}

	public int updatePro(Product product) {
		return session.update("productns.updatePro", product);
	}

	public int deletePro(int pno) {
		return session.update("productns.deletePro", pno);
	}

	public int changeDel(int pno, String p_del) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("pno", pno);
		map.put("p_del", p_del);
		return session.update("productns.changeDel", map);
	}

	public List<Product> longProduct(String id) {
		return session.selectList("productns.longProduct", id);
	}

	public List<Product> selectbuyPd(int bno) {
		return session.selectList("productns.selectbuyPd", bno);
	}

	public List<Product> sloganPd(int pno) {
		return session.selectList("productns.sloganPd", pno);
	}

	public List<Product> eventlist(int eno) {
		return session.selectList("productns.eventlist", eno);
	}

	public List<Product> eventPro(int eno) {
		return session.selectList("productns.eventPro", eno);
	}

	public int delPro(int pno, int eno) {
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("pno", pno);
		map.put("eno", eno);
		return session.delete("productns.delPro", map);
	}

	public List<Product> getNePro(int eno) {
		return session.selectList("productns.getNePro", eno);
	}

	public int insertEventList(int i, int eno) {
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("i", i);
		map.put("eno", eno);
		return session.insert("productns.insertEventList", map);
	}
	public Cart select1(int pno, String id) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("pno", pno);
		map.put("id", id);
		return (Cart) session.selectOne("cartns.select1", map);
	}



}

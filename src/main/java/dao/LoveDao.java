package dao;

import java.io.Reader;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import model.Love;
import model.Product;
import service.display.LoveAction;

public class LoveDao {
	//singleton
	private static LoveDao Instance = new LoveDao();

	private LoveDao() {}
	
	public static LoveDao getInstance() {
		return Instance;
	}
	
	private static SqlSession session;
	
	static {
		try {
			Reader reader = Resources.getResourceAsReader("configuration.xml");
			SqlSessionFactory ssf = new SqlSessionFactoryBuilder().build(reader);
			session = ssf.openSession(true);
		}catch (Exception e) {
			System.out.println(e.getMessage());
		}
	}

	public int insert(int pno, String id) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("pno", pno);
		map.put("id", id);
		return (int) session.insert("lovens.insert",map);
	}

	public Love select(int pno, String id) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("pno", pno);
		map.put("id", id);
		return (Love) session.selectOne("lovens.select",map);
	}

	public int update(int pno, String id, String c) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("pno", pno);
		map.put("id", id);
		map.put("c", c);
		return (int) session.update("lovens.update",map);
	}

	public int delete(Love love) {
		return session.update("lovens.delete", love);
	}

	public int deleteAll(Love love) {
		return session.update("lovens.deleteAll", love);
	}

	public List<Product> longProduct(String id) {
		return session.selectList("lovens.longProduct", id);
	}
}

package dao;

import java.io.Reader;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import model.Buy;

public class BuyDao {
	//singleton
	private static BuyDao Instance = new BuyDao();

	private BuyDao() {}
	
	public static BuyDao getInstance() {
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

	public int insert(Buy buy) {
		return session.insert("buyns.insert", buy);
	}
	
	public int selectbno() {
		return (int) session.selectOne("buyns.selectbno");
	}

}

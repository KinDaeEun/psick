package dao;

import java.io.Reader;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import model.Account;
import model.Buy;
import model.BuyList;
import model.Product;

public class BuyListDao {
	// singleton
	private static BuyListDao Instance = new BuyListDao();

	private BuyListDao() {
	}

	public static BuyListDao getInstance() {
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

	public int insertbuyList(BuyList buylist) {
		return session.insert("buylistns.insertbuyList", buylist);
	}

	public int selectBcount(int bno) {
		return (int) session.selectOne("buylistns.selectBcount", bno);
	}

	public List<Product> selectbuyall(String id) {

		return session.selectList("buylistns.selectbuyall", id);
	}

}

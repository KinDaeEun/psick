package dao;

import java.io.Reader;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import model.Account;

public class AccountDao {
	// singleton
	private static AccountDao Instance = new AccountDao();

	private AccountDao() {
	}

	public static AccountDao getInstance() {
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

	// ListAction.java 게시글 메인페이지 게시글 수
	public int getTotal() {
		return (int) session.selectOne("accountns.getTotal");
	}

	// ListAction.java 회원이 작성한 게시글 목록
	public List<Account> list(int startRow, int endRow) {
		HashMap<String, Integer> hu = new HashMap<>();
		hu.put("startRow", startRow);
		hu.put("endRow", endRow);
		return session.selectList("accountns.list", hu);
	}

	public int insert(Account account) {
		return session.insert("accountns.insert", account);
	}

	public Account select(int ano) {
		return (Account) session.selectOne("accountns.select", ano);
	}

	public void readcountUpdate(int ano) {
		session.update("accountns.readcountUpdate", ano);
	}

	public int update(Account account) {
		return session.update("accountns.update", account);
	}

	public int delete(int ano) {
		return session.update("accountns.delete", ano);
	}

	public int selectAno() {
		return (int) session.selectOne("accountns.selectAno");
	}

	public List<Account> search(String list_search_data) {
		return session.selectList("accountns.search",list_search_data);
	}

	public int changeDel(int ano, String a_del) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("ano", ano);
		map.put("a_del", a_del);
		return session.update("accountns.changeDel", map);
	}

	public List<Account> selectAll(int startRow, int endRow) {
		HashMap<String, Integer> map = new HashMap<>();
		map.put("startRow", startRow);
		map.put("endRow", endRow);
		return session.selectList("accountns.selectAll", map);
	}

	public int getTotalAll() {
		return (int) session.selectOne("accountns.getTotalAll");
	}

	public int adminUpdate(Account account) {
		return session.update("accountns.adminUpdate",account);
	}

	public List<Account> adminSearch(String searchKey, String searchValue) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("searchKey", searchKey);
		map.put("searchValue", searchValue);
		return session.selectList("accountns.adminSearch", map);
	}
}

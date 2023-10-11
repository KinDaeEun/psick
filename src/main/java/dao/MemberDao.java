package dao;

import java.io.IOException;
import java.io.Reader;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import model.Member;

public class MemberDao {
	// singleton
	private static MemberDao Instance = new MemberDao();

	private MemberDao() {
	}

	public static MemberDao getInstance() {
		return Instance;
	}

	private static SqlSession session;

	static {
		try {
			Reader reader = Resources.getResourceAsReader("configuration.xml");
			SqlSessionFactory ssf = new SqlSessionFactoryBuilder().build(reader);
			session = ssf.openSession(true);
		} catch (IOException e) {
			System.out.println(e.getMessage());

		}
	}

	public int insert(Member member) {

		return session.insert("memberns.insert", member);
	}

	public Member select(String id) {
		return (Member) session.selectOne("memberns.select", id);

	}

	public Member findId(String name, String tel) {
		HashMap<String, String> hm = new HashMap<String, String>();
		hm.put("name", name);
		hm.put("tel", tel);
		return (Member) session.selectOne("memberns.findId", hm);
	}

	public Member findPassword(String id, String name) {
		HashMap<String, String> hm = new HashMap<String, String>();
		hm.put("id", id);
		hm.put("name", name);
		return (Member) session.selectOne("memberns.findPassword", hm);

	}

	public int update(Member member) {
		
		return session.update("memberns.update", member);
	}

	public int delete(String id) {
		
		return session.update("memberns.delete", id);
	}

	public int getTotal() {
		return (int) session.selectOne("memberns.getTotal");
	}

	public List<Member> selectAll(int startRow, int endRow) {
		Map<String, Object> map = new HashMap<>();
		map.put("startRow", startRow);
		map.put("endRow", endRow);
		return session.selectList("memberns.selectAll", map);
	}

	public List<Member> adminSearch(String searchKey, String searchValue) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("searchKey", searchKey);
		map.put("searchValue", searchValue);
		return session.selectList("memberns.adminSearch", map);
	}

	public int changeDel(String id, String m_del) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("id", id);
		map.put("m_del", m_del);
		return session.update("memberns.changeDel",map);
	}

	public int adminUpMem(Member member) {
		return session.update("memberns.adminUpMem",member);
	}

}
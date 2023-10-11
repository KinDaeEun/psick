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
import model.Reply;
import model.Review;

public class ReplyDao {

	// singleton
	private static ReplyDao Instance = new ReplyDao();

	private ReplyDao() {
	}

	public static ReplyDao getInstance() {
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
		
	// replywrite.java 댓글 입력
	public int insert(Reply reply) {
		int num = (int) session.selectOne("replyns.selectRe_no");
		if (reply.getRe_no() != 0) { // 답글일 때
			session.update("replyns.update_Ref", reply);
			reply.setRef_step(reply.getRef_step() + 1);
			reply.setRef_level(reply.getRef_level() + 1);
		} else { // 답글 아닐 때(그냥 댓글)
			reply.setRef(num);
		}
		return session.insert("replyns.insert",reply);
	}

	public List<Reply> list(int startRow, int endRow, int ano) {
		HashMap<String, Integer> map = new HashMap<>();
		map.put("startRow", startRow);
		map.put("endRow", endRow);
		map.put("ano", ano);
		return session.selectList("replyns.list", map);
	}
	public int getTotal(int ano) {
		
		return (int) session.selectOne("replyns.getTotal",ano);
	}
	public int update(Reply reply) {
		return session.update("replyns.update", reply);
	}
	public Reply ref_select(int ano) {
		return (Reply) session.selectOne("replyns.ref_select", ano);
	}
	public int selectre_no() {
		
		return (int) session.selectOne("replyns.selectre_no");
	}
	public int delete(int re_no) {
		
		return session.update("replyns.delete", re_no);
	}

	public int getTotalAll(int ano) {
		return (int) session.selectOne("replyns.getTotalAll",ano);
	}


	public List<Reply> getAccReply(int startRow, int endRow, int ano) {
		Map<String,Integer> map = new HashMap<>();
		map.put("startRow", startRow);
		map.put("endRow", endRow);
		map.put("ano", ano);
		return session.selectList("replyns.getAccReply",map);
	}

	public int changeDel(int re_no, String ref_del) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("re_no", re_no);
		map.put("ref_del", ref_del);
		return session.update("replyns.changeDel", map);
	}

	public Reply getReply(int re_no) {
		return (Reply) session.selectOne("replyns.getReply",re_no);
	}

	public List<Reply> adminSearch(String searchKey, String searchValue, int ano) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("searchKey", searchKey);
		map.put("searchValue", searchValue);
		map.put("ano", ano);
		return session.selectList("replyns.adminSearch", map);
	}

}

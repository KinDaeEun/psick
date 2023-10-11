package dao;

import java.io.Reader;
import java.lang.StackWalker.Option;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import model.Review;

public class ReviewDao {
	// singleton
	private static ReviewDao Instance = new ReviewDao();

	private ReviewDao() {
	}

	public static ReviewDao getInstance() {
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

	// 리뷰 입력
	public int insert(Review review) {
		return session.insert("reviewns.insert", review);
	}

	// 리뷰 수정
	public int update(Review review) {
		return session.update("reviewns.update", review);
	}

	// 리뷰 삭제
	public int delete(int rno) {
		Map<String, Object> map = new HashMap<>();
		map.put("rno", rno);
		return session.update("reviewns.delete", map);
	}

	public float selectStar(int pno) {
		return (float) session.selectOne("reviewns.selectStar",pno);
	}

	public int starCount(int pno) {
		return (int) session.selectOne("reviewns.starCount",pno);
	}

	public List<Review> selectReview(int pno) {
		return session.selectList("reviewns.selectReview",pno);
	}

	public int getTotal(int pno) {
		return (int) session.selectOne("reviewns.getTotal",pno);
	}

	public List<Review> getProReview(int startRow, int endRow, int pno) {
		Map<String,Integer> map = new HashMap<>();
		map.put("startRow", startRow);
		map.put("endRow", endRow);
		map.put("pno", pno);
		return session.selectList("reviewns.getProReview",map);
	}

	public Review getReview(int rno) {
		return (Review) session.selectOne("reviewns.getReview",rno);
	}
	
	public List<Float> sloganStar(int pno) {
		return session.selectList("reviewns.sloganStar",pno);
	}

	public int changeDel(int rno, String r_del) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("rno", rno);
		map.put("r_del", r_del);
		return session.update("reviewns.changeDel", map);
	}

	public List<Review> adminSearch(String searchKey, String searchValue, int pno) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("searchKey", searchKey);
		map.put("searchValue", searchValue);
		map.put("pno", pno);
		return session.selectList("reviewns.adminSearch", map);
	}

	public int getTotalAll(int pno) {
		return (int) session.selectOne("reviewns.getTotalAll",pno);

	}


}

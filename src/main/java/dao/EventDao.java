package dao;

import java.io.Reader;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import model.Event;
import service.display.EventForm;

public class EventDao {
	// singleton
	private static EventDao Instance = new EventDao();

	private EventDao() {
	}

	public static EventDao getInstance() {
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

	
	  public int getTotal() {  return 0; }
	 

	public List<Event> event(int startRow, int endRow) {
		Map<String,Integer> map = new HashMap<String, Integer>();
		map.put("startRow", startRow);
		map.put("endRow", endRow);
		return session.selectList("eventns.event",map);
	}

	public Event selectEvent(int eno) {
		return (Event) session.selectOne("eventns.selectEvent",eno);
	}

	public int getTotalAll() {
		
		return (int) session.selectOne("eventns.getTotalAll");
	}

	public List<Event> selectAll(int startRow, int endRow) {
		Map<String,Integer> map = new HashMap<String, Integer>();
		map.put("startRow", startRow);
		map.put("endRow", endRow);
		return session.selectList("eventns.selectAll",map);
	}

	public int changeDel(int eno, String e_del) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("eno", eno);
		map.put("e_del", e_del);
		return session.update("eventns.changeDel", map);
	}

	public Event getEvent(int eno) {
		return (Event) session.selectOne("eventns.getEvent",eno);
	}

	public int updateEvent(Event event) {
		return session.update("eventns.updateEvent",event);
	}

	public List<Event> adminSearch(String searchKey, String searchValue) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("searchKey", searchKey);
		map.put("searchValue", searchValue);
		return session.selectList("eventns.adminSearch", map);
	}

	public int insertEvent(Event event) {
		return session.insert("eventns.insertEvent",event);
	}
	
}

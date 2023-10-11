package service.admin;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.EventDao;
import dao.ProductDao;
import model.Event;
import model.Product;
import service.CommandProcess;

public class AdminFindEvent implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		String searchKey =  request.getParameter("searchKey");
		String searchValue = request.getParameter("searchValue");
		String keyName = "";
		if(searchKey.equals("eno"))
			keyName = "기획번호";
		if(searchKey.equals("ename"))
			keyName = "기획이름";

		
		
		EventDao ed = EventDao.getInstance();
		List<Event> list = ed.adminSearch(searchKey,searchValue);
		request.setAttribute("list", list);
		request.setAttribute("keyName", keyName);
		request.setAttribute("searchValue", searchValue);
		return "adminFindEvent";
	}

}

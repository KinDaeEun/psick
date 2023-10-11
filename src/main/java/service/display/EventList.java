package service.display;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.EventDao;
import dao.EventListDao;
import dao.ProductDao;
import model.Event;
import model.Product;
import service.CommandProcess;

public class EventList implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {

		ProductDao pd = ProductDao.getInstance();

		int eno = Integer.parseInt(request.getParameter("eno"));

		EventDao ed = EventDao.getInstance();
		Event event = ed.selectEvent(eno);

		List<Product> list = pd.eventlist(eno);

		request.setAttribute("list", list);
		request.setAttribute("event", event);

		return "eventlist";
	}
}

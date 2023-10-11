package service.admin;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.EventDao;
import model.Event;
import service.CommandProcess;

public class AdminUpdateEventForm implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		int eno = Integer.parseInt(request.getParameter("eno"));
		
		EventDao ed = EventDao.getInstance();
		Event event = ed.getEvent(eno);
		
		request.setAttribute("event", event);
		return "adminUpdateEventForm";
	}

}

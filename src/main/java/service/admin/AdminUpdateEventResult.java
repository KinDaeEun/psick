package service.admin;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import dao.EventDao;
import model.Event;
import service.CommandProcess;

public class AdminUpdateEventResult implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		String real = request.getServletContext().getRealPath("/images/event_img");
		int maxSize = 1024 * 11024 * 10;
		Event event = new Event();
		MultipartRequest mr = null;
		try {
			mr = new MultipartRequest(request, real,maxSize,"utf-8",
				new DefaultFileRenamePolicy());
			int eno = Integer.parseInt(mr.getParameter("eno"));
			String ename = mr.getParameter("ename");
			String e_img = mr.getFilesystemName("e_img");
			event.setEno(eno);
			event.setEname(ename);
			event.setE_img(e_img);

			
			

		}catch (Exception e) {
			System.out.println(e.getMessage());
			
		}

		EventDao ed = EventDao.getInstance();
		int result = ed.updateEvent(event);
		request.setAttribute("result", result);	
		
		return "adminUpdateEventResult";
	}

}

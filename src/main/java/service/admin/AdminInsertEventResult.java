package service.admin;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import dao.EventDao;
import model.Event;
import service.CommandProcess;

public class AdminInsertEventResult implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		String real = request.getServletContext().getRealPath("/images/event_img");
		int maxSize = 1024 * 11024 * 10;
		Event event = new Event();
		MultipartRequest mr = null;
		try {
			mr = new MultipartRequest(request, real,maxSize,"utf-8",
				new DefaultFileRenamePolicy());

			String ename = mr.getParameter("ename");
			String e_img = mr.getFilesystemName("e_img");
			String e_del = mr.getParameter("e_del");

			event.setEname(ename);
			event.setE_img(e_img);
			event.setE_del(e_del);
			System.out.println(ename);
			System.out.println(e_img);
			System.out.println(e_del);

		}catch (Exception e) {
			System.out.println(e.getMessage());
			
		}

		EventDao ed = EventDao.getInstance();
		int result = ed.insertEvent(event);
		request.setAttribute("result", result);	
		return "adminInsertEventResult";
	}

}

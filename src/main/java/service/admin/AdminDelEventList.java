package service.admin;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.EventListDao;
import dao.ProductDao;
import service.CommandProcess;

public class AdminDelEventList implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		int pno = Integer.parseInt(request.getParameter("pno"));
		int eno = Integer.parseInt(request.getParameter("eno"));
		
		ProductDao pd = ProductDao.getInstance();
		int result = pd.delPro(pno,eno);
		
		request.setAttribute("result", result);
		request.setAttribute("eno", eno);
		return "adminDelEventList";
	}

}

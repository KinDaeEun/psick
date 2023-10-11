package service.display;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.LoveDao;
import dao.ProductDao;
import model.Love;
import model.Product;
import service.CommandProcess;

public class LoveviewDel implements CommandProcess {

	public String requestPro(HttpServletRequest request, HttpServletResponse response) {

		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("id");
		int pno = Integer.parseInt(request.getParameter("pno"));
		LoveDao ld = LoveDao.getInstance();
		Love love = new Love();
		love.setId(id);
		love.setPno(pno);
		
		int result = ld.delete(love);
		
		request.setAttribute("result", result);
		return "loveviewDel";
	}

}

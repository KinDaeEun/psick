package service.display;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.LoveDao;
import dao.ProductDao;
import model.Love;
import model.Product;
import service.CommandProcess;

public class LoveView implements CommandProcess {
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("id");
		
		LoveDao ld = LoveDao.getInstance();
		List<Product> list = ld.longProduct(id); 
		

		request.setAttribute("list", list);
		
		return "loveview";
	}
}

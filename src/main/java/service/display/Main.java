package service.display;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.ProductDao;
import model.Product;
import service.CommandProcess;

public class Main implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		ProductDao pd = ProductDao.getInstance();
		
		
		List<Product> disList = pd.disList();
		List<Product> freshList = pd.freshList();
		List<Product> bestList = pd.bestList(); 
		
		request.setAttribute("disList",disList);
		request.setAttribute("freshList",freshList);
		request.setAttribute("bestList",bestList);
		return "main";
	}

}

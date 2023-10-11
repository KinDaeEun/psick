package service.display;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.ProductDao;
import model.Product;
import service.CommandProcess;

public class Search implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		String search_data = request.getParameter("search_data");
		
		ProductDao pd = ProductDao.getInstance();
		List<Product> pdList = pd.search(search_data);

		request.setAttribute("pdList", pdList);
		request.setAttribute("search_data", search_data);
	
		return "search";
	}
}

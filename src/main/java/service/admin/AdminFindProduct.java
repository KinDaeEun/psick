package service.admin;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.ProductDao;
import model.Product;
import service.CommandProcess;

public class AdminFindProduct implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		String searchKey =  request.getParameter("searchKey");
		String searchValue = request.getParameter("searchValue");
		String keyName = "";
		if(searchKey.equals("pno"))
			keyName = "상품코드";
		if(searchKey.equals("pname"))
			keyName = "상품명";
		if(searchKey.equals("p_kind"))
			keyName = "종류";
		
		
		ProductDao pd = ProductDao.getInstance();
		List<Product> list = pd.adminSearch(searchKey,searchValue);
		request.setAttribute("list", list);
		request.setAttribute("keyName", keyName);
		request.setAttribute("searchValue", searchValue);
		
		
		return "adminFindProduct";
	}

}

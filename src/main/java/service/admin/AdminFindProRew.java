package service.admin;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.ProductDao;
import dao.ReviewDao;
import model.Product;
import model.Review;
import service.CommandProcess;

public class AdminFindProRew implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		String searchKey =  request.getParameter("searchKey");
		String searchValue = request.getParameter("searchValue");
		int pno = Integer.parseInt(request.getParameter("pno"));
		String keyName = "";
		if(searchKey.equals("rno"))
			keyName = "리뷰번호";
		if(searchKey.equals("id"))
			keyName = "작성자";
		if(searchKey.equals("r_title"))
			keyName = "제목";
		
		
		ReviewDao rd = ReviewDao.getInstance();
		List<Review> list = rd.adminSearch(searchKey,searchValue,pno);
		request.setAttribute("list", list);
		request.setAttribute("keyName", keyName);
		request.setAttribute("searchValue", searchValue);
		request.setAttribute("pno", pno);
		return "adminFindProRew";
	}

}

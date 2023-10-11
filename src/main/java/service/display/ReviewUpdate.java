package service.display;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.ReviewDao;
import model.Review;
import service.CommandProcess;

public class ReviewUpdate implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		int pno = Integer.parseInt(request.getParameter("pno"));
		String id = request.getParameter("id");
		String r_content = request.getParameter("r_content");
		String r_title = request.getParameter("r_title");
		
		ReviewDao rd = ReviewDao.getInstance();
		
		// setting
		Review review = new Review();
		review.setId(id);
		review.setR_title(r_title);
		review.setR_content(r_content);
		
		System.out.println(id);
		System.out.println(r_title);
		System.out.println(r_content);
		
		int result = rd.update(review);
		
		request.setAttribute("result", result);
		request.setAttribute("pno", pno);
		
		return "reviewUpdate";
	}

}

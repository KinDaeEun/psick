package service.admin;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.ReviewDao;
import model.Review;
import service.CommandProcess;

public class AdminUpdateRevResult implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		int rno = Integer.parseInt(request.getParameter("rno"));
		int pno = Integer.parseInt(request.getParameter("pno"));
		
		String r_title = request.getParameter("r_title");
		int star = Integer.parseInt(request.getParameter("star"));
		String r_content = request.getParameter("r_content");
		
		ReviewDao rd = ReviewDao.getInstance();
		Review review = new Review();
		review.setRno(rno);
		review.setR_title(r_title);
		review.setStar(star);
		review.setR_content(r_content);
		int result = rd.update(review);
		
		request.setAttribute("result", result);
		request.setAttribute("pno", pno);
		return "adminUpdateRevResult";
	}

}

package service.admin;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.ReviewDao;
import model.Review;
import service.CommandProcess;

public class AdminUpdateRevForm implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		int rno = Integer.parseInt(request.getParameter("rno"));
		int pno = Integer.parseInt(request.getParameter("pno"));
		
		ReviewDao rd = ReviewDao.getInstance();
		Review review = rd.getReview(rno);
		
		request.setAttribute("pno", pno);
		request.setAttribute("review", review);
		return "adminUpdateRevForm";
	}

}

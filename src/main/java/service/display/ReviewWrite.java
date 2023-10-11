package service.display; 

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.ReviewDao;
import model.Review;
import service.CommandProcess;

public class ReviewWrite implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		
		HttpSession session = request.getSession();
		
		int pno = Integer.parseInt(request.getParameter("pno"));
		String id = (String) session.getAttribute("id");
		String r_title = request.getParameter("title");
		String r_content = request.getParameter("content");
		int r_star = Integer.parseInt(request.getParameter("star"));
		
		
		Review review = new Review();
		
		review.setR_title(r_title);
		review.setR_content(r_content);
		review.setId(id);
		review.setPno(pno);
		review.setStar(r_star);
		
		ReviewDao rd = ReviewDao.getInstance();
		
		int result = rd.insert(review);
		pno = review.getPno();
	
		request.setAttribute("result", result);
		request.setAttribute("id",id);
		request.setAttribute("pno", pno);
		
		
		
		return "reviewWrite";
	}

}

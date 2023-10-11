package service.display;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.ReviewDao;
import service.CommandProcess;

public class ReviewDelete implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		
		int rno = Integer.parseInt(request.getParameter("rno"));
		int pno = Integer.parseInt(request.getParameter("pno"));
		
		ReviewDao rd = ReviewDao.getInstance();
		int result = rd.delete(rno);


		request.setAttribute("result", result);
		request.setAttribute("rno", rno);
		request.setAttribute("pno", pno);

		return "reviewDelete";
	}

}

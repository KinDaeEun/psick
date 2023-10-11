package service.admin;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.ProductDao;
import service.CommandProcess;

public class AdminInsertElResult implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		String[] pno1 = request.getParameterValues("pno");
		int eno=Integer.parseInt(request.getParameter("eno"));
		int[] pnos = new int[pno1.length];
		for (int i = 0; i < pnos.length; i++) {
			pnos[i] = Integer.parseInt(pno1[i]);
		}
		ProductDao pd = ProductDao.getInstance();

		
		int result = 0;
		for(int i = 0;i<pnos.length;i++) {
			result = pd.insertEventList(pnos[i],eno);
		}
		request.setAttribute("result", result);
		request.setAttribute("eno", eno);
		

		return "adminInsertElResult";
	}

}

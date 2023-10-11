package service.member;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.*;
import model.*;

import service.CommandProcess;

public class MyCartList implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		if (session.getAttribute("id") != null) {
			String id = (String) session.getAttribute("id");
			MemberDao md = MemberDao.getInstance();

			Member member = md.select(id);
			ProductDao pd = ProductDao.getInstance();

			
			List<Product> list = pd.cartlist(id);

			System.out.println("size=" + list.size());

			request.setAttribute("member", member);
			request.setAttribute("list", list);


		}
		return "myCartList";
	}
}

package service.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.CommandProcess;

public class LoginForm implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		// 이전 주소 경로 가져오기
		String prevUrl = request.getHeader("Referer");
		prevUrl = prevUrl.substring(21);
		System.out.println("loginForm prevUrl="+prevUrl);
		if(prevUrl.equals("/psick/views/member/JoinResult.ys"))
			prevUrl="/psick/views/display/main.en";
		request.setAttribute("prevUrl", prevUrl);
	//	System.out.println("prevUrl="+prevUrl);
		return "loginForm";
	}

}

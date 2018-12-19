package com.ajax.app.servlets;

import java.io.IOException;
import java.util.Arrays;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class ValidateUserName
 */
@WebServlet("/validateUserName")
public class ValidateUserName extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ValidateUserName() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		List<String> userNames = Arrays.asList("aaa", "bbb", "ccc");
		
		String userName = request.getParameter("userName");
		String result;
		if(userNames.contains(userName)) {
			
			result = "<font color='red'>该用户名已经被注册!</font>";
			
		} else {
			
			result = "<font color='green'>该用户名可以使用!</font>";
			
		}
		
		response.setContentType("text/html; charset=UTF-8");
		response.setCharacterEncoding("UTF-8");
		response.getWriter().print(result);
		
	}

}

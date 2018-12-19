package com.ajax.app.servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpSession;

import com.ajax.app.bean.ShoppingCar;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.alibaba.fastjson.JSON;

/**
 * Servlet implementation class AddToCarServlet
 */
@WebServlet("/addToCar")
public class AddToCarServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public AddToCarServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 1. ��ȡ��������
		String bookName = request.getParameter("bookName");
		int price = Integer.parseInt(request.getParameter("price"));
		
		// 2. ��ӹ��ﳵ
		HttpSession session = request.getSession();
		ShoppingCar shoppingCar = (ShoppingCar) session.getAttribute("shoppingCar");
		
		if(shoppingCar == null) {
			
			shoppingCar = new ShoppingCar();
			session.setAttribute("shoppingCar", shoppingCar);
			
		}
		
		shoppingCar.addCar(bookName, price);
		
		// 3. ׼�� Json ����, Json ��ֻ�ܰ���˫����
		/*StringBuffer result = new StringBuffer();
		result.append("{")
			  .append("\"bookName\":\"" + bookName + "\"")
			  .append(",")
			  .append("\"totalBookNumber\":" + shoppingCar.getTotalNumber())
			  .append(",")
			  .append("\"totalPrice\":" + shoppingCar.getTotalPrice())
			  .append("}");*/
		String result = JSON.toJSONString(shoppingCar);
		System.out.println(result);
		
		// 4. ���� Json ��Ӧ
		response.setContentType("text/javascript; charset=UTF-8");
		response.setCharacterEncoding("UTF-8");
		response.getWriter().print(result);
	
	}

}

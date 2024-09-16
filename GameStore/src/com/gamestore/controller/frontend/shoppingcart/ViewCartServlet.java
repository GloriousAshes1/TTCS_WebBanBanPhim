package com.gamestore.controller.frontend.shoppingcart;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.gamestore.dao.CategoryDAO;
import com.gamestore.dao.GameDAO;
import com.gamestore.entity.Category;
import com.gamestore.entity.Game;


@WebServlet("/view_cart")
public class ViewCartServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public ViewCartServlet() {
		super();

	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		CategoryDAO categoryDAO = new CategoryDAO();
		List<Category> listCategory = categoryDAO.listAll();
		request.setAttribute("listCategory", listCategory);
		
		Object cartObject = request.getSession().getAttribute("cart");

		if (cartObject == null) {
			ShoppingCart shoppingCart = new ShoppingCart();
			request.getSession().setAttribute("cart", shoppingCart);
		}

		String cartPage = "frontend/shopping_cart.jsp";
		RequestDispatcher dispatcher = request.getRequestDispatcher(cartPage);
		dispatcher.forward(request, response);
	}

}

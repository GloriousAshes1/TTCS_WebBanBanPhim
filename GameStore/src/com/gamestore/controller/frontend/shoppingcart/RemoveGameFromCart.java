package com.gamestore.controller.frontend.shoppingcart;

import java.io.IOException;

import javax.persistence.Persistence;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.gamestore.dao.GameDAO;
import com.gamestore.entity.Game;

@WebServlet("/remove_from_cart")
public class RemoveGameFromCart extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public RemoveGameFromCart() {
		super();

	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		Integer gameId = Integer.parseInt(request.getParameter("game_id"));

		Object cartObject = request.getSession().getAttribute("cart");

		ShoppingCart shoppingCart = (ShoppingCart) cartObject;



		shoppingCart.removeItems(new Game(gameId));

		String cartPage = request.getContextPath().concat("/view_cart");
		response.sendRedirect(cartPage);
	}

}

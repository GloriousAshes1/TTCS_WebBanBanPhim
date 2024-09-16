package com.gamestore.controller.frontend.shoppingcart;

import java.io.IOException;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.gamestore.dao.GameDAO;
import com.gamestore.entity.Game;

@WebServlet("/add_to_cart")
public class AddGameToCartServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	GameDAO gameDAO;

    public AddGameToCartServlet() {
        super();

    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Integer gameId = Integer.parseInt(request.getParameter("game_id"));
		
		Object cartObject = request.getSession().getAttribute("cart");
		
		ShoppingCart shoppingCart = null;
		if(cartObject != null && cartObject instanceof ShoppingCart) {
			shoppingCart = (ShoppingCart) cartObject;
		}else {
			shoppingCart = new ShoppingCart();
			request.getSession().setAttribute("cart", shoppingCart);
		}
		
		gameDAO = new GameDAO();
		Game game = gameDAO.get(gameId);
		
		shoppingCart.addItem(game);
		
		String cartPage = request.getContextPath().concat("/view_cart");
		response.sendRedirect(cartPage);
	}

}

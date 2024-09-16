package com.gamestore.controller.frontend;

import com.gamestore.controller.BaseServlet;
import com.gamestore.service.GameServices;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/search")
public class SearchGameServlet extends BaseServlet {
	private static final long serialVersionUID = 1L;

    public SearchGameServlet() {
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		GameServices gameServices = new GameServices(request, response);
		gameServices.search();
	}

}

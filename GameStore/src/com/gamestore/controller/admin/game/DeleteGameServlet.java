package com.gamestore.controller.admin.game;

import com.gamestore.controller.BaseServlet;
import com.gamestore.service.GameServices;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/admin/delete_game")
public class DeleteGameServlet extends BaseServlet {
	private static final long serialVersionUID = 1L;

    public DeleteGameServlet() {
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		GameServices gameServices = new GameServices(request, response);
		gameServices.deleteGame();
	}

}
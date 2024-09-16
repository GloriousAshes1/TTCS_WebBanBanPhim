package com.gamestore.controller.frontend.game;

import com.gamestore.controller.BaseServlet;
import com.gamestore.service.GameServices;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/view_game")
public class ViewGameServlet extends BaseServlet {
	private static final long serialVersionUID = 1L;

    public ViewGameServlet() {
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		GameServices gameServices=new GameServices(request, response);
		gameServices.viewGameDetail();
	}

}

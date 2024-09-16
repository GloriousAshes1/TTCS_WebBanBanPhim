package com.gamestore.controller.admin.game;

import com.gamestore.controller.BaseServlet;
import com.gamestore.service.GameServices;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/admin/create_game")
@MultipartConfig(
		fileSizeThreshold = 1024 * 10, // 10 KB
		maxFileSize = 1024 *1024,	   // 100 KB
		maxRequestSize = 1024 * 1024   // 1 MB
)
public class CreateGameServlet extends BaseServlet {
	private static final long serialVersionUID = 1L;

    public CreateGameServlet() {
    	
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		GameServices gameServices = new GameServices(request, response);
		gameServices.createGame();
	}
}

package com.gamestore.controller.admin.order;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.gamestore.dao.GameDAO;
import com.gamestore.entity.Game;


@WebServlet("/admin/add_game_form")
public class ShowAddGameServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public ShowAddGameServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		GameDAO gameDAO = new GameDAO();
	    List<Game> listGame = gameDAO.listAll();
	    request.setAttribute("listGame", listGame);
	    String addFormPage = "add_game_form.jsp";
		RequestDispatcher dispatcher = request.getRequestDispatcher(addFormPage);
		dispatcher.forward(request, response);
	}
}
package com.gamestore.service;

import java.io.IOException;
import java.io.InputStream;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.persistence.EntityManager;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import com.gamestore.dao.CategoryDAO;
import com.gamestore.dao.GameDAO;
import com.gamestore.entity.Category;
import com.gamestore.entity.Game;

public class GameServices {
	private EntityManager entityManager;
	private GameDAO gameDAO;
	private CategoryDAO categoryDAO;
	private HttpServletRequest request;
	private	HttpServletResponse response;
	
	
	
	public GameServices(HttpServletRequest request, HttpServletResponse response) {
		super();
		this.request = request;
		this.response = response;
		gameDAO = new GameDAO();
		categoryDAO = new CategoryDAO();
	}

	public void listGames() throws ServletException, IOException {
		listGames(null);
	}

	public void listGames(String message) throws ServletException, IOException {
		List<Game> listGames = gameDAO.listAll();
		request.setAttribute("listGames", listGames);
		
		if(message != null) {
			request.setAttribute("message", message);
		}
		
		String listPage = "game_list.jsp";
		RequestDispatcher requestDispatcher = request.getRequestDispatcher(listPage);
		requestDispatcher.forward(request, response);
	}
	
	public void showGameNewForm() throws ServletException, IOException {
		List<Category> listCategory = categoryDAO.listAll();
		request.setAttribute("listCategory", listCategory);
		
		String newPage = "game_form.jsp";
		RequestDispatcher requestDispatcher = request.getRequestDispatcher(newPage);
		requestDispatcher.forward(request, response);
	}

	public void createGame() throws ServletException, IOException {
		String title = request.getParameter("title");
		
		Game existGame = gameDAO.findByTitle(title);
		if (existGame != null) {
			String message = "Could not create new game because the title '" + title + "' already exists.";
			listGames(message);
			return;
		}
		
		Game newGame = new Game();
		readGameFields(newGame);
		
		Game createdGame = gameDAO.create(newGame);
		
		if (createdGame.getGameId() > 0) {
			String message = "A new game has been created successfully";
			listGames(message);
		}
	}
	
	public void readGameFields(Game game) throws ServletException, IOException {
	    String title = request.getParameter("title");
	    String developer = request.getParameter("developer");
	    String publisher = request.getParameter("publisher");
	    String description = request.getParameter("description");
	    float price = Float.parseFloat(request.getParameter("price"));
	    
	    final String newFormat = "yyyy-MM-dd";
	    SimpleDateFormat sdf = new SimpleDateFormat(newFormat);
	    Date publishDate = null;
	    Calendar currentDate = null;
	    
	    try {
	        String publishDateString = request.getParameter("publishDate");
	        if (publishDateString != null && !publishDateString.isEmpty()) {
	            publishDate = sdf.parse(publishDateString);
	        } else {
	            throw new ServletException("Publish date is required and cannot be empty.");
	        }
	        currentDate = Calendar.getInstance();
	    } catch (ParseException ex) {
	        ex.printStackTrace();
	        throw new ServletException("Error parsing date (format is yyyy-MM-dd)");
	    }
	    
	    game.setTitle(title);
	    game.setDeveloper(developer);
	    game.setPublisher(publisher);
	    game.setDescription(description);
	    game.setPrice(price);
	    game.setPublishDate(publishDate);
	    
	    Integer categoryId = Integer.parseInt(request.getParameter("category"));        
	    Category category = categoryDAO.get(categoryId);
	    game.setCategory(category);
	    
	    Date lastUpdateTimeDate = currentDate.getTime();
	    game.setLastUpdateTime(lastUpdateTimeDate);
	    
	    Part part = request.getPart("image");
	    if (part != null && part.getSize() > 0) {
	        long size = part.getSize();
	        byte[] imageBytes = new byte[(int)size];
	        
	        InputStream inputStream = part.getInputStream();
	        inputStream.read(imageBytes);
	        inputStream.close();
	        
	        game.setImage(imageBytes);
	    }
	}

	public void editGame() throws ServletException, IOException {
		Integer gameId = Integer.parseInt(request.getParameter("id"));
		Game game = gameDAO.get(gameId);
		
		List<Category> listCategory = categoryDAO.listAll();
		
		request.setAttribute("game", game);
		request.setAttribute("listCategory", listCategory);
		
		String editPage = "game_form.jsp";
		RequestDispatcher requestDispatcher = request.getRequestDispatcher(editPage);
		requestDispatcher.forward(request, response);
	}

	public void updateGame() throws ServletException, IOException {
		Integer gameId = Integer.parseInt(request.getParameter("gameId"));
		String title = request.getParameter("title");
		
		Game existGame  = gameDAO.get(gameId);
		Game gameByTitle = gameDAO.findByTitle(title);
		
		if (gameByTitle != null && !existGame.equals(gameByTitle)) {
			String message = "Couldn't update game because there's another game having same title.";
			listGames(message);
			return;
		}
		
		readGameFields(existGame);
		
		gameDAO.update(existGame);
		
		String message = "The game has been updated successfully";
		listGames(message);
	}

	public void deleteGame() throws ServletException, IOException {
		Integer gameId = Integer.parseInt(request.getParameter("id"));

		gameDAO.delete(gameId);
		
		String message = "The game has been deleted successfully.";
		listGames(message);
	}

	public void listGamesByCategory() throws ServletException, IOException {
		int categoryId = Integer.parseInt(request.getParameter("id"));
		List<Game> listGames = gameDAO.listByCategory(categoryId);
		Category category = categoryDAO.get(categoryId);
		List<Category> listCategory = categoryDAO.listAll();
		
		request.setAttribute("listCategory", listCategory);
		request.setAttribute("listGames", listGames);
		request.setAttribute("category", category);
		
		String listPage = "frontend/games_list_by_category.jsp";
		RequestDispatcher requestDispatcher = request.getRequestDispatcher(listPage);
		requestDispatcher.forward(request, response);
	}

	public void viewGameDetail() throws ServletException, IOException {
		Integer gameId = Integer.parseInt(request.getParameter("id"));		
		Game game = gameDAO.get(gameId);
		List<Category> listCategory = categoryDAO.listAll();
		
		request.setAttribute("listCategory", listCategory);
		request.setAttribute("game", game);
		
		String detailPage = "frontend/game_detail.jsp";
		RequestDispatcher requestDispatcher = request.getRequestDispatcher(detailPage);
		requestDispatcher.forward(request, response);
	}

	public void search() throws ServletException, IOException {
		String keyword = request.getParameter("keyword");
		List<Game> result = null;
		
		if (keyword.equals("")) {
			result = gameDAO.listAll();
		}
		else {
			result = gameDAO.search(keyword);
		}
		
		request.setAttribute("keyword", keyword);
		request.setAttribute("result", result);
		
		String resultPage = "frontend/search_result.jsp";
		RequestDispatcher requestDispatcher = request.getRequestDispatcher(resultPage);
		requestDispatcher.forward(request, response);
	}
}

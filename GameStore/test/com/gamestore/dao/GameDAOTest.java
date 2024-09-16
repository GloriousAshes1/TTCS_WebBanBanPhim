package com.gamestore.dao;

import static org.junit.Assert.*;

import java.io.File;
import java.io.IOException;
import java.net.URI;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

import org.junit.AfterClass;
import org.junit.BeforeClass;
import org.junit.Test;

import com.gamestore.entity.Category;
import com.gamestore.entity.Game;

public class GameDAOTest {
	private static GameDAO gameDAO;

	@BeforeClass
	public static void setUpBeforeClass() throws Exception {
		gameDAO = new GameDAO();
	}

	@AfterClass
	public static void tearDownAfterClass() throws Exception {
		gameDAO.close();
	}

	@Test
	public void testCreateGame() throws ParseException, IOException {
		Game newGame = new Game();
		
		CategoryDAO categoryDAO = new CategoryDAO();
		Category category = categoryDAO.get(2);
		
		newGame.setCategory(category);

		newGame.setTitle("Diablo® IV");
		newGame.setDeveloper("Blizzard Entertainment, Inc.");
		newGame.setPublisher("Blizzard Entertainment, Inc.");
		newGame.setDescription(
				"Join the fight for Sanctuary in Diablo® IV, the ultimate action RPG adventure. Experience the critically acclaimed campaign and new seasonal content.");
		newGame.setPrice(38.99f);

		DateFormat dateformat = new SimpleDateFormat("dd/MM/yyyy");
		Date publishDate = dateformat.parse("18/10/2023");
		newGame.setPublishDate(publishDate);

		String imagePath = "C:\\Users\\LocNguyen\\Downloads\\Image for web\\diabloIV.JPG";
		byte[] imageBytes = Files.readAllBytes(Paths.get(imagePath));
		newGame.setImage(imageBytes);

		Game createGame = gameDAO.create(newGame);

		assertTrue(createGame.getGameId() > 0);
	}

	@Test
	public void testUpdateGame() throws ParseException, IOException {
		Game existGame = new Game();
		existGame.setGameId(33);

		Category category = new Category("Adventure");
		category.setCategoryId(2);
		existGame.setCategory(category);

		existGame.setTitle("Elden Ring");
		existGame.setDeveloper("FromSoftware Inc.");
		existGame.setPublisher("FromSoftware Inc., Bandai Namco Entertainment");
		existGame.setDescription(
				"THE NEW FANTASY ACTION RPG. Rise, Tarnished, and be guided by grace to brandish the power of the Elden Ring and become an Elden Lord in the Lands Between.");
		existGame.setPrice(59.99f);

		DateFormat dateformat = new SimpleDateFormat("dd/MM/yyyy");
		Date publishDate = dateformat.parse("25/02/2022");
		existGame.setPublishDate(publishDate);

		String imagePath = "C:\\Users\\LocNguyen\\Downloads\\Image for web\\elden ring.JPG";
		byte[] imageBytes = Files.readAllBytes(Paths.get(imagePath));
		existGame.setImage(imageBytes);

		Game updateGame = gameDAO.update(existGame);

		assertEquals(existGame.getTitle(), "Elden Ring");
	}

	@Test
	public void testGetListAll() {
		List<Game> listGames = gameDAO.listAll();
		for (Game aGame : listGames) {
			System.out.println(aGame.getTitle() + "-" + aGame.getPublisher());
		}
		assertFalse(listGames.isEmpty());
	}

	@Test
	public void testFindByName() {
		String title = "Counter-Strike 2";
		Game game = gameDAO.findByTitle(title);

		System.out.println(game.getDeveloper());
		System.out.println(game.getPrice());

		assertNull(game);
	}
	
	@Test
	public void testListByCategory() {
		int categoryId = 2;
		
		List<Game> listGames = gameDAO.listByCategory(categoryId);
		
		assertTrue(listGames.size() > 0);
	}
	
	@Test
	public void testListNewGames() {
		List<Game> listNewGames = gameDAO.listNewGames();
		for (Game Game : listNewGames) {
			System.out.println(Game.getTitle() + " - " + Game.getPublishDate());
		}
		
		assertEquals(3, listNewGames.size());
	}
	
	@Test
	public void testSearchGame() {
		String keyword = "Unknown";
		List<Game> result = gameDAO.search(keyword);
		
		assertEquals(1, result.size());
	}
	
	@Test
	public void testCountByCategory() {
		int categoryId = 14;
		long numOfGames = gameDAO.countByCategory(categoryId);
		
		assertTrue(numOfGames == 2);
	}
	@Test
	public void testBestSelling() {
		List<Game> topSellingGames = gameDAO.listBestSellingGames();
		
		assertEquals(3, topSellingGames.size());
	}
}

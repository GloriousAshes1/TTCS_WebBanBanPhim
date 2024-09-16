package com.gamestore.dao;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.gamestore.entity.Game;

public class GameDAO extends JpaDAO<Game> implements GenericDAO<Game> {
	public GameDAO() {
	}

	@Override
	public Game create(Game game) {
		game.setLastUpdateTime(new Date());
		return super.create(game);
	}
	
	@Override
	public Game update(Game game) {
		game.setLastUpdateTime(new Date());
		return super.update(game);
	}
	
	@Override
	public Game get(Object id) {
		return super.find(Game.class, id);
	}

	@Override
	public void delete(Object id) {
		super.delete(Game.class, id);
		
	}

	@Override
	public List<Game> listAll() {
		return super.findWithNamedQuery("Game.findAll");
	}
	
	public Game findByTitle(String title) {
		List<Game> result = super.findWithNamedQuery("Game.findByTitle", "title", title);
		if(!result.isEmpty()){
			return result.get(0);
		}
		return null;
	}
	
	public List<Game> listByCategory(int categoryId) {
		return super.findWithNamedQuery("Game.findByCategory", "catId", categoryId);
	}
	
	public List<Game> search(String keyword) {
		return super.findWithNamedQuery("Game.search", "keyword", keyword);
	}
	
	public List<Game> listNewGames() { 
		return super.findWithNamedQuery("Game.listNew", 0,4);
	}
	 

	@Override
	public long count() {
		return super.countWithNamedQuery("Game.countAll");
	}
	
	public long countByCategory(int categoryId) {
		return super.countWithNamedQuery("Game.countByCategory", "catId", categoryId);
	}
	
	public List<Game> listBestSellingGames(){
		return super.findWithNamedQuery("OrderDetail.bestSelling", 0, 3);
	}
	
	public List<Game> listMostFavoredGames(){
		List<Object[]> result = super.findWithNamedQueryObjects("Review.mostFavoredGames", 0, 3);
		List<Game> mostFavoredGames = new ArrayList<>();
		if(!result.isEmpty()) {
			for(Object[] elements : result) {
				Game game = (Game) elements[0];
				mostFavoredGames.add(game);
			}
		}
		return mostFavoredGames;
	}
}

package com.gamestore.controller.frontend.shoppingcart;

import static org.junit.Assert.*;

import java.util.Map;

import org.junit.BeforeClass;
import org.junit.Test;

import com.gamestore.entity.Game;

class ShoppingCartTest {

	private static ShoppingCart cart;
	
	@BeforeClass
	public static void setupBeforeClass() throws Exception{
		cart = new ShoppingCart();
		Game game  = new Game();
		
		cart.addItem(game);
		cart.addItem(game);
		
	}
	
	@Test
	public void testAddItem() {
		Map<Game, Integer> items = cart.getItems();
		int quantity = items.get(new Game());
		
		assertEquals(2, quantity);
	}
	@Test
	public void testRemoveItem() {
		cart.removeItems(new Game());
		
		assertTrue(cart.getItems().isEmpty());
	}
	@Test
	public void testGetTotalQuantity() {
		Game game1 = new Game();
		
		cart.addItem(game1);
		cart.addItem(game1);
		cart.addItem(game1);
		
		assertEquals(5, cart.getTotalQuantity());
	}
	
	@Test
	public void testUpdateCart() {
		ShoppingCart cart = new ShoppingCart();
		Game game  = new Game(33);
		Game game1 = new Game(35);
		
		cart.addItem(game);
		cart.addItem(game1);
		
		int[] gameIds = {1, 2};
		int[] quantites = {3, 4};
		
		cart.updateCart(gameIds, quantites);
		
		assertEquals(7, cart.getTotalQuantity());
	}
}

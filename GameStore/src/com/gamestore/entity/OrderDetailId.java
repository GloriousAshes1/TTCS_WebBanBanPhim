package com.gamestore.entity;
import javax.persistence.Embeddable;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

@Embeddable
public class OrderDetailId implements java.io.Serializable {

	private Game game;
	private GameOrder gameOrder;
	
	public OrderDetailId() {
	}


	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "game_id", insertable = false, updatable = false, nullable = false)
	public Game getGame() {
		return this.game;
	}

	public void setGame(Game game) {
		this.game = game;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "order_id", insertable = false, updatable = false, nullable = false)
	public GameOrder getGameOrder() {
		return this.gameOrder;
	}

	public void setGameOrder(GameOrder gameOrder) {
		this.gameOrder = gameOrder;
	}


	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((game == null) ? 0 : game.hashCode());
		result = prime * result + ((gameOrder == null) ? 0 : gameOrder.hashCode());
		return result;
	}


	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		OrderDetailId other = (OrderDetailId) obj;
		if (game == null) {
			if (other.game != null)
				return false;
		} else if (!game.equals(other.game))
			return false;
		if (gameOrder == null) {
			if (other.gameOrder != null)
				return false;
		} else if (!gameOrder.equals(other.gameOrder))
			return false;
		return true;
	}
	
	

}
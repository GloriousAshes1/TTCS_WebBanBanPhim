package com.gamestore.entity;
// Generated May 18, 2024, 11:32:32 AM by Hibernate Tools 4.3.6.Final

import static javax.persistence.GenerationType.IDENTITY;

import java.util.Base64;
import java.util.Comparator;
import java.util.Date;
import java.util.HashSet;
import java.util.Iterator;
import java.util.Objects;
import java.util.Set;
import java.util.TreeSet;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.persistence.Transient;
import javax.persistence.UniqueConstraint;

@Entity
@Table(name = "game", catalog = "gamestoredb", uniqueConstraints = @UniqueConstraint(columnNames = "title"))
@NamedQueries({
	@NamedQuery(name = "Game.findAll", query = "SELECT g FROM Game g"),
	@NamedQuery(name = "Game.findByTitle", query = "SELECT g FROM Game g WHERE g.title = :title"),
	@NamedQuery(name = "Game.countAll", query = "SELECT COUNT(*) FROM Game g"),
	@NamedQuery(name = "Game.countByCategory", query = "SELECT COUNT(g) FROM Game g WHERE g.category.categoryId = :catId"),
	@NamedQuery(name = "Game.findByCategory", query = "SELECT g FROM Game g JOIN Category c ON g.category.categoryId = c.categoryId AND c.categoryId = :catId"),
	@NamedQuery(name = "Game.listNew", query = "SELECT g FROM Game g ORDER BY g.publishDate DESC"),
	@NamedQuery(name = "Game.search", query = "SELECT g FROM Game g where g.title LIKE '%' || :keyword || '%' ")
})
public class Game implements java.io.Serializable {

	private Integer gameId;
	private Category category;
	private String title;
	private String developer;
	private String publisher;
	private String description;
	private byte[] image;
	private float price;
	private Date publishDate;
	private Date lastUpdateTime;
	private Set<OrderDetail> orderDetails = new HashSet<OrderDetail>(0);
	private Set<Review> reviews = new HashSet<Review>(0);
	
	@Transient
	private String base64Image;

	public Game() {
	}

	public Game(Integer gameId) {
		super();
		this.gameId = gameId;
	}

	public Game(Category category, String title, String developer, String publisher, String description,
			byte[] image, float price, Date publishDate, Date lastUpdateTime) {
		this.category = category;
		this.title = title;
		this.developer = developer;
		this.publisher = publisher;
		this.description = description;
		this.image = image;
		this.price = price;
		this.publishDate = publishDate;
		this.lastUpdateTime = lastUpdateTime;
	}

	public Game(Category category, String title, String developer, String publisher, String description,
			byte[] image, float price, Date publishDate, Date lastUpdateTime, Set<OrderDetail> orderDetails,
			Set<Review> reviews) {
		this.category = category;
		this.title = title;
		this.developer = developer;
		this.publisher = publisher;
		this.description = description;
		this.image = image;
		this.price = price;
		this.publishDate = publishDate;
		this.lastUpdateTime = lastUpdateTime;
		this.orderDetails = orderDetails;
		this.reviews = reviews;
	}

	@Id
	@GeneratedValue(strategy = IDENTITY)
	
	@Column(name = "game_id", unique = true, nullable = false)
	public Integer getGameId() {
		return this.gameId;
	}

	public void setGameId(Integer gameId) {
		this.gameId = gameId;
	}

	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "category_id", nullable = false)
	public Category getCategory() {
		return this.category;
	}

	public void setCategory(Category category) {
		this.category = category;
	}

	@Column(name = "title", unique = true, nullable = false, length = 128)
	public String getTitle() {
		return this.title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	@Column(name = "developer", nullable = false, length = 64)
	public String getDeveloper() {
		return this.developer;
	}

	public void setDeveloper(String developer) {
		this.developer = developer;
	}

	@Column(name = "publisher", nullable = false, length = 64)
	public String getPublisher() {
		return this.publisher;
	}

	public void setPublisher(String publisher) {
		this.publisher = publisher;
	}

	@Column(name = "description", nullable = false, length = 16777215)
	public String getDescription() {
		return this.description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	@Column(name = "image", nullable = false)
	public byte[] getImage() {
		return this.image;
	}

	public void setImage(byte[] image) {
		this.image = image;
	}

	@Column(name = "price", nullable = false, precision = 12, scale = 0)
	public float getPrice() {
		return this.price;
	}

	public void setPrice(float price) {
		this.price = price;
	}

	@Temporal(TemporalType.DATE)
	@Column(name = "publish_date", nullable = false, length = 10)
	public Date getPublishDate() {
		return this.publishDate;
	}

	public void setPublishDate(Date publishDate) {
		this.publishDate = publishDate;
	}

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "last_update_time", nullable = false, length = 19)
	public Date getLastUpdateTime() {
		return this.lastUpdateTime;
	}

	public void setLastUpdateTime(Date lastUpdateTime) {
		this.lastUpdateTime = lastUpdateTime;
	}

	@OneToMany(fetch = FetchType.LAZY, mappedBy = "game")
	public Set<OrderDetail> getOrderDetails() {
		return this.orderDetails;
	}

	public void setOrderDetails(Set<OrderDetail> orderDetails) {
		this.orderDetails = orderDetails;
	}

	@OneToMany(fetch = FetchType.EAGER, mappedBy = "game")
	public Set<Review> getReviews() {
		TreeSet<Review> sortedReviews = new TreeSet<>(new Comparator<Review>() {

			@Override
			public int compare(Review review1, Review review2) {
				return review2.getReviewTime().compareTo(review1.getReviewTime());
			}
			
		});
		
		sortedReviews.addAll(reviews);
		return sortedReviews;
	}

	public void setReviews(Set<Review> reviews) {
		this.reviews = reviews;
	}

	@Transient 
	public String getBase64Image() { 
		this.base64Image = Base64.getEncoder().encodeToString(this.image); 
		return this.base64Image; 
	}
	  
	@Transient 
	public void setBase64Image(String base64Image) { 
		this.base64Image = base64Image; 
	}
	
	@Transient
	public int getSumReviews() {
		int sum = 0;
		
		if (reviews.isEmpty()) {
			return 0;
		}
		
		for (Review review : reviews) {
			sum++;
		}
		
		return sum;
	}
	
	@Transient
	public float getAverageRating() {
		float averageRating = 0.0f;
		float sum = 0.0f;
		
		if (reviews.isEmpty()) {
			return 0.0f;
		}
		
		for (Review review : reviews) {
			sum += review.getRating();
		}
		
		averageRating = sum / reviews.size();
		
		return averageRating;
	}
	
	@Transient
	public String getRatingStars() {
		float averageRating = getAverageRating();
		
		return getRatingString(averageRating);
	}
	
	@Transient
	public String getRatingString(float averageRating) {
		String result = "";
		
		int numberOfStarsOn = (int)averageRating;
		
		for (int i = 1; i <= numberOfStarsOn; i++) {
			result += "on,";
		}
		
		int next = numberOfStarsOn + 1;
		
		if (averageRating > numberOfStarsOn) {
			result += "half,";
			next++;
		}
		
		for (int i = next; i <= 5; i++) {
			result += "off,";
		}
		
		return result.substring(0, result.length() - 1);
	}

	@Override
	public int hashCode() {
		return Objects.hash(gameId);
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Game other = (Game) obj;
		return gameId == other.gameId;
	}
	
	
}

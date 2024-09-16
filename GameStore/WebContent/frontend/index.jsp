<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Legendary Games</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link rel="icon" type="image/x-icon" href="images/Logo.png">
<script>
	function truncateText(element, maxLength) {
		const fullText = element.textContent;
		if (fullText.length > maxLength) {
			const truncatedText = fullText.substring(0, maxLength) + '...';
			const readMoreLink = `<a href="view_game?id=${game.gameId}">Read more</a>`;
			element.innerHTML = truncatedText + ' ' + readMoreLink;
		}
	}

	document.addEventListener("DOMContentLoaded", function() {
		const descriptions = document.querySelectorAll('.game-description');
		descriptions.forEach(function(description) {
			truncateText(description, 100); // Change 100 to the desired maximum length
		});
	});
</script>
</head>
<body>
	<jsp:directive.include file="header.jsp" />
	<div class="container my-4">
		<div class="text-center mb-4">
			<h2 id="labelHome" style="cursor: pointer;">
				<img alt="Legendary Games Store" src="images/Logo.png" height="120" width="120">
				Legendary Games - All games legend
			</h2>
		</div>
	</div>
	<div class="container my-4">
		<div class="text-center mb-4">
			<h2>New Games</h2>
		</div>
		<div class="row row-cols-1 row-cols-md-3 g-4">
			<c:forEach items="${listNewGames}" var="game">
				<div class="col">
					<div class="card h-100">
						<a href="view_game?id=${game.gameId}"> <img
							src="data:image/jpg;base64,${game.base64Image}"
							class="card-img-top" alt="${game.title}">
						</a>
						<div class="card-body">
							<h5 class="card-title">
								<a href="view_game?id=${game.gameId}"> <b>${game.title}</b></a>
							</h5>
							<p class="card-text game-description"
								data-game-id="${game.gameId}">${game.description}</p>
							<p class="card-text">
								<strong>$${game.price}</strong>
							</p>
							<jsp:directive.include file="game_rating.jsp" />
						</div>
					</div>
				</div>
			</c:forEach>
		</div>

		<div class="text-center mt-4 mb-4">
			<h2>Best-Selling Games</h2>
		</div>
		<div class="row row-cols-1 row-cols-md-3 g-4">
			<c:forEach items="${listBestSellingGames}" var="game">
				<div class="col">
					<div class="card h-100">
						<a href="view_game?id=${game.gameId}"> <img
							src="data:image/jpg;base64,${game.base64Image}"
							class="card-img-top" alt="${game.title}">
						</a>
						<div class="card-body">
							<h5 class="card-title">
								<a href="view_game?id=${game.gameId}"><b>${game.title}</b></a>
							</h5>
							<p class="card-text game-description"
								data-game-id="${game.gameId}">${game.description}</p>
							<p class="card-text">
								<strong>$${game.price}</strong>
							</p>
							<jsp:directive.include file="game_rating.jsp" />
						</div>
					</div>
				</div>
			</c:forEach>
		</div>

		<div class="text-center mt-4 mb-4">
			<h2>Most-Favored Games</h2>
		</div>
		<div class="row row-cols-1 row-cols-md-3 g-4">
			<c:forEach items="${listMostFavoredGames}" var="game">
				<div class="col">
					<div class="card h-100">
						<a href="view_game?id=${game.gameId}"> <img
							src="data:image/jpg;base64,${game.base64Image}"
							class="card-img-top" alt="${game.title}">
						</a>
						<div class="card-body">
							<h5 class="card-title">
								<a href="view_game?id=${game.gameId}"><b>${game.title}</b></a>
							</h5>
							<p class="card-text game-description"
								data-game-id="${game.gameId}">${game.description}</p>
							<p class="card-text">
								<strong>$${game.price}</strong>
							</p>
							<jsp:directive.include file="game_rating.jsp" />	
						</div>
					</div>
				</div>
			</c:forEach>
		</div>
	</div>
	<jsp:directive.include file="footer.jsp" />
	<script>
		function handleLabelClick() {
			var contextPath = "${pageContext.request.contextPath}";
			window.location.href = contextPath + "/";
		}

		document.getElementById("labelHome").onclick = handleLabelClick;
	</script>

</body>
</html>

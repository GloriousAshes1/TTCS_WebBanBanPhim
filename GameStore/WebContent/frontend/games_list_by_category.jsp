<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Games in ${category.name} - Legendary Games</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="css/style.css">
    <link rel="icon" type="image/x-icon" href="images/Logo.png">
    <script type="text/javascript" src="js/jquery-3.7.1.min.js"></script>
    <style>
        .game-description {
            max-width: 500px;
        }
        .game-title {
            font-size: 1.2em;
            font-weight: bold;
        }
        .game-price {
            font-size: 1.2em;
            font-weight: bold;
            color: #28a745;
        }
        .game-publish-date {
            font-size: 0.9em;
            color: #666;
        }
        .game-developer {
            font-size: 0.9em;
            color: #666;
        }
        .game-img {
            width: 128px;
            height: 164px;
            object-fit: cover;
        }
    </style>
</head>
<body>
    <jsp:directive.include file="header.jsp"/>
    <div class="container my-4">
        <div class="text-center">
            <h2>${category.name}</h2>
        </div>
        <div class="row row-cols-1 row-cols-md-2 g-4 mt-4">
            <c:forEach items="${listGames}" var="game">
                <div class="col">
                    <div class="card h-100">
                        <div class="row g-0">
                            <div class="col-md-4">
                                <a href="view_game?id=${game.gameId}">
                                    <img src="data:image/jpg;base64,${game.base64Image}" class="card-img-top game-img" alt="${game.title}">
                                </a>
                            </div>
                            <div class="col-md-8">
                                <div class="card-body">
                                    <a href="view_game?id=${game.gameId}" class="game-title">
                                        ${game.title}
                                    </a>
                                    <div class="game-publish-date">
                                        <fmt:formatDate pattern="MM/dd/yyyy" value='${game.publishDate}'/>
                                    </div>
                                    <div class="game-developer">${game.developer}</div>
                                    <div class="game-description">${fn:substring(game.description,0 , 100)}...</div>
                                    <div class="game-price">$${game.price}</div>
                                    <button class="btn btn-primary mt-2 buttonAddToCart" data-game-id="${game.gameId}">Add to Cart</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </c:forEach>
        </div>
    </div>
    <jsp:directive.include file="footer.jsp"/>
    <script type="text/javascript">
        $(document).ready(function() {
            $('.buttonAddToCart').click(function() {
                var gameId = $(this).data('game-id');
                window.location = "add_to_cart?game_id=" + gameId;
            });
        });
    </script>
</body>
</html>

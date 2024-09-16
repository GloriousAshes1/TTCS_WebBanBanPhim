<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>   
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Search - Legendary Games</title>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"rel="stylesheet">
<link rel="stylesheet" href="../css/style.css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<link rel="icon" type="image/x-icon" href="images/Logo.png">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</head>
<body>
	<jsp:directive.include file="header.jsp"/>
	<div class ="container my-4">
		<div class="text-center mb-4">
            <c:if test="${fn:length(result) == 0}">
				<h2>No Results for "${keyword}"</h2>
			</c:if>
			<c:if test="${fn:length(result) > 0}">
				<h2>Results for "${keyword}"</h2>
			<div class="row row-cols-1 row-cols-md-3 g-4">
            <c:forEach items="${result}" var="game">
                <div class="col">
                    <div class="card h-100">
                    	<a href="view_game?id=${game.gameId}">
                    		<img src="data:image/jpg;base64,${game.base64Image}" class="card-img-top" alt="${game.title}">
                    	</a>
                        <div class="card-body">
                            <h5 class="card-title"><a href="view_game?id=${game.gameId}"> <b>${game.title}</b></a></h5>
                            <p class="card-text game-description" data-game-id="${game.gameId}">
                                ${game.description}
                            </p>
                            <p class="card-text"><strong>$${game.price}</strong></p>
                            <jsp:directive.include file="game_rating.jsp" />
                        </div>
                    </div>
                </div>
            </c:forEach>
        </div>
        </c:if>
        </div>
	</div>
<!-- 	<div align="center"> -->
<%-- 		<c:if test="${fn:length(result) == 0}"> --%>
<%-- 			<h2>No Results for "${keyword}"</h2> --%>
<%-- 		</c:if> --%>
		
<%-- 		<c:if test="${fn:length(result) > 0}"> --%>
<!-- 			<table> -->
<%-- 				<center><h2>Results for "${keyword}"</h2></center> --%>
<%-- 				<c:forEach items="${result}" var="game"> --%>
<!-- 					<tr> -->
<!-- 						<td> -->
<%-- 							<a href="view_game?id=${game.gameId}"> --%>
<%-- 								<img src="data:image/jpg;base64,${game.base64Image}" width="128" height="164"> --%>
<!-- 							</a> -->
<!-- 						</td> -->
<!-- 						<td valign="top" width="500"> -->
<%-- 							<a href="view_game?id=${game.gameId}"> --%>
<%-- 								<b>${game.title}</b> --%>
<!-- 							</a> -->
<%-- 							<div><fmt:formatDate pattern="MM/dd/yyyy" value='${game.publishDate}'/></div> --%>
<%-- 							<div>${game.developer}</div> --%>
<!-- 							<div>*****</div> -->
<!-- 							<div> -->
<%-- 								<p>${fn:substring(game.description,0 , 100)}...</p> --%>
<!-- 							</div> -->
<!-- 						</td> -->
<!-- 						<td> -->
<!-- 							<div>$${game.price}</div> -->
<!-- 							<button>Add to cart</button> -->
<!-- 						</td> -->
<!-- 					</tr> -->
<%-- 				</c:forEach> --%>
<!-- 			</table> -->
<%-- 		</c:if> --%>
<!-- 	</div> -->
	<jsp:directive.include file="footer.jsp"/>
</body>
</html>
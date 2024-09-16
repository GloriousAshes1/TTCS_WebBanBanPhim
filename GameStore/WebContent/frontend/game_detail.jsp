<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>${game.title} - Legendary Games</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="css/style.css">
    <link rel="icon" type="image/x-icon" href="images/Logo.png">
    <script type="text/javascript" src="js/jquery-3.7.1.min.js"></script>
    <style>
        .text-container {
            display: block;
        }
        .short-text, .full-text {
            display: inline;
        }
        .full-text {
            display: none;
        }
        .read-more {
            cursor: pointer;
            display: inline;
        }
        .price {
            font-size: 25px;
            color: #28a745;
        }
        .review {
            padding: 8px;
            border-bottom: 1px solid #ddd;
        }
        .last {
            border-bottom: 0;
        }
    </style>
</head>
<body>
    <jsp:directive.include file="header.jsp" />

    <div class="container my-4">
        <div class="row">
            <div class="col-md-8">
                <h2>${game.title}</h2>
            </div>
            <div class="col-md-4 text-md-end">
                <a href="#reviews" class="text-dark">
                    ${game.averageRating} <jsp:directive.include file="game_rating.jsp" /> (${game.sumReviews} Ratings)
                </a>
            </div>
        </div>

        <div class="row mt-4">
            <div class="col-md-4">
                <img src="data:image/jpg;base64,${game.base64Image}" class="img-fluid" alt="${game.title}" />
            </div>
            <div class="col-md-8">
                <div class="row">
                    <div class="col-6">
                        <div>Developer:</div>
                        <div class="text-container">
                            <c:set var="maxLength" value="30" />
                            <c:choose>
                                <c:when test="${fn:length(game.developer) > maxLength}">
                                    <span class="short-text">${fn:substring(game.developer, 0, maxLength)}</span>
                                    <span class="read-more">...</span>
                                    <span class="full-text">${game.developer}</span>
                                </c:when>
                                <c:otherwise>
                                    <span class="short-text">${game.developer}</span>
                                </c:otherwise>
                            </c:choose>
                        </div>
                    </div>
                    <div class="col-6">
                        <div>Publisher:</div>
                        <div class="text-container">
                            <c:choose>
                                <c:when test="${fn:length(game.publisher) > maxLength}">
                                    <span class="short-text">${fn:substring(game.publisher, 0, maxLength)}</span>
                                    <span class="read-more">...</span>
                                    <span class="full-text">${game.publisher}</span>
                                </c:when>
                                <c:otherwise>
                                    <span class="short-text">${game.publisher}</span>
                                </c:otherwise>
                            </c:choose>
                        </div>
                    </div>
                </div>

                <div class="row mt-4">
                    <div class="col-12">
                        <p>${game.description}</p>
                    </div>
                </div>

                <div class="row mt-4">
                    <div class="col-6">
                        <div class="price"><b>$${game.price}</b></div>
                    </div>
                    <div class="col-6 text-md-end">
                        <button id="buttonAddToCart" class="btn btn-primary">Add to Cart</button>
                    </div>
                </div>
            </div>
        </div>

        <div class="row mt-4">
            <div class="col-12">
                <h3><a id="reviews">Reviews</a></h3>
            </div>
            <div class="col-12 text-md-end">
                <button id="buttonWriteReview" class="btn btn-secondary">Write a Review</button>
            </div>
        </div>

        <div class="row mt-4">
            <div class="col-12">
                <table class="table">
                    <c:forEach items="${game.reviews}" var="review" varStatus="loop">
                        <tr class="${loop.last ? 'last' : ''}">
                            <td class="review">
                                <div><b>${review.customer.fullname}</b></div>
                                <div>
                                    <c:forTokens items="${review.stars}" delims="," var="star">
                                        <c:if test="${star eq 'on'}">
                                            <img alt="*" src="images/full-star.png" />
                                        </c:if>
                                        <c:if test="${star eq 'off'}">
                                            <img alt="*" src="images/no-star.png" />
                                        </c:if>
                                    </c:forTokens>
                                </div>
                                <div><fmt:formatDate value="${review.reviewTime}" pattern="yyyy-MM-dd HH:mm" /></div>
                                <div><b>${review.headline}</b></div>
                                <div>${review.comment}</div>
                            </td>
                        </tr>
                    </c:forEach>
                </table>
            </div>
        </div>
    </div>

    <jsp:directive.include file="footer.jsp" />

    <script>
        document.addEventListener('DOMContentLoaded', function() {
            document.querySelectorAll('.read-more').forEach(function(readMore) {
                readMore.addEventListener('click', function() {
                    const textBlock = readMore.parentElement;
                    textBlock.querySelector('.short-text').style.display = 'none';
                    readMore.style.display = 'none';
                    textBlock.querySelector('.full-text').style.display = 'inline';
                });
            });
        });

        $(document).ready(function() {
            $("#buttonWriteReview").click(function() {
                window.location = 'write_review?game_id=' + ${game.gameId};
            });

            $("#buttonAddToCart").click(function() {
                window.location = 'add_to_cart?game_id=' + ${game.gameId};
            });
        });
    </script>
</body>
</html>

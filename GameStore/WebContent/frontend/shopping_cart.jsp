<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Your Shopping Cart - Legendary Games</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"
	rel="stylesheet">
<link rel="icon" type="image/x-icon" href="images/Logo.png">
<script type="text/javascript" src="js/jquery-3.7.1.min.js"></script>
<script type="text/javascript" src="js/jquery.validate.min.js"></script>
<style>
.game-title {
	font-weight: bold;
	font-size: 1.1em;
}
.message {
color: red;
}

.quantity-buttons {
display: flex;
justify-content: center;
align-items: center;
}

.quantity-buttons input[type=number]::-webkit-inner-spin-button,
.quantity-buttons input[type=number]::-webkit-outer-spin-button {
-webkit-appearance: none;
margin: 0;
}

.quantity-buttons input[type=number] {
-moz-appearance: textfield;
appearance: textfield;
width: 50px;
height: 30px; 
text-align: center;
border: 1px solid #ccc; 
box-sizing: border-box; 
}

.quantity-buttons button {
width: 50px; 
height: 30px;
display: flex;
justify-content: center;
align-items: center;
cursor: pointer;
border: 1px solid #ccc;
background-color: #f8f9fa;
}
}
</style>

</head>
<body>
	<jsp:directive.include file="header.jsp" />
	<div class="container my-4">
	<div class="text-center">
		<h2>Your Shopping Cart Details</h2>
	</div>

	<c:if test="${message != null}">
		<div class="alert alert-info text-center">
			<h4 class="message">${message}</h4>
		</div>
	</c:if>

	<c:set var="cart" value="${sessionScope['cart']}" />

	<c:if test="${cart.totalItems == 0}">
		<div class="alert alert-warning text-center">
			<h4>There are no items in your cart.</h4>
		</div>
	</c:if>

	<c:if test="${cart.totalItems > 0}">
		<form action="update_cart" method="post" id="cartForm">
			<table class="table table-bordered table-hover">
				<thead class="table-dark" align="center">
					<tr>
						<th>No</th>
						<th colspan="2">Game</th>
						<th>Quantity</th>
						<th>Price</th>
						<th>Subtotal</th>
						<th>Action</th>
					</tr>
				</thead>
				<tbody align="center">
					<c:forEach items="${cart.items}" var="items" varStatus="status">
						<tr>
							<td>${status.index + 1}</td>
							<td><img
								src="data:image/jpg;base64,${items.key.base64Image}"
								width="281.35" height="133.92" alt="${items.key.title}"></td>
							<td class="game-title">${items.key.title}</td>
							<td class="quantity-buttons"><input type="hidden"
								name="gameId" value="${items.key.gameId}" />
								<button type="button" class="btn-decrement">-</button> <input
								type="number" class="form-control"
								name="quantity${status.index + 1}" value="${items.value}"
								min="1" />
								<button type="button" class="btn-increment">+</button></td>
							<td><fmt:formatNumber value="${items.key.price}"
									type="currency" /></td>
							<td><fmt:formatNumber
									value="${items.value * items.key.price}" type="currency" /></td>
							<td><a href="remove_from_cart?game_id=${items.key.gameId}"
								class="btn btn-danger btn-sm"><i class="fas fa-trash-alt"></i></a></td>
						</tr>
					</c:forEach>
					<tr>
						<td colspan="3"></td>
						<td><b>${cart.totalQuantity} game(s)</b></td>
						<td>Total:</td>
						<td><fmt:formatNumber value="${cart.totalAmount}"
								type="currency" /></td>
						<td></td>
					</tr>
				</tbody>
			</table>

			<div class="text-center">
				<button type="submit" class="btn btn-primary">Update Cart</button>
				<button id="clearCart" type="button" class="btn btn-warning">Clear
					Cart</button>
				<button id="continueShopping" type="button"
					class="btn btn-secondary">Continue Shopping</button>
				<button id="checkout" type="button" class="btn btn-success">Checkout</button>
			</div>
		</form>
	</c:if>
</div>

<jsp:directive.include file="footer.jsp" />

<script type="text/javascript">
    $(document).ready(function() {
    	 $("#clearCart").click(function(event) {
             event.preventDefault();
             window.location = 'clear_cart';
         });

         $("#continueShopping").click(function(event) {
             event.preventDefault();
             window.location = '${pageContext.request.contextPath}/';
         });

         $("#checkout").click(function(event) {
             event.preventDefault();
             window.location = 'checkout';
         });

         $(".btn-decrement").click(function() {
             var input = $(this).siblings("input[type='number']");
             var currentValue = parseInt(input.val());
             if (currentValue > 1) {
                 input.val(currentValue - 1);
             }
         });

         $(".btn-increment").click(function() {
             var input = $(this).siblings("input[type='number']");
             var currentValue = parseInt(input.val());
             input.val(currentValue + 1);
         });

        $("#cartForm").validate({
            rules: {
                <c:forEach items="${cart.items}" var="item" varStatus="status">
                    quantity${status.index + 1}: {
                        required: true,
                        number: true,
                        min: 1
                    },
                </c:forEach>
            },
            messages: {
                <c:forEach items="${cart.items}" var="item" varStatus="status">
                    quantity${status.index + 1}: { 
                        required: "Please enter quantity",
                        number: "Quantity must be a number",
                        min: "Quantity must be greater than 0"
                    },
                </c:forEach>                    
            }
        });
    });
</script>
</body>
</html>	
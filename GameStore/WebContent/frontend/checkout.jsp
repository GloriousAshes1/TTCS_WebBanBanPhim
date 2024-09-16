<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Checkout - Legendary Games</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="css/style.css">
    <link rel="icon" type="image/x-icon" href="images/Logo.png">
    <script type="text/javascript" src="js/jquery-3.7.1.min.js"></script>
    <script type="text/javascript" src="js/jquery.validate.min.js"></script>
    <style>
        .message {
            color: red;
        }
        .form-control {
            height: 45px;
        }
    </style>
</head>
<body>
    <jsp:directive.include file="header.jsp" />
    
    <div class="container my-4">
        <div class="text-center">
            <c:if test="${message != null}">
                <div class="alert alert-info">
                    <h4 class="message">${message}</h4>
                </div>
            </c:if>

            <c:set var="cart" value="${sessionScope['cart']}" />

            <c:if test="${cart.totalItems == 0}">
                <div class="alert alert-warning">
                    <h2>There are no items in your cart.</h2>
                </div>
            </c:if>

            <c:if test="${cart.totalItems > 0}">
                <div>
                    <h2>Review Your Order</h2>
                    <form id="reviewOrderForm" action="view_cart">
                        <table class="table table-bordered table-hover">
                            <thead class="table-dark">
                                <tr>
                                    <th>No</th>
                                    <th colspan="2">Game</th>
                                    <th>Quantity</th>
                                    <th>Price</th>
                                    <th>Subtotal</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach items="${cart.items}" var="items" varStatus="status">
                                    <tr>
                                        <td>${status.index + 1}</td>
                                        <td><img src="data:image/jpg;base64,${items.key.base64Image}" width="281.35" height="133.92"/></td>
                                        <td>${items.key.title}</td>
                                        <td>
                                            <input type="hidden" name="gameId" value="${items.key.gameId}" />
                                            <input type="text" class="form-control" name="quantity${status.index + 1}" value="${items.value}" />
                                        </td>
                                        <td><fmt:formatNumber value="${items.key.price}" type="currency" /></td>
                                        <td><fmt:formatNumber value="${items.value * items.key.price}" type="currency" /></td>
                                    </tr>
                                </c:forEach>
                                <tr>
						<td colspan="6" align="right">
							<p>Total Quantities: ${cart.totalQuantity}</p>
							<p>Subtotal: <fmt:formatNumber value="${cart.totalAmount}" type="currency" /></p>
							<p>Tax: <fmt:formatNumber value="${tax}" type="currency" /></p>
							<p>Shipping Fee: <fmt:formatNumber value="${shippingFee}" type="currency" /></p>
							<p>Total: <fmt:formatNumber value="${total}" type="currency" /></p>
						</td>
					</tr>
                            </tbody>
                        </table>
                        <button type="submit" class="btn btn-primary">Edit Your Order</button>
                    </form>
                </div>
                <div class="text-center">
                    <h2>Your Shipping Information</h2>
                    <form id="orderForm" action="place_order" method="post" class="mx-auto">
                        <div class="row mb-3 justify-content-center">
                            <label for="recipientName" class="form-label col-md-4 text-md-end">First Name:</label>
                            <div class="col-md-4">
                                <input type="text" class="form-control" id="firstname" name="firstname" value="${loggedCustomer.firstname}" required>
                            </div>
                        </div>
                        <div class="row mb-3 justify-content-center">
                            <label for="recipientName" class="form-label col-md-4 text-md-end">Last Name:</label>
                            <div class="col-md-4">
                                <input type="text" class="form-control" id="lastname" name="lastname" value="${loggedCustomer.lastname}" required>
                            </div>
                        </div>
                        <div class="row mb-3 justify-content-center">
                            <label for="recipientPhone" class="form-label col-md-4 text-md-end">Phone:</label>
                            <div class="col-md-4">
                                <input type="text" class="form-control" id="phone" name="phone" value="${loggedCustomer.phone}" required>
                            </div>
                        </div>
                        <div class="row mb-3 justify-content-center">
                            <label for="address" class="form-label col-md-4 text-md-end">Primary Address:</label>
                            <div class="col-md-4">
                                <input type="text" class="form-control" id="address1" name="address1" value="${loggedCustomer.addressLine1}" required>
                            </div>
                        </div>
                        <div class="row mb-3 justify-content-center">
                            <label for="address" class="form-label col-md-4 text-md-end">Secondary Address:</label>
                            <div class="col-md-4">
                                <input type="text" class="form-control" id="address2" name="address2" value="${loggedCustomer.addressLine2}" required>
                            </div>
                        </div>
                        <div class="row mb-3 justify-content-center">
                            <label for="city" class="form-label col-md-4 text-md-end">City:</label>
                            <div class="col-md-4">
                                <input type="text" class="form-control" id="city" name="city" value="${loggedCustomer.city}" required>
                            </div>
                        </div>
                        <div class="row mb-3 justify-content-center">
                            <label for="city" class="form-label col-md-4 text-md-end">State:</label>
                            <div class="col-md-4">
                                <input type="text" class="form-control" id="state" name="state" value="${loggedCustomer.state}" required>
                            </div>
                        </div>
                        <div class="row mb-3 justify-content-center">
                            <label for="zipcode" class="form-label col-md-4 text-md-end">Zip Code:</label>
                            <div class="col-md-4">
                                <input type="text" class="form-control" id="zipcode" name="zipcode" value="${loggedCustomer.zipcode}" required>
                            </div>
                        </div>
                        <div class="row mb-3 justify-content-center">
                            <label for="country" class="form-label col-md-4 text-md-end">Country:</label>
                            <div class="col-md-4">
                                <select class="form-select" name="country" id="country">
									<c:forEach items="${mapCountries}" var="country">
										<option value="${country.value}"
											<c:if test='${loggedCustomer.country eq country.value}'>selected='selected'</c:if>>${country.key}</option>
									</c:forEach>
							</select>
                            </div>
                        </div>
                        <div class="row mb-3 justify-content-center">
                            <label for="paymentMethod" class="form-label col-md-4 text-md-end">Payment Method:</label>
                            <div class="col-md-4">
                                <select class="form-select" id="paymentMethod" name="paymentMethod">
                                    <option value="Cash On Delivery">Cash On Delivery</option>
                                    <option value="paypal">Paypal</option>
                                </select>
                            </div>
                        </div>
                        <div class="row mb-3 justify-content-center">
                            <div class="col-md-8 d-flex justify-content-center">
                                <button type="submit" class="btn btn-success me-2">Place Order</button>
                                <button id="continueShopping" type="button" class="btn btn-secondary">Continue Shopping</button>
                            </div>
                        </div>
                    </form>
                </div>
            </c:if>
        </div>
    </div>

    <jsp:directive.include file="footer.jsp" />

    <script type="text/javascript">
        $(document).ready(function() {
            $("#continueShopping").click(function(event) {
                event.preventDefault();
                window.location = '${pageContext.request.contextPath}/';
            });
            $("#orderForm").validate({
    			rules:{
    				firstname: "required",
    				lastname: "required",
    				phone: "required",
    				address1: "required",
    				address2: "required",
    				city: "required",
    				state: "required",
    				zipcode: "required",
    				country: "required",
    			},
    			
    			messages:{
    				firstname: "Please enter first name",
    				lastname: "Please enter last name",
    				phone: "Please enter phone",
    				address1: "Please enter address Line 1",
    				address2: "Please enter address Line 2",
    				city: "Please enter city",
    				state: "Please enter state",
    				zipcode: "Please enter zipcode",
    				country: "Please enter country",
    			}
    			
    		});
        });
    </script>
</body>
</html>

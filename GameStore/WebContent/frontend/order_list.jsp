<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>My Order History</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="icon" type="image/x-icon" href="images/Logo.png">
</head>
<body>
    <jsp:directive.include file="header.jsp" />

    <div class="container my-4">
        <h2 class="pageheading text-center mb-4">My Order History</h2>
        
        <c:if test="${fn:length(listOrders) == 0}">
            <div class="alert alert-info text-center">
                <h3>You have not placed any order.</h3>
            </div>
        </c:if>
        
        <c:if test="${fn:length(listOrders) > 0}">
            <div class="table-responsive">
                <table class="table table-striped table-bordered">
                    <thead class="table-dark">
                        <tr>
                            <th scope="col">No</th>
                            <th scope="col">Order ID</th>
                            <th scope="col">Ordered by</th>
                            <th scope="col">Quantity</th>
                            <th scope="col">Total</th>
                            <th scope="col">Payment method</th>
                            <th scope="col">Status</th>
                            <th scope="col">Order Date</th>
                            <th scope="col">Actions</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="order" items="${listOrders}" varStatus="status">
                            <tr>
                                <td>${status.index + 1}</td>
                                <td>${order.orderId}</td>
                                <td>${order.customer.fullname}</td>
                                <td>${order.gameQuantities}</td>
                                <td><fmt:formatNumber value="${order.total}" type="currency" /></td>
                                <td>${order.paymentMethod}</td>
                                <td>${order.status}</td>
                                <td>${order.orderDate}</td>
                                <td>
                                    <a href="show_order_detail?id=${order.orderId}" class="btn btn-primary btn-sm">View Details</a>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
        </c:if>
    </div>

    <jsp:directive.include file="footer.jsp" />

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>

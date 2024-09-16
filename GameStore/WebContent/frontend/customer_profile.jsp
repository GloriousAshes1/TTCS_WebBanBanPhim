<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Customer Profile - Legendary Games</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="icon" type="image/x-icon" href="images/Logo.png">
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/jquery-validation@1.19.5/dist/jquery.validate.min.js"></script>
</head>
<body>
    <jsp:directive.include file="header.jsp" />

    <div class="container my-5">
        <div class="text-center">
            <h3>Welcome, ${loggedCustomer.fullname}</h3>
        </div>
        <br />

        <div class="card mx-auto" style="max-width: 600px;">
            <div class="card-body">
                <table class="table table-borderless">
                    <tbody>
                        <tr>
                            <td><strong>E-mail:</strong></td>
                            <td>${loggedCustomer.email}</td>
                        </tr>
                        <tr>
                            <td><strong>Last Name:</strong></td>
                            <td>${loggedCustomer.lastname}</td>
                        </tr>
                        <tr>
                            <td><strong>First Name:</strong></td>
                            <td>${loggedCustomer.firstname}</td>
                        </tr>
                        <tr>
                            <td><strong>Phone Number:</strong></td>
                            <td>${loggedCustomer.phone}</td>
                        </tr>
                        <tr>
                            <td><strong>Address1:</strong></td>
                            <td>${loggedCustomer.addressLine1}</td>
                        </tr>
                        <tr>
                            <td><strong>Address2:</strong></td>
                            <td>${loggedCustomer.addressLine2}</td>
                        </tr>
                        <tr>
                            <td><strong>City:</strong></td>
                            <td>${loggedCustomer.city}</td>
                        </tr>
                        <tr>
                            <td><strong>State:</strong></td>
                            <td>${loggedCustomer.state}</td>
                        </tr>
                        <tr>
                            <td><strong>Zip Code:</strong></td>
                            <td>${loggedCustomer.zipcode}</td>
                        </tr>
                        <tr>
                            <td><strong>Country:</strong></td>
                            <td>${loggedCustomer.countryName}</td>
                        </tr>
                    </tbody>
                </table>
                <div class="text-center mt-3">
                    <a href="edit_profile" class="btn btn-primary">Edit my profile</a>
                </div>
            </div>
        </div>
    </div>

    <jsp:directive.include file="footer.jsp" />

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>

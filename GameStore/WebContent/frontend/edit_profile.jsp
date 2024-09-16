<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>User Profile - Legendary Games</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="icon" type="image/x-icon" href="images/Logo.png">
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/jquery-validation@1.19.5/dist/jquery.validate.min.js"></script>
    <style>
        .form-container {
            max-width: 700px;
            margin: auto;
            padding: 20px;
            border: 1px solid #dee2e6;
            border-radius: 8px;
            background: #fff;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
        }
        .form-control:focus {
            box-shadow: none;
        }
        .btn-primary {
            background-color: #007bff;
            border-color: #007bff;
        }
        .btn-secondary {
            background-color: #6c757d;
            border-color: #6c757d;
        }
    </style>
</head>
<body>
    <jsp:directive.include file="header.jsp" />

    <div class="container my-5">
        <div class="text-center mb-4">
            <h2 class="pageheading">Edit My Profile</h2>
        </div>

        <div class="form-container">
            <form action="update_profile" method="post" id="customerForm" class="needs-validation" novalidate>
                <div class="mb-3 row">
                    <label for="email" class="col-sm-4 col-form-label text-end">E-mail:</label>
                    <div class="col-sm-8">
                        <p class="form-control-plaintext"><b>${loggedCustomer.email}</b> (Cannot be changed)</p>
                    </div>
                </div>
                <div class="mb-3 row">
                    <label for="firstName" class="col-sm-4 col-form-label text-end">First Name:</label>
                    <div class="col-sm-8">
                        <input type="text" class="form-control" id="firstName" name="firstName" value="${loggedCustomer.firstname}" required>
                    </div>
                </div>
                <div class="mb-3 row">
                    <label for="lastName" class="col-sm-4 col-form-label text-end">Last Name:</label>
                    <div class="col-sm-8">
                        <input type="text" class="form-control" id="lastName" name="lastName" value="${loggedCustomer.lastname}" required>
                    </div>
                </div>
                <div class="mb-3 row">
                    <label for="phone" class="col-sm-4 col-form-label text-end">Phone Number:</label>
                    <div class="col-sm-8">
                        <input type="text" class="form-control" id="phone" name="phone" value="${loggedCustomer.phone}" required>
                    </div>
                </div>
                <div class="mb-3 row">
                    <label for="address1" class="col-sm-4 col-form-label text-end">Primary Address:</label>
                    <div class="col-sm-8">
                        <input type="text" class="form-control" id="address1" name="address1" value="${loggedCustomer.addressLine1}" required>
                    </div>
                </div>
                <div class="mb-3 row">
                    <label for="address2" class="col-sm-4 col-form-label text-end">Secondary Address:</label>
                    <div class="col-sm-8">
                        <input type="text" class="form-control" id="address2" name="address2" value="${loggedCustomer.addressLine2}">
                    </div>
                </div>
                <div class="mb-3 row">
                    <label for="city" class="col-sm-4 col-form-label text-end">City:</label>
                    <div class="col-sm-8">
                        <input type="text" class="form-control" id="city" name="city" value="${loggedCustomer.city}" required>
                    </div>
                </div>
                <div class="mb-3 row">
                    <label for="state" class="col-sm-4 col-form-label text-end">State:</label>
                    <div class="col-sm-8">
                        <input type="text" class="form-control" id="state" name="state" value="${loggedCustomer.state}" required>
                    </div>
                </div>
                <div class="mb-3 row">
                    <label for="zipCode" class="col-sm-4 col-form-label text-end">Zip Code:</label>
                    <div class="col-sm-8">
                        <input type="text" class="form-control" id="zipCode" name="zipCode" value="${loggedCustomer.zipcode}" required>
                    </div>
                </div>
                <div class="mb-3 row">
                    <label for="country" class="col-sm-4 col-form-label text-end">Country:</label>
                    <div class="col-sm-8">
                        <select class="form-select" id="country" name="country" required>
                            <c:forEach items="${mapCountries}" var="country">
                                <option value="${country.value}" <c:if test='${loggedCustomer.country eq country.value}'>selected</c:if>>${country.key}</option>
                            </c:forEach>
                        </select>
                    </div>
                </div>
                <div class="text-center mb-3">
                    <i>(Leave password blank if you don't want to change password)</i>
                </div>
                <div class="mb-3 row">
                    <label for="password" class="col-sm-4 col-form-label text-end">Password:</label>
                    <div class="col-sm-8">
                        <input type="password" class="form-control" id="password" name="password">
                    </div>
                </div>
                <div class="mb-3 row">
                    <label for="confirmPassword" class="col-sm-4 col-form-label text-end">Confirm Password:</label>
                    <div class="col-sm-8">
                        <input type="password" class="form-control" id="confirmPassword" name="confirmPassword">
                    </div>
                </div>
                <div class="row">
                    <div class="col text-center">
                        <button type="submit" class="btn btn-primary">Save</button>
                        <button type="button" id="buttonCancel" class="btn btn-secondary ms-3">Cancel</button>
                    </div>
                </div>
            </form>
        </div>
    </div>

    <jsp:directive.include file="footer.jsp" />

    <script>
        $(document).ready(function() {
            $("#customerForm").validate({
                rules: {
                    firstName: "required",
                    lastName: "required",
                    phone: "required",
                    address1: "required",
                    city: "required",
                    state: "required",
                    zipCode: "required",
                    country: "required",
                    password: {
                        minlength: 5
                    },
                    confirmPassword: {
                        equalTo: "#password"
                    }
                },
                messages: {
                    firstName: "Please enter your first name",
                    lastName: "Please enter your last name",
                    phone: "Please enter your phone number",
                    address1: "Please enter your primary address",
                    city: "Please enter your city",
                    state: "Please enter your state",
                    zipCode: "Please enter your zip code",
                    country: "Please select your country",
                    password: {
                        minlength: "Password must be at least 5 characters long"
                    },
                    confirmPassword: {
                        equalTo: "Confirm password does not match password"
                    }
                }
            });

            $("#buttonCancel").click(function() {
                history.go(-1);
            });
        });
    </script>
</body>
</html>

package com.gamestore.controller.frontend.customer;

import com.gamestore.service.CustomerService;
import com.gamestore.service.MailServices;
import com.gamestore.controller.BaseServlet;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/register_customer")
public class RegisterCustomerServlet extends BaseServlet {
	private static final long serialVersionUID = 1L;

    public RegisterCustomerServlet() {
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		CustomerService customerService =  new CustomerService(response, request);
		customerService.registerCustomer();
	}

}

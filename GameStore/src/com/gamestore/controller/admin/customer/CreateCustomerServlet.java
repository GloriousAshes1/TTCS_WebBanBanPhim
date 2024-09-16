package com.gamestore.controller.admin.customer;

import com.gamestore.controller.BaseServlet;
import com.gamestore.service.CustomerService;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/admin/create_customer")
public class CreateCustomerServlet extends BaseServlet {
	private static final long serialVersionUID = 1L;

    public CreateCustomerServlet() {
    	super();
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		CustomerService customerService = new CustomerService(response, request);
		customerService.createCustomer();
	}

}

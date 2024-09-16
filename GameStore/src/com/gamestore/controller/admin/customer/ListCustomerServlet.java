package com.gamestore.controller.admin.customer;

import com.gamestore.controller.BaseServlet;
import com.gamestore.service.CustomerService;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/admin/list_customer")
public class ListCustomerServlet extends BaseServlet {
	private static final long serialVersionUID = 1L;

    public ListCustomerServlet() {
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		CustomerService customerService = new CustomerService(response, request);
		customerService.listCustomers();
	}

}

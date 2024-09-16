package com.gamestore.controller.frontend.customer;

import com.gamestore.service.CustomerService;
import com.gamestore.controller.BaseServlet;
import com.gamestore.dao.CategoryDAO;
import com.gamestore.entity.Category;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/view_profile")
public class ShowCustomerProfileServlet extends BaseServlet {
	private static final long serialVersionUID = 1L;

    public ShowCustomerProfileServlet() {
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		CategoryDAO categoryDAO = new CategoryDAO();
		List<Category> listCategory = categoryDAO.listAll();
		request.setAttribute("listCategory", listCategory);
		
		CustomerService customerService = new CustomerService(response, request);
		customerService.showCustomerProfile();
	}

}

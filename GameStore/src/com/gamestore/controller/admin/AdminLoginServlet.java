package com.gamestore.controller.admin;

import com.gamestore.controller.BaseServlet;
import com.gamestore.service.UserServices;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/admin/login")
public class AdminLoginServlet extends BaseServlet {
	private static final long serialVersionUID = 1L;


    public AdminLoginServlet() {
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		UserServices userServices = new UserServices(request, response);
		userServices.login();
	}

}

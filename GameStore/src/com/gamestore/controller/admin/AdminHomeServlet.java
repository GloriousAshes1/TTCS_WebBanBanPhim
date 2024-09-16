package com.gamestore.controller.admin;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.gamestore.dao.CustomerDAO;
import com.gamestore.dao.GameDAO;
import com.gamestore.dao.OrderDAO;
import com.gamestore.dao.ReviewDAO;
import com.gamestore.dao.UserDAO;
import com.gamestore.entity.GameOrder;
import com.gamestore.entity.Review;

@WebServlet("/admin/")
public class AdminHomeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public AdminHomeServlet() {
        super();
    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse respone) throws ServletException, IOException {
    	doGet(request,respone);
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		UserDAO userDAO = new UserDAO();	
		OrderDAO orderDAO = new OrderDAO();
		ReviewDAO reviewDAO = new ReviewDAO();
		GameDAO gameDAO = new GameDAO();
		CustomerDAO customerDAO = new CustomerDAO();
		
		long totalUsers = userDAO.count();
		long totalGames = gameDAO.count();
		long totalCustomers = customerDAO.count();
		long totalOrders = orderDAO.count();
		long totalReviews = reviewDAO.count();
		double totalSales = orderDAO.totalSales();
		double totalTax = orderDAO.totalTax();
		double totalShippingFee = orderDAO.totalShippingFee();
		double totalSubToTal = orderDAO.totalSubToTal();
		
		
		List<GameOrder> listMostRecentSales = orderDAO.listMostRecentSales();
		List<Review> listMostRecentReview = reviewDAO.listMostRecent();
		
		request.setAttribute("totalUsers", totalUsers);
		request.setAttribute("totalGames", totalGames);
		request.setAttribute("totalCustomers", totalCustomers);
		request.setAttribute("listMostRecentSales", listMostRecentSales);
		request.setAttribute("listMostRecentReview", listMostRecentReview);
		request.setAttribute("totalOrders", totalOrders);
		request.setAttribute("totalReviews", totalReviews);
		request.setAttribute("totalSales", totalSales);
		request.setAttribute("totalTax", totalTax);
		request.setAttribute("totalShippingFee", totalShippingFee);
		request.setAttribute("totalSubToTal", totalSubToTal);
		
		
		
		String homepage = "index.jsp";
		RequestDispatcher dispatcher = request.getRequestDispatcher(homepage);
		dispatcher.forward(request, response);
	}

}

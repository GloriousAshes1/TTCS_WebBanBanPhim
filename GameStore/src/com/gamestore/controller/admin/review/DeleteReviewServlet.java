package com.gamestore.controller.admin.review;

import com.gamestore.controller.BaseServlet;
import com.gamestore.service.ReviewService;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/admin/delete_review")
public class DeleteReviewServlet extends BaseServlet {
	private static final long serialVersionUID = 1L;

    public DeleteReviewServlet() {
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ReviewService reviewService = new ReviewService(request, response);
		reviewService.deleteReview();
	}

}

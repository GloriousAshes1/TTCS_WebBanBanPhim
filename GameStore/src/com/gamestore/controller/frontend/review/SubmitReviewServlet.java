package com.gamestore.controller.frontend.review;

import com.gamestore.service.ReviewService;
import com.gamestore.controller.BaseServlet;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/submit_review")
public class SubmitReviewServlet extends BaseServlet {
	private static final long serialVersionUID = 1L;

    public SubmitReviewServlet() {
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ReviewService reviewService =  new ReviewService(request, response);
		reviewService.submitReview();
	}

}

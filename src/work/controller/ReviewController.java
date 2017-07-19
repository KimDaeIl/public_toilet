package work.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import work.Util.Util;
import work.model.dto.ReviewList;
import work.model.service.ReviewService;

/**
 * Servlet implementation class ReviewController
 */
public class ReviewController extends HttpServlet implements IController {
	private ReviewService service = null;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ReviewController() {
		super();
		// TODO Auto-generated constructor stub
	}

	@Override
	public void init() throws ServletException {
		// TODO Auto-generated method stub
		super.init();

		service = new ReviewService();
	}

	@Override
	public void destroy() {
		// TODO Auto-generated method stub
		super.destroy();

		service = null;
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		process(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("EUC-KR");
		process(request, response);
	}

	@Override
	public void process(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

		String action = req.getParameter("action");
		System.out.println("action: "+action);
		if (Util.isEqualsNull(action)) {
			res.sendRedirect("error.jsp");
			return;
		}

		switch (action) {
		case "addReview":

			break;
		case "getReviews":
			getReviews(req, res);

			break;
		case "updateReview":

			break;

		default:
			res.sendRedirect("error.jsp");
		}

	}

	public void getReviews(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

		ReviewList review = service.getReviews(req.getParameter("toiletNum"));

		if (review.getToilet().getId() > 0) {
			req.setAttribute("review", review);
			req.getRequestDispatcher("result.jsp").forward(req, res);

		} else {
			res.sendRedirect(req.getRequestURI());
		}

	}
}

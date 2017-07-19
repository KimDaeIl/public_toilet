package work.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import work.Util.Util;
import work.model.dto.Borough;
import work.model.dto.City;
import work.model.dto.Toilet;
import work.model.service.ToiletService;

/**
 * Servlet implementation class ToiletController
 */
public class ToiletController extends HttpServlet implements IController {
	private ToiletService service = null;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ToiletController() {
		super();
		service = new ToiletService();
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
		response.setCharacterEncoding("EUC-KR");
		process(request, response);
	}

	@Override
	public void process(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

		String action = req.getParameter("action");
		System.out.println(action);
		if (Util.isEqualsNull(action)) {
			res.sendRedirect("error.jsp");
		}

		switch (action) {

		case "getToilets":
			getToilets(req, res);
			break;

		case "getCities":
			getCities(req, res);
			break;

		case "getBoroughs":
			getBoroughs(req, res);
			break;

		default:
		}

	}

	private void getToilets(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		ArrayList<Toilet> list = service.getAllToiletsInBorough(req.getParameter("gu"));

		if (!list.isEmpty()) {
			res.setContentType("application/json");
			res.getWriter().println(makeJson(list));
		} else {
			req.setAttribute("err_msg", "getToilets_풰일");
			res.sendRedirect("error.jsp");
		}
	}

	private void getCities(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		ArrayList<City> list = service.getCityList();

		if (!list.isEmpty()) {
			res.setContentType("application/json");
			res.getWriter().println(makeJson(list));
		} else {
			req.setAttribute("err_msg", "getCities_풰일");
			res.sendRedirect("error.jsp");

		}

	}

	private void getBoroughs(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		ArrayList<Borough> list = service.getBoroughList(req.getParameter("city"));

		if (!list.isEmpty()) {
			res.setContentType("application/json");
			res.getWriter().println(makeJson(list));

		} else {
			req.setAttribute("err_msg", "getCities_풰일");
			res.sendRedirect("error.jsp");
		}
	}

	private String makeJson(ArrayList list) {
		StringBuilder builder = new StringBuilder();
		builder.append("[");
		for (Object b : list) {
			builder.append(b.toString()).append(",");
		}
		builder.replace(builder.length() - 1, builder.length(), "").append("]");

		return builder.toString();
	}
}

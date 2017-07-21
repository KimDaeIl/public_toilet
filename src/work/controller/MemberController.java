package work.controller;

import work.Util.Util;
import work.model.dao.MemberDao;
import work.model.dto.Member;
import work.model.service.MemberService;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.io.IOException;

/**
 * Created by KimDaeil on 2017. 7. 15..
 */
public class MemberController extends HttpServlet implements IController {
	private MemberDao dao = null;
	private MemberService service = null;

	@Override
	public void init() throws ServletException {
		super.init();

		service = new MemberService();
	}

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		process(req, resp);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		process(request, response);
	}

	@Override
	public void destroy() {
		super.destroy();

		service = null;
	}

	@Override
	public void process(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		String action = req.getParameter("action");
		if (Util.isEqualsNull(action)) {
			res.sendRedirect("error.jsp");
			return;
		}

		switch (action) {
		case "signUp":
			signUp(req, res);
			break;

		// oo
		case "login":
			login(req, res);
			break;

		case "chekcId":
			isDuplicatedId(req, res);
			break;

		// oo
		case "logout":
			logout(req, res);
			break;

		case "delete":
			delete(req, res);
			break;

		default:
			res.sendRedirect("error.jsp");
			// redirect error page
		}
	}

	private void signUp(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

		if (!Util.isNull(req.getSession(false)) && !Util.isNull(req.getSession(false).getAttribute("member"))) {
			res.sendRedirect("error.jsp");
			return;
		}

		Member member = service.signUp(req.getParameter("member_id"), req.getParameter("member_pw"),
				req.getParameter("nickname"));

		if (!Util.isNull(member) && member.getId() > 0) {
			
			System.out.println(member);
			HttpSession session = req.getSession();
			session.setAttribute("member", member);

			RequestDispatcher dispatcher = req.getRequestDispatcher("index.jsp");
			dispatcher.forward(req, res);

		} else {
			res.sendRedirect("error.jsp");

		}

	}

	private void login(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		Member member = service.login(req.getParameter("member_id"), req.getParameter("member_pw"));

		if (!Util.isNull(member) && member.getId() > 0) {

			HttpSession session = req.getSession();
			session.setAttribute("member", member);

			RequestDispatcher dispatcher = req.getRequestDispatcher("index.jsp");
			dispatcher.forward(req, res);

			return;
		}

		res.sendRedirect("error.jsp");

	}

	private void isDuplicatedId(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		String id = req.getParameter("member_id");
		// http://all-record.tistory.com/147 참고

		if (service.isDuplicatedId(id))
			;// TODO: 어떻게 만들어야 하나...ㅋㅋ
	}

	private void logout(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		HttpSession session = req.getSession(false);

		if (!Util.isNull(session)) {
			if (!Util.isNull(session.getAttribute("member"))) {
				session.removeAttribute("member");
				session.invalidate();

			}
			req.getRequestDispatcher("index.jsp").forward(req, res);

		} else {
			res.sendRedirect("error.jsp");
		}

	}

	// TODO: ㅇㅇ
	private void delete(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		HttpSession session = req.getSession(false);

		if (!Util.isNull(session) && !Util.isNull(session.getAttribute("member"))) {

			int result = service.delete(((Member) session.getAttribute("member")).getMemberId(),
					req.getParameter("member_pw"));

			if (result > 0) {
				session.removeAttribute("member");
				session.invalidate();
				res.sendRedirect("index.jsp");

				return;
			}

		}
		res.sendRedirect("error.jsp");

	}

}

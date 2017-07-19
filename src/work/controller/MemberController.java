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

		switch (req.getParameter("action")) {
		case "signUp":
			signUp(req, res);
			break;

		case "login":
			login(req, res);
			break;

		case "chekcId":
			isDuplicatedId(req, res);
			break;

		case "logout":
			logout(req, res);
			break;
		case "delete":
			break;

		default:
			// redirect error page
		}
	}

	private void signUp(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		Member member = service.signUp(req.getParameter("member_id"), req.getParameter("member_pw"),
				req.getParameter("nickname"));

		if (!Util.isNull(member)) {
			HttpSession session = req.getSession();
			session.setAttribute("member", member);

			RequestDispatcher dispatcher = req.getRequestDispatcher(req.getRequestURL().toString());
			dispatcher.forward(req, res);
		} else {
			res.sendRedirect("index.jsp");

		}

	}

	private void login(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		Member member = service.login(req.getParameter("member_id"), req.getParameter("member_pw"));

		if (member != null) {

			HttpSession session = req.getSession();
			session.setAttribute("member", member);

			RequestDispatcher dispatcher = req.getRequestDispatcher(req.getRequestURL().toString());
			dispatcher.forward(req, res);

		} else {
			res.sendRedirect("login.jsp");

		}

	}

	private void isDuplicatedId(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		String id = req.getParameter("member_id");
		// http://all-record.tistory.com/147 참고

		if (service.isDuplicatedId(id))
			;// TODO: 어떻게 만들어야 하나...ㅋㅋ
	}

	private void logout(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		HttpSession session = req.getSession(false);

		if (session != null) {
			if (Util.isNull(session.getAttribute("member"))) {
				session.removeAttribute("member");
				session.invalidate();
			}
		}

		res.sendRedirect("index.jsp");
	}

	// TODO: ㅇㅇ
	private void delete(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		HttpSession session = req.getSession(false);

		if (session != null) {
			RequestDispatcher dispatcher = req.getRequestDispatcher("result.jsp");
			dispatcher.forward(req, res);

		} else {
			res.sendRedirect(req.getRequestURL().toString());
		}

	}

}

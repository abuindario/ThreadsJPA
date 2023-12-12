package es.darioabuin.loginJPA.controller;

import java.io.IOException;

import javax.persistence.NoResultException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import es.darioabuin.loginJPA.bo.UserBO;
import es.darioabuin.loginJPA.entities.User;

/**
 * Servlet implementation class loginController
 */
@WebServlet("/loginController")
public class loginController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public loginController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		String action = "" + request.getParameter("button");
		UserBO ubo = new UserBO();
		switch(action) {
			case "login":
				String userName = "" + request.getParameter("userName").trim();
				String userPassword = "" + request.getParameter("userPassword").trim();
				User login = null;
				try {
					login = ubo.checkUser(userName, userPassword);
				} catch(NoResultException e) {
					String msg = "There is no registered user with this user/password.";
					request.setAttribute("message", msg);
					request.getRequestDispatcher("index.jsp").forward(request, response);
				}
				if(login != null) {
					session.setAttribute("user", login);
					request.setAttribute("name", login.getUsername());
					request.getRequestDispatcher("WEB-INF/logged.jsp").forward(request, response);
				}
				break;
			case "kill":
				session.invalidate();
				request.getRequestDispatcher("index.jsp").forward(request, response);
				break;
			case "access":
				User logged = (User) session.getAttribute("user");
				if(logged != null) {
					request.setAttribute("name", logged.getUsername());
					request.getRequestDispatcher("WEB-INF/logged.jsp").forward(request, response);
				} else {
					request.getRequestDispatcher("error.jsp").forward(request, response);
				}
				break;
			case "signup":
				String fname = "" + request.getParameter("fname").trim();
				String lname = "" + request.getParameter("lname").trim();
				String email = "" + request.getParameter("email").trim();
				String uname = "" + request.getParameter("userName").trim();
				String upass = "" + request.getParameter("userPassword").trim();
				if(fname.length() != 0 && lname.length() != 0 && email.length() != 0 && uname.length() != 0 && upass.length() != 0) {
					User user = new User(fname, lname, email, uname, upass);
					if(ubo.checkEmail(email) == true) {
						String msg = "This email is already in use.";
						request.setAttribute("message", msg);
						request.getRequestDispatcher("signup.jsp").forward(request, response);
					} else {
						try {
							ubo.register(user);	
							session.setAttribute("user", user);
							request.setAttribute("name", user.getUsername());
							request.getRequestDispatcher("WEB-INF/logged.jsp").forward(request, response);
						} catch (Exception e) {
							System.out.println(e.getMessage());
						}
					}
				} else {
					String msg = "Fill all the fields to complete the signup.";
					request.setAttribute("message", msg);
					request.getRequestDispatcher("signup.jsp").forward(request, response);
				}
				break;
			default:
				request.getRequestDispatcher("index.jsp").forward(request, response);
				break;
		}
	}

}

package es.darioabuin.loginJPA.controller;

import java.io.IOException;
import java.util.List;

import javax.persistence.NoResultException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import es.darioabuin.loginJPA.bo.MessageBO;
import es.darioabuin.loginJPA.bo.ThreadBO;
import es.darioabuin.loginJPA.bo.UserBO;
import es.darioabuin.loginJPA.entities.Message;
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
		ThreadBO tbo = new ThreadBO();
		MessageBO mbo = new MessageBO();
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
					userLogged(login, request, response);
				}
				break;
			case "kill":
				session.invalidate();
				request.getRequestDispatcher("index.jsp").forward(request, response);
				break;
			case "access":
				User logged = (User) session.getAttribute("user");
				if(logged != null) {
					userLogged(logged, request, response);
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
				String upass2 = "" + request.getParameter("userPassword2").trim();
				if(fname.length() != 0 && lname.length() != 0 && email.length() != 0 && uname.length() != 0) {
					if (upass.equals(upass2)) {
						if(ubo.checkEmail(email) == false) {
							if(ubo.checkUsername(uname) == false) {
								try {
									User user = new User(fname, lname, email, uname, upass);
									ubo.register(user);	
									session.setAttribute("user", user);
									userLogged(user, request, response);
								} catch (Exception e) {
									System.out.println(e.getMessage());
								}
							} else {
								String msg = "The username is not available.";
								request.setAttribute("message", msg);
								request.getRequestDispatcher("signup.jsp").forward(request, response);							}
						} else {
							String msg = "This email is already in use.";
							request.setAttribute("message", msg);
							request.getRequestDispatcher("signup.jsp").forward(request, response);
						}
					} else {
						String msg = "Passwords don't match.";
						request.setAttribute("message", msg);
						request.getRequestDispatcher("signup.jsp").forward(request, response);
					}
				} else {
					String msg = "Fill all the fields to complete the signup.";
					request.setAttribute("message", msg);
					request.getRequestDispatcher("signup.jsp").forward(request, response);					
				}
				break;
			case "createThread":
				String threadName = "" + request.getParameter("createThreadName").trim();
				User user = (User) session.getAttribute("user");
				if(threadName.length() > 0) {
					es.darioabuin.loginJPA.entities.Thread thread = new es.darioabuin.loginJPA.entities.Thread(threadName, user);
					try {
						tbo.createThread(thread);	
						userLogged(user, request, response);
					} catch(Exception e) {
						System.out.println(e.getMessage());
					}
				} else {
					String msg = "The thread can not be named like that!";
					request.setAttribute("badThreadNaming", msg);
					userLogged(user, request, response);
				}
				break;
			case "threadById":
				int threadId = Integer.parseInt(request.getParameter("threadId"));
				accessAThread(request, response, threadId);
				break;
			case "postMessage":
				threadId = Integer.parseInt(request.getParameter("threadId"));
				String content = "" + request.getParameter("content").trim();
				if(content.length() > 0) {
					user = (User) session.getAttribute("user");
					es.darioabuin.loginJPA.entities.Thread thread = tbo.getThreadById(threadId);
					Message message = new Message(content, user, thread);
					try {
						mbo.postMessage(message);
						accessAThread(request, response, threadId);
					} catch(Exception e) {
						System.out.println(e.getMessage());
					}
				} else {
					accessAThread(request, response, threadId);
				}
				break;
			case "deleteMessage": 
				int messageId = Integer.parseInt(request.getParameter("messageId"));
				threadId = Integer.parseInt(request.getParameter("threadId"));
				try {
					mbo.deleteMessageById(messageId, threadId);	
				} catch(Exception e) {
					System.out.println(e.getMessage());
				} finally {
					accessAThread(request, response, threadId);					
				}
				break;
			case "deleteThread":
				threadId = Integer.parseInt(request.getParameter("threadId"));
				try {
					tbo.deleteThreadById(threadId);
				} catch(Exception e) {
					System.out.println(e.getMessage());
				} finally {
					user = (User) session.getAttribute("user");
					userLogged(user, request, response);
				}
				break;
			case "editThread": 
				threadId = Integer.parseInt(request.getParameter("threadId"));
				threadName = request.getParameter("newThreadName").trim();
				try {
					if(threadName.length() > 0) {
						tbo.editThread(threadId, threadName);
					}
				} catch(Exception e) {
					System.out.println(e.getMessage());
				} finally {
					user = (User) session.getAttribute("user");
					userLogged(user, request, response);
				}
				break;
			case "editMessage": 
				messageId = Integer.parseInt(request.getParameter("messageId"));
				threadId = Integer.parseInt(request.getParameter("threadId"));	
				content = "" + request.getParameter("content").trim();
				if(content.length() > 0) {
					try {
						mbo.editMessage(messageId, content);
						accessAThread(request, response, threadId);
					} catch(Exception e) {
						System.out.println(e.getMessage());
					}
				} else {
					accessAThread(request, response, threadId);
				}
				break;
			default:
				request.getRequestDispatcher("index.jsp").forward(request, response);
				break;
		}
	}
	
	private static void userLogged(User user, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ThreadBO tbo = new ThreadBO();
		List<es.darioabuin.loginJPA.entities.Thread> threads = null;
		try {
			threads = tbo.getLast10Threads();
		} catch(Exception e) {
			System.out.println(e.getMessage());
		}
		request.setAttribute("threads", threads);
		request.setAttribute("name", user.getUsername());
		request.getRequestDispatcher("WEB-INF/logged.jsp").forward(request, response);
	}
	
	private static void accessAThread(HttpServletRequest request, HttpServletResponse response, int threadId) throws ServletException, IOException {
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("user");
		ThreadBO tbo = new ThreadBO();
		es.darioabuin.loginJPA.entities.Thread thread = tbo.getThreadById(threadId);
		MessageBO mbo = new MessageBO();
		List<Message> messages = mbo.getMessages(thread);
		request.setAttribute("messages", messages);
		request.setAttribute("user", user);
		request.setAttribute("thread", thread);
		request.getRequestDispatcher("WEB-INF/thread.jsp").forward(request, response);
	}

}

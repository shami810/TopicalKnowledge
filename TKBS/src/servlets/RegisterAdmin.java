package servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import services.UserService;

/**
 * Servlet implementation class RegisterAdmin
 */
@WebServlet("/RegisterAdmin")
public class RegisterAdmin extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RegisterAdmin() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
		PrintWriter out = response.getWriter();
		if(new UserService().checkIfUserAlreadyExists(request.getParameter("email")))
		{
			out.println("User with this details already exists.<br/>");
		}
		else if(new UserService().insertAdmin(request))
		{			
			response.sendRedirect("/TKBS/html/home.jsp");
		}
		else{
			out.println("Please try after some time.<br/>");
		}
	}

}

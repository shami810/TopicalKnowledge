package servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class TemporaryPassword
 */
@WebServlet("/TemporaryPassword")
public class TemporaryPassword extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public TemporaryPassword() {
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
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		// TODO Auto-generated method stub
		//doGet(request, response);
		
			HttpSession session=request.getSession();
			String temp = (String)session.getAttribute("temp");
			if(temp.equals(request.getParameter("tempPass")))
			{	
				session.setAttribute("logid", "3");
				response.sendRedirect("/TKBS/html/login.jsp");
			}
			else
			{
				session.setAttribute("logid", "1");
				response.sendRedirect("/TKBS/html/InvalidePassword.jsp");
			}
		
	}

}

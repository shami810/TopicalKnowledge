package servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.DoctrineNotes;
import services.DoctrineService;

/**
 * Servlet implementation class AddNotes
 */
@WebServlet("/AddNotes")
public class AddNotes extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddNotes() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//doGet(request, response);
		DoctrineNotes notes=new DoctrineNotes();
		notes.setDoctrineNotes(request.getParameter("newNotes"));
		notes.setDoctrineReferenceNo(Integer.valueOf(request.getParameter("doctrineRefNo")));
		PrintWriter out= response.getWriter();
		if(new DoctrineService().addNotes(notes))
		{
			out.println("Notes added successfully..!!!");
		}
		else{
			out.println("Unable to add Notes");
		}
		
	}

}

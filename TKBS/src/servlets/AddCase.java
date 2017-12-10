package servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.DoctrineCases;
import services.DoctrineService;

/**
 * Servlet implementation class AddCase
 */
@WebServlet("/AddCase")
public class AddCase extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddCase() {
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
		DoctrineCases cases=new DoctrineCases();
		cases.setDoctrineReferenceNo((Integer) request.getSession().getAttribute("doctrineId"));
		cases.setSectionNo(request.getParameter("sectionNo"));
		cases.setChapterNo(request.getParameter("chapterNo"));
		cases.setCaseName(request.getParameter("caseName"));
		cases.setCaseCode(request.getParameter("caseCode"));
		cases.setCaseYear(request.getParameter("caseYear"));
		
		if(new DoctrineService().addCases(cases))
		{
			request.getSession().setAttribute("successMessage", "Case added successfully.");
			response.sendRedirect("/TKBS/html/expertAttorney/validateCase.jsp");
		}
	}

}

package servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.DoctrineRule;
import services.DoctrineService;

/**
 * Servlet implementation class AddDoctrine
 */
@WebServlet("/AddDoctrine")
public class AddDoctrine extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddDoctrine() {
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
		System.out.println("in servlet");
		//System.out.println(request.getParameter("summary"));
		//System.out.println(request.getParameter("keyword"));
		DoctrineRule doctrineRule=new DoctrineRule();
		doctrineRule.setDoctrineSectionNo(request.getParameter("sectionNo"));
		doctrineRule.setDoctrineChapterNo(request.getParameter("chapterNo"));
		doctrineRule.setDoctrineName(request.getParameter("name"));
		doctrineRule.setDoctrineType(request.getParameter("type"));
		doctrineRule.setDoctrineSummary(request.getParameter("summary"));
		doctrineRule.setKeywords(request.getParameter("keyword"));
		
		if(new DoctrineService().addNewDoctrine(doctrineRule)){
			request.getSession().setAttribute("addedDoctrine", doctrineRule);
			request.getSession().setAttribute("sectionNo", doctrineRule.getDoctrineSectionNo());
			request.getSession().setAttribute("chapterNo", doctrineRule.getDoctrineChapterNo());
			response.sendRedirect("/TKBS/html/expertAttorney/addDoctrine.jsp");
		}
		
	}

}

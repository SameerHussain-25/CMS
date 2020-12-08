package controllers;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.catalina.valves.StuckThreadDetectionValve;

import model.StudentBean;

/**
 * Servlet implementation class CheckSession
 */
@WebServlet("/checksession")
public class CheckSession extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CheckSession() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		System.out.println("check session doGET");
		
		 HttpSession session=request.getSession(false);

		 response.setHeader("cache-control", "no-store");
		 
		if(session.getAttribute("user") == null){
			System.out.println("in if session==null");
			javax.servlet.RequestDispatcher rd=request.getRequestDispatcher("login.jsp");	
			request.setAttribute("msg","error");
			rd.forward(request, response);
		}
		
		  StudentBean bean=(StudentBean)session.getAttribute("user");
		  if(!(bean==null)) {
		  System.out.println(" session bean : "+bean.getName());
		  }
	}


	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}
	       
//		

}

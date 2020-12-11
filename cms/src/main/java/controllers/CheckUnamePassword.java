package controllers;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.StudentBean;


/**
 * Servlet implementation class CheckUnamePassword
 */
@WebServlet("/checkunamepassword")
public class CheckUnamePassword extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CheckUnamePassword() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.sendRedirect("login.jsp");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		  response.setContentType("text/html");

		   java.io.PrintWriter writer=response.getWriter();
	        System.out.println("checking Uname Password doPOST");
	
		String uname=request.getParameter("username");
		String pass=request.getParameter("password");
		
		
		RequestDispatcher rd;
		javax.servlet.http.HttpSession session=request.getSession(true);
		
		System.out.println("....uname : "+uname+"....password : "+pass);
		
		try {
//			if(model.CMSDbManager.checkAdminUnamePassword(uname, pass)) {
//				System.out.println("Admin found");
//				rd=request.getRequestDispatcher("/loginuser");
//				request.setAttribute("status","admin");
//				request.setAttribute("uname",uname);
//				request.setAttribute("pass",pass);
//				rd.forward(request, response);
//			}
			if(model.CMSDbManager.checkStudentUnamePassword(uname, pass)) {
				System.out.println("student found");
				response.sendRedirect("loginuser");
				request.setAttribute("status","student");
				request.setAttribute("uname",uname);
				request.setAttribute("pass",pass);
//				rd.forward(request, response);

//				System.out.println("student found");
//				rd=request.getRequestDispatcher("/loginuser");
//				request.setAttribute("status","student");
//				request.setAttribute("uname",uname);
//				request.setAttribute("pass",pass);
//				rd.forward(request, response);
				
				StudentBean bean=model.CMSDbManager.getStudentByStdRollNum(uname);
//				rd=request.getRequestDispatcher("insertcomplainold.jsp");
				  
			       session.setAttribute("user",bean);
//			       request.setAttribute("name",bean.getName());
//				rd.forward(request, response);
			       response.sendRedirect("insertcomplainold.jsp");
			}
			else {
				response.sendRedirect("login.jsp?error");
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}

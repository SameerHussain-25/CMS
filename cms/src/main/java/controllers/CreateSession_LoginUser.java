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
 * Servlet implementation class CreateSession_LoginUser
 */
@WebServlet("/loginuser")
public class CreateSession_LoginUser extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CreateSession_LoginUser() {
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
	    
				System.out.println("checking Login user And Make session doPOST");
	    
		String status=(String)request.getAttribute("status");		
		String uname=(String)request.getAttribute("uname");
		String pass=(String)request.getAttribute("pass");
		
		javax.servlet.http.HttpSession session=request.getSession();
		RequestDispatcher rd;
		
		System.out.println("....status: "+status+"....uname : "+uname+"....password : "+pass);
		try {
			if(status.equalsIgnoreCase("admin")) {
				System.out.println("in student if getting bean  by username");
				rd=request.getRequestDispatcher("insertcomplainold.jsp");
				request.setAttribute("status","admin");
				request.setAttribute("uname",uname);
				request.setAttribute("pass",pass);
				rd.forward(request, response);
			}
			else if(status.equalsIgnoreCase("student")) {
				StudentBean bean=model.CMSDbManager.getStudentByStdRollNum(uname);
				rd=request.getRequestDispatcher("insertcomplainold.jsp");
				  
			       session.setAttribute("user",bean);
//			       request.setAttribute("name",bean.getName());
				rd.forward(request, response);
			}
			else {
				rd=request.getRequestDispatcher("login.jsp");
				request.setAttribute("error","notfound");
				rd.forward(request, response);
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

}

package controllers;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Student_registration
 */
@WebServlet("/studentregistration")
public class Student_registration extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Student_registration() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	      response.setContentType("text/html");

	        PrintWriter out=response.getWriter();
	        System.out.println("in stdregistration doGet");
	               
	        String std_idstr=request.getParameter("stdid");
	        int std_id=Integer.parseInt(std_idstr);
	        String cnicstr=request.getParameter("cnic");
	        int cnic=Integer.parseInt(cnicstr);
	        String password=request.getParameter("password");
	        
	        
	        System.out.println(std_id+"...."+cnic+"...."+password);
	        
	        model.RegistrationBean bean=new model.RegistrationBean(std_id, cnic, password);
	        try {
				model.CMSDbManager.registerdStudent(bean);
				out.println("<div class=\"alert alert-success\" role=\"alert\">\r\n"
						+ "Created Successfully!\r\n"
						+ "</div>");
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
	}

}

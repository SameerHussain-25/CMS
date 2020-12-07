package controllers;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.taglibs.standard.lang.jstl.AndOperator;

/**
 * Servlet implementation class Checking_std_rollnumber
 */
@WebServlet("/checkrollnum")
public class Checking_std_rollnumber extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Checking_std_rollnumber() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, java.io.IOException {
		
		response.sendRedirect("register.jsp");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, java.io.IOException {
		   response.setContentType("text/html");

		   java.io.PrintWriter writer=response.getWriter();
	        System.out.println("checking stdrollnum doPOST");
	        
	        String rollnum=request.getParameter("rollno");
	        System.out.println(rollnum);
	        

	        
	        try {
	        	 //check student admit or not
				if( model.CMSDbManager.checkStdAdmissionByRollNum(rollnum)) {
//					request.setAttribute("error", "Not a uni student");
					//check if student already registerd
					if( model.CMSDbManager.checkIfStdRegisterdByRollNum(rollnum)){
								System.out.println(" std already registerd");
								writer.println("<div class=\"alert alert-danger\" role=\"alert\">\r\n"
										+ "Already Register!\r\n"
										+ "</div>");		
						}
						else{
							//continue registration process the student
							System.out.println("loading data nd input fields");
						model.StudentBean stdbean=model.CMSDbManager.getStudentByStdRollNum(rollnum);
							writer.println("<div class=\"form-group\">  \r\n"
									+ "			 <input type=\"hidden\"  \r\n"
									+ "				class=\"form-control\" id=\"stdid\"  \r\n"
									+ "				value="+stdbean.getstdId()+">  \r\n"
									+ "		</div>  \r\n"
									+ "	\r\n"
									+"<div class=\"form-group\">  \r\n"
									+ "			<label for=\"username\">Name</label> <input type=\"text\"  \r\n"
									+ "				class=\"form-control\" name=\"username\"  \r\n"
									+ "				readonly value="+stdbean.getName()+">  \r\n"
									+ "		</div>  \r\n"
									+ "	\r\n"
									+ "		<div class=\"form-group\">  \r\n"
									+ "			<label for=\"number\">Father Name</label> <input  \r\n"
									+ "				type=\"text\" class=\"form-control\" id=\"fathername\"  \r\n"
									+ "			readonly value="+stdbean.getfatherName()+">\r\n"
									+ "		</div>  \r\n"
									+ "\r\n"
									+"<div class=\"row d-flex justify-content-center\"  >  \r\n"
									+ "		<div class=\"col-lg-3\">  \r\n"
									+ "			<label for=\"cnic\">Program</label> <input type=\"text\"  \r\n"
									+ "				class=\"form-control\" id=\"program\"  \r\n"
									+ "			readonly value="+stdbean.getProgram()+">\r\n"
									+ "		</div>  \r\n"
									+ "\r\n"
									+ "		<div class=\"col-lg-4 \">  \r\n"
									+ "			<label for=\"cnic\">Department</label> <input type=\"text\"  \r\n"
									+ "				class=\"form-control\" id=\"department\"  \r\n"
									+ "			readonly value="+stdbean.getDepartment()+">\r\n"
									+ "		</div>  \r\n"
									+ "\r\n"
									+ "		<div class=\"col-lg-3\">  \r\n"
									+ "			<label for=\"cnic\">Batch</label> <input type=\"text\"  \r\n"
									+ "				class=\"form-control\" id=\"batch\"  \r\n"
									+ "			readonly value="+stdbean.getBatch()+">\r\n"
									+ "		</div>  \r\n"
									+ "\r\n"
									+ "		</div>  \r\n"
									+ "		<div class=\"form-group\">  \r\n"
									+ "			<label for=\"cnic\">CNIC (without dashes)</label> <input  \r\n"
									+ "				type=\"number\" class=\"form-control\" id=\"cnic\"  \r\n"
									+ "			placeholder=\"Enter your CNIC\"  />\r\n"
									+ "		</div>  \r\n"
									+ "\r\n"
									+ "		<div class=\"form-group\">  \r\n"
									+ "			<label for=\"password\">Password</label> <input type=\"password\"  \r\n"
									+ "			class=\"form-control\" id=\"password\" placeholder=\"Enter Password\" />\r\n"
									+ "		</div>  \r\n"
									+ "	\r\n"
									+ "		<div class=\"form-group\">  \r\n"
									+ "			<label for=\"confirm_password\">Password</label> <input type=\"password\"  \r\n"
									+ "				class=\"form-control\" id=\"confirm_password\" placeholder=\"Enter Confirm Password\">  \r\n"
									+ "		</div>  \r\n"
									+ "");				
								}
							
			
				}else {
					writer.println("<div class=\"alert alert-danger\" role=\"alert\">\r\n"
							+ "Not A Universty Student!\r\n"
							+ "</div>");
				}
	
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

	}

}

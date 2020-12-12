package mycontrollers;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.CMSDbManager;
import model.ComplainBean;

@WebServlet("/listComplain")
public class ListComplain extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public ListComplain() {
		super();
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		javax.servlet.http.HttpSession session=request.getSession();
		model.StudentBean user = (model.StudentBean)session.getAttribute("user");
		
		if(user != null){
			try {
				int stdRegId = CMSDbManager.getStdRegId(user.getstdId());
				ArrayList<ComplainBean> complains = CMSDbManager.getComplains(stdRegId);
				request.setAttribute("complains",complains);
				request.getRequestDispatcher("/WEB-INF/view/listcomplain.jsp").forward(request,response);
			}catch(Exception e) {
				e.printStackTrace();
			}	
		 }
		 else {
			 response.sendRedirect("login");
		 }
	}

}

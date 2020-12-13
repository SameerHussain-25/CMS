package repository;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.CMSDbManager;

@WebServlet("/admin/changeStatus")
public class ChangeStatus extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ChangeStatus() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("id");
		
		int complainId = 0;
		
		if(id != null) complainId = Integer.parseInt(id); 
		else return;
		try {
			
			boolean b = CMSDbManager.updateStatus(complainId);
			response.getWriter().println("Success");
		}catch(Exception e) {
			e.printStackTrace();
		}
	}

}

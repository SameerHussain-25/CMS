package controllers;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.CMSDbManager;
import model.RegStdDataBean;
import model.StudentBean;

@WebServlet("/admin")
public class AdminIndex extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminIndex() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		javax.servlet.http.HttpSession session = request.getSession();
		model.AdminBean admin = (model.AdminBean) session.getAttribute("admin");
		if (admin != null) {
			try {
				ArrayList<StudentBean> list = CMSDbManager.getStudents();
				request.setAttribute("list", list);
				request.getRequestDispatcher("/WEB-INF/view/admin/index.jsp").forward(request, response);
			
			}catch(Exception e) {
				e.printStackTrace();
			}
		}else {
			response.sendRedirect("login?error");
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

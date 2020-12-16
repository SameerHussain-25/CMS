package controllers;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.CMSDbManager;
import model.ComplainCatBean;

@WebServlet("/insertComplain")
public class InsertComplain extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public InsertComplain() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		javax.servlet.http.HttpSession session = request.getSession();
		model.StudentBean user = (model.StudentBean) session.getAttribute("user");
		model.AdminBean admin = (model.AdminBean) session.getAttribute("admin");
		
		if(admin != null)
			response.sendRedirect("admin");
		
		else if (user != null) {

			try {

				ArrayList<ComplainCatBean> list = CMSDbManager.getComplainCategories();
				request.setAttribute("list", list);
				request.getRequestDispatcher("WEB-INF/view/insertcomplain.jsp").forward(request, response);
			
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else {
			response.sendRedirect("login?error");
		}

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

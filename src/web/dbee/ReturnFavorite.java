package web.dbee;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.dbee.GoFavorite;
import model.login.conn;
//import web.dbee.HttpSesseion;


import com.mysql.jdbc.Connection;

/**
 * Servlet implementation class ReturnFavorite
 */
public class ReturnFavorite extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReturnFavorite() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//ServletContext sc = getServletContext();
		conn c = new conn();
		
		Connection conn= c.getConn();
		request.getParameter("imgName");
		 HttpSession session = request.getSession();
		 int id = Integer.parseInt((String)session.getAttribute("currentID"));
		String stu_picture= request.getParameter("imgName");
		
		System.out.println(stu_picture);
		GoFavorite gf = new GoFavorite();
		gf.saveFavorite(id, conn,stu_picture);
//		
//	
//		request.setAttribute("Final", rs);
//		RequestDispatcher view = request.getRequestDispatcher("Final.jsp");
//		view.forward(request, response);
		
	}

}

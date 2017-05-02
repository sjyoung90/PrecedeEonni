package web.dbee;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Iterator;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.dbee.GoWorldCup;
import model.login.conn;

import com.mysql.jdbc.Connection;

/**
 * Servlet implementation class DoWorldCup
 */
public class DoWorldCup extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DoWorldCup() {
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
	
		//ServletContext sc = getServletContext();
		conn c = new conn();
		Connection conn= c.getConn();
		
		//DBUtil.worldCupStart(conn, uid);
		GoWorldCup wc = new GoWorldCup();
		String[][] result=wc.worldCupStart(conn);
		
		for(int i=0;i<8;i++){
			System.out.println(result[i][0]);
			System.out.println(result[i][1]);
		}
		
		
		request.setAttribute("Result", result); 
		//PrintWriter out = response.getWriter();
		RequestDispatcher view = request.getRequestDispatcher("Result.jsp");
		view.forward(request, response);

	}

}

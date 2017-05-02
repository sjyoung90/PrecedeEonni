package controller.login;

import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Enumeration;
import java.util.Hashtable;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.mysql.jdbc.Connection;

import model.login.conn;
import model.login.getBaseInfo;
import model.login.memberCheck;

/**
 * Servlet implementation class infoCheck
 */
public class infoCheck extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public infoCheck() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.setContentType("text/html");
		int inputID = Integer.parseInt(request.getParameter("stu_number"));
		String inputPW = request.getParameter("password");
		int	resultToJSP = 0;
		String role = null;
		System.out.println(inputID);
		memberCheck check = new memberCheck();
		getBaseInfo base = new getBaseInfo();
		RequestDispatcher view = null;
	
		//ServletContext sc = getServletContext();
		conn a = new conn();
		Connection loginConn = a.getConn();
		ResultSet	result = check.checkUser(inputID, loginConn);
		
		String[] 	rsBase = new String[2];
		if(result.equals(null))	System.out.print("no memberCheck");

		try{
			//System.out.println(result.getString(0));
			if(result.next()){	//해당 id를 가지는 회원이 있을 경우
				if(result.getString("password").equals(inputPW)){	//비밀번호가 같을 경우
					//resultToJSP = "환영합니다^^";
					System.out.println("회원있음");
					resultToJSP = 1;
					role = result.getString("role");
					HttpSession session = request.getSession();
					session.setAttribute("currentID", Integer.toString(inputID));
					session.setAttribute("role", role);
					
					rsBase = base.getInfoForSession(inputID, role, loginConn);
					if(rsBase == null)	System.out.println("rsBase is null");
					else{
						//if(rsBase.next()){
						System.out.println(rsBase[0]);
						System.out.println("infoCheck: rsBase.next()");
						session.setAttribute("teamID", rsBase[0]);
			
						//System.out.println(result.getString("team_id"));
						//System.out.println(result.getString("team_id"));
					
						if(role.equals("동생")){
							//session.setAttribute("fieldID", rsBase[2]);
						}else{
							session.setAttribute("way", rsBase[1]);
						}
					}//else{System.out.println("infoCheck: 여긴멍미");}
					System.out.println("session ID : "+session.getAttribute("currentID"));
					//session.setMaxInactiveInterval(30*60);
				}else{
					resultToJSP = 2;
					//resultToJSP = "비밀번호가 틀렸습니다ㅜㅜ";
				}
			}else{	//id에 대한 정보가 없을 경우
				resultToJSP = 3;
				//resultToJSP = "회원가입해주세요^^*";
				
			}
		}catch(SQLException e){
			e.printStackTrace();
		}
		
		request.setAttribute("loginResult", resultToJSP);
		//resultToJSP 1이면 정상로그인 
		//resultToJSP 2이면 비번틀림
		//resultToJSP 3이면 회원가입해주세요
		view = request.getRequestDispatcher("project_index.jsp");
		//view = request.getRequestDispatcher("loginResult.jsp");
		view.forward(request, response);
	}
}

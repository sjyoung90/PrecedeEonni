package controller.join;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Hashtable;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.join.insMentee;
import model.join.insWorker;
import model.login.conn;
import model.login.getBaseInfo;
import model.login.memberCheck;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.mysql.jdbc.Connection;

/**
 * Servlet implementation class join
 */
public class joinWorker extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public joinWorker() {
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
		RequestDispatcher view = null;
		request.setCharacterEncoding("utf-8");
		String photoPath="C:/Users/samsung/Documents/PresedeEonni/WebContent/uploaded_image";
		String fileName = null;
		int maxSize=1024*1024*10;
		
		//file upload
		File f=new File(photoPath);
		if(!f.isFile()){
			if(!f.isDirectory()){
				f.mkdir();
			}		
		}
		
		MultipartRequest up = new MultipartRequest(request, photoPath, maxSize, "UTF-8", new DefaultFileRenamePolicy());
		if(up.getFile("addfile") != null){
			//System.out.println("file얻어오기");
			f = up.getFile("addfile");
			System.out.println(f.getAbsolutePath());
			fileName = up.getOriginalFileName("addfile"); 
			System.out.println(fileName);
		}
				
		int	id = Integer.parseInt(up.getParameter("stu_number"));
		String	pw = up.getParameter("password");
		String 	name = up.getParameter("name");
		String	role = up.getParameter("role");
		int	college = Integer.parseInt(up.getParameter("college"));
		college ++;
		int	major = Integer.parseInt(up.getParameter("major"));
		major ++;
		String	intro = up.getParameter("intro");
		int 	phone = Integer.parseInt(up.getParameter("phone"));
		int	way = Integer.parseInt(up.getParameter("way"));	//way == 1, worker
		String	offLine = up.getParameter("off-line");	//yes or no
		String 	company = up.getParameter("company");
		String	dept = up.getParameter("dept");
		String	position = up.getParameter("position");
		int	resultToJSP = 0;

		memberCheck check = new memberCheck();
		insWorker in = new insWorker();
			
		//ServletContext sc = getServletContext();
		conn c = new conn();
		try {
			Connection joinConn= c.getConn();
			ResultSet	result = check.checkUser(id, joinConn);
			
			if(result.next())	{
				resultToJSP = 1; //이미 회원인 경우
				System.out.println("이미 회원임");
			}
			else{
				if(in.insertWorkerToDB(id, pw, name, role, college, major, fileName, phone, intro, way, 
						offLine, company, dept, position, joinConn) == 3){
					System.out.println("join sucess");
					//resultToJSP = 2;
					HttpSession session = request.getSession();
					session.setAttribute("currentID", Integer.toString(id));	//회원가입후 바로 로그인상태로 만들기
					session.setAttribute("role", "언니");
					System.out.println(session.getAttribute("currentID"));
					
					getBaseInfo base = new getBaseInfo();
					String[] rsBase = base.getInfoForSession(id, role, joinConn);
					if(rsBase == null)	System.out.println("rsBase null");
					else{
						System.out.println(rsBase[0]);
						session.setAttribute("teamID", rsBase[0]);

						//System.out.println(result.getString("team_id"));
						//System.out.println(result.getString("team_id"));
					/*
						if(role.equals("동생")){
							session.setAttribute("fieldID", rsBase.getString("f_id"));
						}else{*/
						session.setAttribute("way", rsBase[1]);
					}
				}
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		request.setAttribute("joinResult", resultToJSP);
		view = request.getRequestDispatcher("main_slide.html");
		view.forward(request, response);
		
	}

}

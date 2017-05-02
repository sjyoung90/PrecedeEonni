package controller.join;

import java.io.File;
import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Hashtable;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.join.insBiz;
import model.join.insPostGraduate;
import model.login.conn;
import model.login.getBaseInfo;
import model.login.memberCheck;

import com.mysql.jdbc.Connection;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

/**
 * Servlet implementation class joinPostGraduate
 */
public class joinPostGraduate extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public joinPostGraduate() {
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
		RequestDispatcher view = null;
		request.setCharacterEncoding("utf-8");
		//String savePath = getServletContext().getRealPath("upfolder");
		//String photoPath = getServletContext().getRealPath("uploaded_photo");
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
			System.out.println("file얻어오기");
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
		int	way = Integer.parseInt(up.getParameter("way"));	//way == 3, pastGraduate
		String	offLine = up.getParameter("off-line");	//yes or no
		String pg_college = up.getParameter("pg_college");
		String pg_major = up.getParameter("pg_major");
		int pg_grade = Integer.parseInt(up.getParameter("pg_grade"));
		int	resultToJSP = 0;
		/*
		System.out.println(id);
		System.out.println(name);
		System.out.println(college);
		System.out.println(major);
		*/
		memberCheck check = new memberCheck();
		insPostGraduate in = new insPostGraduate();
		HttpSession session = request.getSession();
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
				if(in.insertPGToDB(id, pw, name, role, college, major, fileName, phone, intro, way, 
						offLine, pg_college, pg_major, pg_grade, joinConn) == 3){
					System.out.println("postGraduate : join sucess");
					//resultToJSP = 2;
					
					session.setAttribute("currentID", Integer.toString(id));	//회원가입후 바로 로그인상태로 만들기
					System.out.println(session.getAttribute("currentID"));
					session.setAttribute("role", "언니");
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
						System.out.println("joinPG : way - "+rsBase[1]);
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

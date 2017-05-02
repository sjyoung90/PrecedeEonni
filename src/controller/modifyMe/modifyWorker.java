package controller.modifyMe;

import java.io.File;
import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.me.updateMentee;
import model.me.updateMenteeField;
import model.me.updateWorker;
import model.login.conn;

import com.mysql.jdbc.Connection;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

/**
 * Servlet implementation class modifyWorker
 */
public class modifyWorker extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public modifyWorker() {
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
		String photoPath="C:/Users/samsung/Documents/PresedeEonni/WebContent/uploaded_image";
		String fileName = null;
		int maxSize=1024*1024*10;
		//String savePath = getServletContext().getRealPath("upfolder");
		//String photoPath = getServletContext().getRealPath("uploaded_photo");
		MultipartRequest up = new MultipartRequest(request, photoPath, maxSize, "UTF-8", new DefaultFileRenamePolicy());
		
		int	id = Integer.parseInt(up.getParameter("stu_number"));
		String	pw = up.getParameter("password");
		String 	name = up.getParameter("name");
		String	role = up.getParameter("role");
		int	college = Integer.parseInt(up.getParameter("college"));
		college ++;
		int major=0;
		if(up.getParameter("major") == null)	major = 2;
		//int	major = Integer.parseInt(up.getParameter("major"));
		major ++;
		String	intro = up.getParameter("intro");
		int 	phone = Integer.parseInt(up.getParameter("phone"));
		String	company = up.getParameter("company");
		String	dept = up.getParameter("dept");
		String	position = up.getParameter("position");
		int	offLine;
		if(up.getParameter("off-line").equals("yes"))	offLine = 1;
		else	offLine = 0;
		
		String	updateSt = null;
		
		int	resultToJSP = 0;
		updateWorker upWorker = new updateWorker();
		//updateMenteeField upMF = new updateMenteeField();
		String updateMentor = "UPDATE	mentor " +
				"SET offLine="+offLine+" WHERE mentor_st="+id+";";
		String updateWorker = "UPDATE	worker " +
				"SET company='"+company+"', dept='"+dept+"', position='"+position+"' WHERE worker_st="+id+";";
		
		//ServletContext sc = getServletContext();
		conn c = new conn();
		Connection updateConn= c.getConn();
		System.out.println("modifyWorker");
		if(up.getFile("addfile") != null){
			//file upload
			File f=new File(photoPath);
			if(!f.isFile()){
				if(!f.isDirectory()){
					f.mkdir();
				}		
			}
			
		
			System.out.println("file얻어오기");
			f = up.getFile("addfile");
			System.out.println(f.getAbsolutePath());
			fileName = up.getOriginalFileName("addfile"); 
			System.out.println(fileName);
	
			updateSt = "UPDATE	member " +
					"SET password='"+pw+"', name='"+name+"', intro='"+intro+"', photo='"+fileName+"' WHERE stNumber="+id+";";
			//resultToJSP = upWorker.updateWorkerToDB(updateSt, updateMentor, updateWorker, updateConn);
			
		}else{
			updateSt = "UPDATE	member " +
				"SET password='"+pw+"', name='"+name+"', intro='"+intro+"' WHERE stNumber="+id+";";
			
		}
		resultToJSP = upWorker.updateWorkerToDB(updateSt, updateMentor,updateWorker, updateConn);
		if(resultToJSP == 3)	System.out.println("modifyWorker 수정 성공");
		else	System.out.println("modifyWorker 수정 실패");
		//int mf = upMF.updateMenteeFieldToDB(id, wayList, updateConn);
		//if(mf == wayList.length)	System.out.println("mentee_field 업데이트 성공");
		//else	System.out.println("mentee_field 업데이트 실패");
		/*
		System.out.println(id);
		System.out.println(name);
		System.out.println(college);
		System.out.println(major);
		*/
		
		request.setAttribute("joinResult", resultToJSP);
		view = request.getRequestDispatcher("main_slide.html");
		view.forward(request, response);
	}

}

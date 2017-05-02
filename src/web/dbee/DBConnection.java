package web.dbee;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.Properties;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

/**
 * Application Lifecycle Listener implementation class DBConnectionManage
 *
 */
public class DBConnection implements ServletContextListener {

    /**
     * Default constructor. 
     */
    public DBConnection() {
        // TODO Auto-generated constructor stub
    }

	/**
     * @see ServletContextListener#contextInitialized(ServletContextEvent)
     */
    public void contextInitialized(ServletContextEvent event) {
    	
    	Connection conn = null;
		Properties connectionProps = new Properties();
		
		ServletContext sc = event.getServletContext();
		String url = sc.getInitParameter("dburl");
		String user = sc.getInitParameter("dbuser");
		String passwd = sc.getInitParameter("dbpasswd");
		
		connectionProps.put("user", user);
		connectionProps.put("password", passwd);
		System.out.println("conn : " + conn);
		try {
			conn = DriverManager.getConnection(url, connectionProps);
			if (conn != null) sc.setAttribute("DBconnection", conn);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		System.out.println("conn : " + conn);

    }

	/**
     * @see ServletContextListener#contextDestroyed(ServletContextEvent)
     */
    public void contextDestroyed(ServletContextEvent event) {
    	
    	Connection conn = (Connection) event.getServletContext().getAttribute("DBconnection");
    	
    	try {
			conn.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    }
	
}

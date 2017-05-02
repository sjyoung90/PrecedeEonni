package model.login;

import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

//
//현재 접속 중인 회원(세션)의 수
//

public class loginCounter implements	HttpSessionListener{
	static private int activeSessions;
	@Override
	public void sessionCreated(HttpSessionEvent e) {
		// TODO Auto-generated method stub
		activeSessions ++;
	}

	@Override
	public void sessionDestroyed(HttpSessionEvent e) {
		// TODO Auto-generated method stub
		activeSessions --;
	}

}

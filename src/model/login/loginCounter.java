package model.login;

import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

//
//���� ���� ���� ȸ��(����)�� ��
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

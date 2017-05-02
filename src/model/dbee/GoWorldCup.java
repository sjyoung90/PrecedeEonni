package model.dbee;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Random;
import java.util.Scanner;

public class GoWorldCup {

	public String[][] worldCupStart(Connection con){
		String sq = "SELECT COUNT(*) FROM mentor "; //���� ���̺? �ִ� row�� ����
 		String sq2 ="SELECT mentor_st FROM mentor"; //���� ���̺��� ���� �й�
		//String sq3= "SELECT index FROM mentor"; //���� ���̺��� �ε���
		//������̺? �ִ� ������ ���
 		//String sq3 = "SELECT name FROM menotr";
 		
 		
		String result=null;
		int arr[]={0,0,0,0,0,0,0,0} ;
		int stu_no[]={0,0,0,0,0,0,0,0};
		ArrayList<String> photo = new ArrayList<String>();
		ArrayList<String> name = new ArrayList<String>();
		//String result="";
		Statement st =null;
		ResultSet rs= null;
		String[][] worldcup_array=new String[8][2];
		try {
			st = con.createStatement();
			rs = st.executeQuery(sq);
			if(rs.next()){
				String rst = rs.getString(1); //�������̺��� �ο��� ����
				
				int count =Integer.parseInt(rst); //������ ī��Ʈ�� ��Ʈ������ �ٲ� ������� ���� 10!
				
				
				
				Random random = new Random();  //�����Լ� ��� 
				
				while(true){
					int check =0;
					boolean ck= false;
				int j; int i;
				for(i=0; i<8; i++){ //lf�� 8��
					j = random.nextInt(count);
					arr[i] = j;
				for(int k=0; k<=i; k++){
						if(arr[i] == arr[k] && i!=k){
							ck=false;
								j=random.nextInt(count);
								arr[i] = j;
								break;
						}else{
							ck=true;
						}//end else
					}//end for
				if(ck==true){
					check++;
				}//end if
				}//end for	
					if(check == arr.length){
						break;
					}//end if
				}//end while
//				for(int i=0; i<8; i++){
//					System.out.println(arr[i]);
//					}			
				}//end if //���� �� ���� ������ �ʵ��� arr[]�迭�� ���� ������ ���� ����.				
	}catch (SQLException e1){
			e1.printStackTrace();
		}
	
		//���ݱ��� ��Ȳ : mentor table�� �ִ� index�� �̿� �������� 8�� ����		
		//������ �����ؾ� �� �� : �� �й��� �̿��ؼ� member table�� �ִ� �׵��� ���� ��θ� ����!!!!
			
		try {
			st = con.createStatement();
			rs = st.executeQuery(sq2);
		if(rs.next()){
				
				for(int i =0; i<8; i++){
				if(rs.absolute(arr[i]+1)){
					//System.out.println("�����ε���:"+arr[i]);
					String rs1 = rs.getString(1);		
					stu_no[i]=Integer.parseInt(rs1);
					//System.out.println("�׿� �´� �л� �й�:"+ stu_no[i]);
			}//end if
	}//end for
}//end if
}catch (SQLException e1){
		e1.printStackTrace();
}
		try {
			String sq3 ="SELECT photo,name FROM member WHERE stNumber =";	

			for(int i=0; i<8; i++){
			st = con.createStatement();
			rs = st.executeQuery(sq3+"'" + stu_no[i] + "'");
			if(rs.next()){
				String photo_=rs.getString("photo");
				String name_=rs.getString("name");
				
					//System.out.println("�л� ���̺? �ִ� ����:"+ name);
					photo.add(photo_);
					name.add(name_);
					 worldcup_array[i][0]=photo_;
					 worldcup_array[i][1]=name_;
			}//end if
		}//end for
}catch (SQLException e1){
		e1.printStackTrace();
}
		
		
//	public void worldLogin(){
			
			String str="0";
			System.out.println(photo);
			System.out.println(name);
//
//			Scanner scanner = new Scanner(System.in);
//			System.out.println(photo.get(0)+","+photo.get(1));
//			
//			System.out.println("������ ����� �Է��ϼ���:");
//			String sc = scanner.next();
//		
//		if(sc.equals(photo.get(0))){
//			str = photo.get(0);
//			
//			photo.remove(0);
//			photo.remove(0);
//			System.out.println("������ �ι�:" + str);
//		}//end if 
//		
//		else if(sc.equals(photo.get(1))){
//			str=photo.get(1);
//			
//			photo.remove(0);
//			photo.remove(0);
//			System.out.println("������ �ι�:" + str);
//		}//end else if
//		
//		for( int i=0; i < 6 ; i++){
//			System.out.println(str+","+photo.get(0));
//			System.out.println("�״��� �ι��� �����ϼ���:");
//			String sc1 = scanner.next();
//			
//			if(sc1.equals(photo.get(0))){	
//				str = photo.get(0);
//				photo.remove(0);
//			}
//			else{
//				photo.remove(0);
//			}
//		}//end for

		return worldcup_array;
	}
}

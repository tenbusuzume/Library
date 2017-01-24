package library;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class UserList {

	private static String strConn ="jdbc:mysql://localhost/library"
			+"?user=tenbusuzume&password=1117"
			+"&useUnicode=true&characterEncoding=Windows-31J";

	private ArrayList<User> alUser = new ArrayList<User>();
	private int intCounter;

	public void Load()throws Exception{
		Class.forName("com.mysql.jdbc.Driver");
		Connection conn = DriverManager.getConnection(this.strConn);
		String strSql = "SELECT * FROM user WHERE user_level>=0";
		PreparedStatement pstmt = conn.prepareStatement(strSql);
		ResultSet rs = pstmt.executeQuery();
		this.alUser.clear();
		while(rs.next()){
			User user = new User();
			user.setId(rs.getString("user_id"));
			user.setName(rs.getString("name"));
			user.setLevel(rs.getInt("user_level"));
			user.setEmail(rs.getString("email"));
			user.setid(rs.getInt("id"));
			this.alUser.add(user);
		}
		this.intCounter=0;
	}

	public boolean hasNext(){
		boolean blResult=false;
		if(this.intCounter<this.alUser.size()){
			blResult=true;
		}
		return blResult;
	}

	public User getNext(){
		User user = alUser.get(this.intCounter);
		this.intCounter++;
		return user;
	}
}

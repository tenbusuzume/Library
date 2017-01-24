package library;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class User{
	private static final String strConn ="jdbc:mysql://localhost/library"
	+"?user=tenbusuzume&password=1117"
	+"&useUnicode=true&characterEncoding=Windows-31J";

	private String strName;
	private String strEmail;
	private String strUser_Id;
	private int intLevel;
	private int intId;

	// setter
	public void setName(String name){
		this.strName = name;
	}

	public void setEmail(String email){
		this.strEmail = email;
	}

	public void setId(String user_Id){
		this.strUser_Id = user_Id;
	}
	public void setLevel(int user_level){
		this.intLevel = user_level;
	}
	public void setid(int id){
		this.intId = id;
	}

	// getter
	public String getName(){
		return this.strName;
	}

	public String getEmail(){
		return this.strEmail;
	}

	public String getId(){
		return this.strUser_Id;
	}
	public int getLevel(){
		return this.intLevel;
	}
	public int getid(){
		return this.intId;
	}










	//���O�C�����\�b�h
	public String Login(String strUser_Id,String password)throws Exception{
		String strMessage=null;
		Class.forName("com.mysql.jdbc.Driver");
		Connection conn = DriverManager.getConnection(this.strConn);
		String strSql = "SELECT * FROM user WHERE user_id = ? AND password=password(?)";
		PreparedStatement pstmt = conn.prepareStatement(strSql);
		pstmt.setString(1,strUser_Id);
		pstmt.setString(2,password);
		ResultSet rs = pstmt.executeQuery();
		if(rs.next()){
			this.strUser_Id=rs.getString("user_id");
			this.strName=rs.getString("name");
			this.intLevel=rs.getInt("user_level");
			this.intId=rs.getInt("id");
		}else{
			strMessage="���O�C�����܂��̓p�X���[�h���Ⴂ�܂�";
		}
		rs.close();
		pstmt.close();
		conn.close();
		return strMessage;
	}



	//�V�K�o�^���\�b�h
	public String Add(String password)throws Exception{
		String strMessage=null;
		Class.forName("com.mysql.jdbc.Driver");
		Connection conn = DriverManager.getConnection(this.strConn);
		String strSql="INSERT INTO user (name,email,user_id,password,user_level)VALUES(?,?,?,password(?),?)";
		PreparedStatement pstmt = conn.prepareStatement(strSql);
		pstmt.setString(1,this.strName);
		pstmt.setString(2,this.strEmail);
		pstmt.setString(3,this.strUser_Id);
		pstmt.setString(4,password);
		pstmt.setInt(5,this.intLevel);

		try{
			pstmt.executeUpdate();
		}catch(SQLException e){
			if(e.getErrorCode()==1062){
				strMessage="���O�C�������d�����Ă��܂�";
			}else{
				strMessage=e.getMessage();
			}
		}
		pstmt.close();
		conn.close();
		return strMessage;
	}


	//���[�h���\�b�h
	public String Load(int id)throws Exception{
		String strMessage=null;
		Class.forName("com.mysql.jdbc.Driver");
		Connection conn = DriverManager.getConnection(this.strConn);
		String strSql = "SELECT * FROM user WHERE id =?";
		PreparedStatement pstmt = conn.prepareStatement(strSql);
		pstmt.setInt(1,id);
		ResultSet rs = pstmt.executeQuery();
		if(rs.next()){
			this.intId=rs.getInt("id");
			this.strName=rs.getString("name");
			this.strEmail=rs.getString("email");
			this.strUser_Id=rs.getString("user_id");
			this.intLevel=rs.getInt("user_level");
		}else{
			strMessage="�Y������f�[�^������܂���";
		}
		rs.close();
		pstmt.close();
		conn.close();
		return strMessage;
	}


	//�p�X���[�h�`�F���W
	public String passwordChange(String oldPassword, String newPassword)throws Exception{
		String strMessage=null;
		Class.forName("com.mysql.jdbc.Driver");
		Connection conn = DriverManager.getConnection(this.strConn);
		String strSql = "UPDATE user SET password=password(?) WHERE id=? AND password=password(?)";
		PreparedStatement pstmt = conn.prepareStatement(strSql);
		pstmt.setString(1,newPassword);
		pstmt.setString(2,this.strUser_Id);
		pstmt.setString(3,oldPassword);
		int intResult = pstmt.executeUpdate();
		if(intResult!=1){
			strMessage="�Â��p�X���[�h�ł�";
		}
		pstmt.close();
		conn.close();
		return strMessage;
	}


	//�X�V���\�b�h
	public String Update(String password)throws Exception{
		Class.forName("com.mysql.jdbc.Driver");
		Connection conn = DriverManager.getConnection(this.strConn);
		PreparedStatement pstmt;
		String strSql;
		if(password==null){
			strSql = "UPDATE user SET user_id=?,name=?,email=?,user_level=? WHERE id=?";
			pstmt = conn.prepareStatement(strSql);
			pstmt.setString(1,this.strUser_Id);
			pstmt.setString(2,this.strName);
			pstmt.setString(3,this.strEmail);
			pstmt.setInt(4,this.intLevel);
			pstmt.setInt(5,this.intId);
		}else{
			strSql = "UPDATE user SET user_id=?,name=?,email=?,user_level=?,password=password(?) WHERE id=?";
			pstmt = conn.prepareStatement(strSql);
			pstmt.setString(1,this.strUser_Id);
			pstmt.setString(2,this.strName);
			pstmt.setString(3,this.strEmail);
			pstmt.setInt(4,this.intLevel);
			pstmt.setString(5,password);
			pstmt.setInt(6,this.intId);;
		}
		String strMessage=null;
		try{
			int intResult = pstmt.executeUpdate();
			if(intResult!=1){
				strMessage="�Y������f�[�^������܂���";
			}
		}catch(SQLException e){
			if(e.getErrorCode()==1062){
				strMessage="���O�C�������d�����Ă��܂�";
			}else{
				strMessage=e.getMessage();
			}
		}
		pstmt.close();
		conn.close();
		return strMessage;
	}


	//�폜���\�b�h
	public String Delete()throws Exception{
		String strMessage=null;
		Class.forName("com.mysql.jdbc.Driver");
		Connection conn = DriverManager.getConnection(this.strConn);
		PreparedStatement pstmt;
		String strSql = "UPDATE user set name=null,email=null,password=null,user_id=null,user_level=-1 WHERE id=?";
		pstmt =conn.prepareStatement(strSql);
		pstmt.setInt(1, this.intId);
		try{
			int intResult = pstmt.executeUpdate();
			if(intResult!=1){
				strMessage="�X�V�Ɏ��s���܂���";
			}
		}catch(SQLException e){
			strMessage=e.getMessage();
		}
		pstmt.close();
		conn.close();
		return strMessage;
	}
}
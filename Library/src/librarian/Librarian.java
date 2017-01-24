package library;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class Librarian {
	private static final String strConn="jdbc:mysql://localhost/library"
	+"?user=tenbusuzume&password=1117"
	+"&useUnicode=true&characterEncoding=Windows-31J";

	private String strBook;
	private int intId;
	private int intType;
	private String strWriter;
	private String strCompany;
	private String strDate;
	private String strRGS_date;
	private int intStatus;

	//setter
	public void setStrBook(String strBook){
		this.strBook = strBook;
	}
	public void setIntId(int intId){
		this.intId = intId;
	}
	public void setIntType(int intType){
		this.intType = intType;
	}
	public void setStrWriter(String strWriter){
		this.strWriter = strWriter;
	}
	public void setStrCompany(String strCompany){
		this.strCompany = strCompany;
	}
	public void setStrDate(String strDate){
		this.strDate = strDate;
	}
	public void setStrRGS_Date(String strRGS_date){
		this.strRGS_date = strRGS_date;
	}
	public void setIntStatus(int intStatus){
		this.intStatus = intStatus;
	}


	//getter
	public String getStrBook(){
		return this.strBook;
	}
	public int getIntId(){
		return this.intId;
	}
	public int getIntType(){
		return this.intType;
	}
	public String getStrWriter(){
		return this.strWriter;
	}
	public String getStrCompany(){
		return this.strCompany;
	}
	public String getStrDate(){
		return this.strDate;
	}
	public String getStrRGS_Date(){
		return this.strRGS_date;
	}
	public int getIntStatus(){
		return this.intStatus;
	}


	//登録メソッド
	public String Register()throws Exception{
		String strMessage=null;
		Class.forName("com.mysql.jdbc.Driver");
		Connection conn = DriverManager.getConnection(this.strConn);
		String strSql = "INSERT INTO book (id,book,type,company,date,writer,register_date,status) VALUES(?,?,?,?,?,?,now(),?)";
		PreparedStatement pstmt = conn.prepareStatement(strSql);
		pstmt.setInt(1,this.intId);
		pstmt.setString(2,this.strBook);
		pstmt.setInt(3,this.intType);
		pstmt.setString(4,this.strCompany);
		pstmt.setString(5,this.strDate);
		pstmt.setString(6,this.strWriter);
		//pstmt.setString(7,this.strRGS_date);
		pstmt.setInt(7,this.intStatus);

		try{
			pstmt.executeUpdate();
		}catch(SQLException e){
			if(e.getErrorCode()==1062){
				strMessage="IDが重複しています";
			}else{
				strMessage=e.getMessage();
			}
		}
			pstmt.close();
			conn.close();
			return strMessage;
	}


	//更新メソッド
	public String Update()throws Exception{
		String strMessage=null;
		Class.forName("com.mysql.jdbc.Driver");
		Connection conn = DriverManager.getConnection(this.strConn);
		String strSql = "UPDATE book SET book=?,type=?,company=?,date=?,writer=?,register_date=?,status=? WHERE id=?";
		PreparedStatement pstmt = conn.prepareStatement(strSql);
		pstmt.setString(1,this.strBook);
		pstmt.setInt(2,this.intType);
		pstmt.setString(3,this.strCompany);
		pstmt.setString(4,this.strDate);
		pstmt.setString(5,this.strWriter);
		pstmt.setString(6,this.strRGS_date);
		pstmt.setInt(7,this.intStatus);
		pstmt.setInt(8,this.intId);

		try{
		int intResult = pstmt.executeUpdate();
		if(intResult!=1){
			strMessage="該当するデータがありません";
		}
		}catch(SQLException e){
			if(e.getErrorCode()==1062){
				strMessage="";
			}
		}
		pstmt.close();
		conn.close();
		return strMessage;
	}


	//読み込みメソッド
	public String Load(int intId)throws Exception{
		String strMessage = null;
		Class.forName("com.mysql.jdbc.Driver");
		Connection conn = DriverManager.getConnection(this.strConn);
		String strSql = "SELECT * FROM book WHERE id =?";
		PreparedStatement pstmt = conn.prepareStatement(strSql);
		pstmt.setInt(1,intId);
		ResultSet rs = pstmt.executeQuery();
		if(rs.next()){
			this.intId=rs.getInt("id");
			this.strBook=rs.getString("book");
			this.intType=rs.getInt("type");
			this.strCompany=rs.getString("company");
			this.strDate=rs.getString("date");
			this.strWriter=rs.getString("writer");
			this.strRGS_date=rs.getString("register_date");
			this.intStatus=rs.getInt("status");
		}else{
			strMessage="該当するデータがありません";
		}
		pstmt.close();
		conn.close();
		return strMessage;
	}


	//削除メソッド
	public String Delete(int intId)throws Exception{
		String strMessage=null;
		Class.forName("com.mysql.jdbc.Driver");
		Connection conn = DriverManager.getConnection(this.strConn);
		String strSql = "UPDATE book SET book=null,type=-1,company=null,date=null,writer=null,register_date=null,status=null WHERE id =?";
		PreparedStatement pstmt = conn.prepareStatement(strSql);
		pstmt.setInt(1,this.intId);
		try{
			int intResult = pstmt.executeUpdate();
			if(intResult!=1){
				strMessage="更新に失敗しました";
			}
		}catch(SQLException e){
				strMessage=e.getMessage();
		}
		pstmt.close();
		conn.close();
		return strMessage;
	}

	public String Delete(String cb[])throws Exception{
		String strMessage=null;
		Class.forName("com.mysql.jdbc.Driver");
		Connection conn = DriverManager.getConnection(this.strConn);
		String strSql = "UPDATE book SET book=null,type=-1,company=null,date=null,writer=null,register_date=null,status=null WHERE id =?";
		PreparedStatement pstmt = conn.prepareStatement(strSql);
		pstmt.setInt(1,this.intId);
		try{
			int intResult = pstmt.executeUpdate();
			if(intResult<1){
				strMessage="更新に失敗しました";
			}
		}catch(SQLException e){
				strMessage=e.getMessage();
		}
		pstmt.close();
		conn.close();
		return strMessage;
	}


	//借りる
	public String borrow()throws Exception{
		String strMessage=null;
		Class.forName("com.mysql.jdbc.Driver");
		Connection conn = DriverManager.getConnection(this.strConn);
		String strSql = "UPDATE book SET status=1 WHERE id=?";
		PreparedStatement pstmt = conn.prepareStatement(strSql);
		pstmt.setInt(1,this.intStatus);
		pstmt.setInt(2,this.intId);
		try{
			int Result = pstmt.executeUpdate();
			if(Result<1){
				strMessage="貸出できませんでした";
			}
		}catch(SQLException e){
			strMessage=e.getMessage();
		}
		pstmt.close();
		conn.close();
		return strMessage;
	}


	//返す
	public String Return()throws Exception{
		String strMessage=null;
		Class.forName("com.mysql.jdbc.Driver");
		Connection conn = DriverManager.getConnection(this.strConn);
		String strSql = "UPDATE book SET status=0 WHERE id=?";
		PreparedStatement pstmt = conn.prepareStatement(strSql);
		pstmt.setInt(1,this.intStatus);
		pstmt.setInt(2,this.intId);
		try{
			int Result = pstmt.executeUpdate();
			if(Result<1){
				strMessage="返却できませんでした";
			}
		}catch(SQLException e){
			strMessage=e.getMessage();
		}
		pstmt.close();
		conn.close();
		return strMessage;
	}
}


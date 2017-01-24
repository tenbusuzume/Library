package library;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;


// 本を管理するリスト
public class BookList {

	// 接続先の定数
	private static final String strConn ="jdbc:mysql://localhost/library"
	+"?user=tenbusuzume&password=1117"
	+"&useUnicode=true&characterEncoding=Windows-31J";

	// 変数
	private ArrayList<Librarian> albook = new ArrayList<Librarian>();
	private int intCounter;

	// 検索の名前
	private String searchName;

	/**
	 * 検索の名前 setter
	 * @param strName
	 */
	public void setName(String strName){
		this.searchName=strName;
	}

	/**
	 * 検索の名前 getter
	 * @return
	 */
	public String getName(){
		return this.searchName;
	}

	//検索のジャンル
	private int searchType;

	/**
	 * 検索のジャンル setter
	 * @param intType
	 */
	public void setType(int intType){
		this.searchType=intType;
	}

	/**
	 * 検索のジャンル getter
	 * @return
	 */
	public int getType(){
		return this.searchType;
	}

	/**

	 * 本の一覧を取得する。
	 * @throws Exception
	 */
 	public void Load()throws Exception{

		// DB接続～SQLの実行
		Class.forName("com.mysql.jdbc.Driver");
		Connection conn = DriverManager.getConnection(this.strConn);
		String strSql = "SELECT * FROM book WHERE type>=0";
		PreparedStatement pstmt = conn.prepareStatement(strSql);
		ResultSet rs = pstmt.executeQuery();

		// リストのクリア
		this.albook.clear();

		// 取得した本をリスト化
		while(rs.next()){
			Librarian librarian = new Librarian();
			librarian.setStrBook(rs.getString("book"));
			librarian.setStrDate(rs.getString("date"));
			librarian.setIntType(rs.getInt("type"));
			librarian.setStrWriter(rs.getString("writer"));
			librarian.setStrCompany(rs.getString("company"));
			librarian.setStrRGS_Date(rs.getString("register_date"));
			librarian.setIntStatus(rs.getInt("status"));
			librarian.setIntId(rs.getInt("id"));
			this.albook.add(librarian);
		}

		intCounter=0;

		// クローズ処理
		pstmt.close();
		conn.close();
	}

	/**
	 * 次の要素があるかを返す
	 * @return
	 */
	public boolean hasNext(){

		boolean blResult=false;

		if(this.intCounter<this.albook.size()){
			blResult=true;
		}

		return blResult;
	}

	/**
	 * 次の要素を取得する
	 * @return
	 */
	public Librarian getNext(){
			Librarian librarian = albook.get(this.intCounter);
			this.intCounter++;
			return librarian;
		}

	/**
	 * 本をジャンル毎に検索する。
	 * @param strName,intType
	 * @return
	 * @throws Exception
	 */
	public String search(String strName,int intType)throws Exception{
		String strMessage=null;

		// DB接続～SQLの実行
		Class.forName("com.mysql.jdbc.Driver");
		Connection conn = DriverManager.getConnection(this.strConn);
		String strSql = "SELECT * FROM book WHERE book LIKE ? and type=?";
		PreparedStatement pstmt = conn.prepareStatement(strSql);
		pstmt.setString(1,"%" + strName + "%");
		pstmt.setInt(2,intType);

		ResultSet rs = pstmt.executeQuery();

		// リストのクリア
		this.albook.clear();

		// 検索結果を取得する。
		while(rs.next()){
			Librarian librarian = new Librarian();
			librarian.setStrBook(rs.getString("book"));
			librarian.setStrDate(rs.getString("date"));
			librarian.setIntType(rs.getInt("type"));
			librarian.setStrWriter(rs.getString("writer"));
			librarian.setStrCompany(rs.getString("company"));
			librarian.setStrRGS_Date(rs.getString("register_date"));
			librarian.setIntStatus(rs.getInt("status"));
			librarian.setIntId(rs.getInt("id"));
			this.albook.add(librarian);
		}
		intCounter=0;

		// クローズ処理
		pstmt.close();
		conn.close();

		return strMessage;
	}

	/**
	 * 本をすべて検索する。
	 * @param strName
	 * @return
	 * @throws
	 */
	public String allSearch(String strName)throws Exception{
		String strMessage=null;

		// DB接続～SQLの実行
		Class.forName("com.mysql.jdbc.Driver");
		Connection conn = DriverManager.getConnection(this.strConn);
		String strSql = "SELECT * FROM book where book LIKE ? ";
		PreparedStatement pstmt = conn.prepareStatement(strSql);
		pstmt.setString(1,"%" + strName + "%");

		ResultSet rs = pstmt.executeQuery();

		// リストのクリア
		this.albook.clear();

		// 検索結果を取得する。
		while(rs.next()){
			Librarian librarian = new Librarian();
			librarian.setStrBook(rs.getString("book"));
			librarian.setStrDate(rs.getString("date"));
			librarian.setIntType(rs.getInt("type"));
			librarian.setStrWriter(rs.getString("writer"));
			librarian.setStrCompany(rs.getString("company"));
			librarian.setStrRGS_Date(rs.getString("register_date"));
			librarian.setIntStatus(rs.getInt("status"));
			librarian.setIntId(rs.getInt("id"));
			this.albook.add(librarian);
		}
		intCounter=0;

		// クローズ処理
		pstmt.close();
		conn.close();

		return strMessage;
	}

	/**
	 * 返却対象の本の一覧を取得する。
	 * @param intId
	 * @throws Exception
	 */
	public void ReturnList(int intId)throws Exception{

		// DB接続～SQL処理
		Class.forName("com.mysql.jdbc.Driver");
		Connection conn = DriverManager.getConnection(this.strConn);
		String strSql = "SELECT * FROM book WHERE now=?";
		PreparedStatement pstmt = conn.prepareStatement(strSql);
		pstmt.setInt(1,intId);
		ResultSet rs = pstmt.executeQuery();

		// リストのクリア
		this.albook.clear();

		// 結果の取得
		while(rs.next()){
			Librarian librarian = new Librarian();
			librarian.setStrBook(rs.getString("book"));
			librarian.setStrDate(rs.getString("date"));
			librarian.setIntType(rs.getInt("type"));
			librarian.setStrWriter(rs.getString("writer"));
			librarian.setStrCompany(rs.getString("company"));
			librarian.setIntId(rs.getInt("id"));
			this.albook.add(librarian);
		}

		// クローズ処理
		pstmt.close();
		conn.close();

		intCounter=0;
	}

	/**
	 * 返却予定の本の一覧を取得する。
	 * @param id
	 * @throws Exception
	 */
	public void getMyReturnBook(int id)throws Exception{
		Class.forName("com.mysql.jdbc.Driver");
		Connection conn = DriverManager.getConnection(this.strConn);
		String strSql = "SELECT book, datediff(return_book,CURDATE()) as day  from book WHERE now=? and datediff(return_book,CURDATE()) <= 3";
		PreparedStatement pstmt = conn.prepareStatement(strSql);
		pstmt.setInt(1, id);
		ResultSet rs = pstmt.executeQuery();
		while(rs.next()){
			Librarian librarian = new Librarian();
			librarian.setStrBook(rs.getString("book"));
			librarian.setIntDatediff(rs.getInt("day"));
			this.albook.add(librarian);
		}
		rs.close();
		pstmt.close();
		conn.close();
	}

	/**
	 * 取得済の本の数を返す
	 * @return
	 * @throws Exception
	 */
	public int getSize()throws Exception{
		return albook.size();
	}

}

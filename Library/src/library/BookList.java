package library;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;


// �{���Ǘ����郊�X�g
public class BookList {

	// �ڑ���̒萔
	private static final String strConn ="jdbc:mysql://localhost/library"
	+"?user=tenbusuzume&password=1117"
	+"&useUnicode=true&characterEncoding=Windows-31J";

	// �ϐ�
	private ArrayList<Librarian> albook = new ArrayList<Librarian>();
	private int intCounter;

	// �����̖��O
	private String searchName;

	/**
	 * �����̖��O setter
	 * @param strName
	 */
	public void setName(String strName){
		this.searchName=strName;
	}

	/**
	 * �����̖��O getter
	 * @return
	 */
	public String getName(){
		return this.searchName;
	}

	//�����̃W������
	private int searchType;

	/**
	 * �����̃W������ setter
	 * @param intType
	 */
	public void setType(int intType){
		this.searchType=intType;
	}

	/**
	 * �����̃W������ getter
	 * @return
	 */
	public int getType(){
		return this.searchType;
	}

	/**

	 * �{�̈ꗗ���擾����B
	 * @throws Exception
	 */
 	public void Load()throws Exception{

		// DB�ڑ��`SQL�̎��s
		Class.forName("com.mysql.jdbc.Driver");
		Connection conn = DriverManager.getConnection(this.strConn);
		String strSql = "SELECT * FROM book WHERE type>=0";
		PreparedStatement pstmt = conn.prepareStatement(strSql);
		ResultSet rs = pstmt.executeQuery();

		// ���X�g�̃N���A
		this.albook.clear();

		// �擾�����{�����X�g��
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

		// �N���[�Y����
		pstmt.close();
		conn.close();
	}

	/**
	 * ���̗v�f�����邩��Ԃ�
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
	 * ���̗v�f���擾����
	 * @return
	 */
	public Librarian getNext(){
			Librarian librarian = albook.get(this.intCounter);
			this.intCounter++;
			return librarian;
		}

	/**
	 * �{���W���������Ɍ�������B
	 * @param strName,intType
	 * @return
	 * @throws Exception
	 */
	public String search(String strName,int intType)throws Exception{
		String strMessage=null;

		// DB�ڑ��`SQL�̎��s
		Class.forName("com.mysql.jdbc.Driver");
		Connection conn = DriverManager.getConnection(this.strConn);
		String strSql = "SELECT * FROM book WHERE book LIKE ? and type=?";
		PreparedStatement pstmt = conn.prepareStatement(strSql);
		pstmt.setString(1,"%" + strName + "%");
		pstmt.setInt(2,intType);

		ResultSet rs = pstmt.executeQuery();

		// ���X�g�̃N���A
		this.albook.clear();

		// �������ʂ��擾����B
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

		// �N���[�Y����
		pstmt.close();
		conn.close();

		return strMessage;
	}

	/**
	 * �{�����ׂČ�������B
	 * @param strName
	 * @return
	 * @throws
	 */
	public String allSearch(String strName)throws Exception{
		String strMessage=null;

		// DB�ڑ��`SQL�̎��s
		Class.forName("com.mysql.jdbc.Driver");
		Connection conn = DriverManager.getConnection(this.strConn);
		String strSql = "SELECT * FROM book where book LIKE ? ";
		PreparedStatement pstmt = conn.prepareStatement(strSql);
		pstmt.setString(1,"%" + strName + "%");

		ResultSet rs = pstmt.executeQuery();

		// ���X�g�̃N���A
		this.albook.clear();

		// �������ʂ��擾����B
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

		// �N���[�Y����
		pstmt.close();
		conn.close();

		return strMessage;
	}

	/**
	 * �ԋp�Ώۂ̖{�̈ꗗ���擾����B
	 * @param intId
	 * @throws Exception
	 */
	public void ReturnList(int intId)throws Exception{

		// DB�ڑ��`SQL����
		Class.forName("com.mysql.jdbc.Driver");
		Connection conn = DriverManager.getConnection(this.strConn);
		String strSql = "SELECT * FROM book WHERE now=?";
		PreparedStatement pstmt = conn.prepareStatement(strSql);
		pstmt.setInt(1,intId);
		ResultSet rs = pstmt.executeQuery();

		// ���X�g�̃N���A
		this.albook.clear();

		// ���ʂ̎擾
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

		// �N���[�Y����
		pstmt.close();
		conn.close();

		intCounter=0;
	}

	/**
	 * �ԋp�\��̖{�̈ꗗ���擾����B
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
	 * �擾�ς̖{�̐���Ԃ�
	 * @return
	 * @throws Exception
	 */
	public int getSize()throws Exception{
		return albook.size();
	}

}

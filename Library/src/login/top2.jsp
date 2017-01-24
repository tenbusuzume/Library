<%@ page contentType="text/html; charset=Windows-31J"%>
<%@ page import="library.*"%>
<jsp:useBean class="library.Message" id="message" scope="session"/>
<jsp:useBean class="library.User" id="user" scope="session"/>
<jsp:useBean class="library.Librarian" id="librarian" scope="session"/>
<%
String strUser_Id = request.getParameter("user_Id");
String strPassword = request.getParameter("user_password1");
String strMessage = user.Login(strUser_Id,strPassword);
BookList booklist = new BookList();
booklist.Load();

BookList returnBookList = new BookList();
returnBookList.getMyReturnBook(user.getid());

String[] arytype={"小説","漫画","参考書","辞書"};
if(user.getName()==null){
  response.sendRedirect("../login/session_timeout.jsp");
  return;
}
%>
<html>
<head>
<title>図書管理</title>
<link rel="stylesheet" type="text/css" href="../style.css">
  <script type="text/javascript">
  function funcCheck(){
    if(!document.form1.inttype.value==4){
      if(document.form1.search.value==""){
        alert("空白です");
        return false;
    }
    }
  }
  </script>
</head>
<body>
  <h1>図書管理</h1>
  <div style="text-align:left;background-color:#A6E3E9">
    ようこそ、
    <%if(user.getLevel()==2){%>
      管理者】の<%=user.getName()%>さん
    <%}else if(user.getLevel()==1){%>
      【司書】の<%=user.getName()%>さん
    <%}else{%>
      <%=user.getName()%>さん
    <%}%>
    </div>
  <div style="text-align : left; background-color:#A6E3E9">
    <%
      while(returnBookList.hasNext()){
      Librarian returnBook = returnBookList.getNext();
    %>
    <%if(returnBook.getIntDatediff()>=2){%>
      <font color="yellow">
        <%=returnBook.getStrBook()%>は、あと<%=returnBook.getIntDatediff()%>日で返却期限です。<br />
      </font>
    <%}else{%>
    <font color="red">
      <%=returnBook.getStrBook()%>は、あと<%=returnBook.getIntDatediff()%>日で返却期限です。<br />
    </font>
    <%}%>
    <%}%>
  </div>
  <div class="main">
    <h2>図書リスト</h2>
    <table>
    <tr>
      <th>貸出</th>
      <th>本の名前</th>
      <th>著者</th>
      <th>出版社</th>
      <th>出版日</th>
      <th>分類</th>
      <%if(user.getLevel()>=1){%>
        <th>図書館貯蔵日</th>
        <th>編集</th>
      <%}%>
    </tr>
    <%while(booklist.hasNext()){
      Librarian albook = booklist.getNext();
      %>
    <tr>
      <%if(albook.getIntStatus()==0){%>
      <td class="center"><A href="../book/borrow.jsp?id=<%=albook.getIntId()%>">借りる</A></td>
      <%}else{%>
      <td class="center"><input type="button" value="貸出中"></td>
      <%}%>
      <td><%=albook.getStrBook()%></td>
      <td><%=albook.getStrWriter()%></td>
      <td><%=albook.getStrCompany()%></td>
      <td><%=albook.getStrDate()%></td>
      <td><%=arytype[albook.getIntType()]%></td>
      <%if(user.getLevel()>=1){%>
      <td><%=albook.getStrRGS_Date()%></td>
      <td class="center"><A href="../librarian/edit.jsp?id=<%=albook.getIntId()%>">編集</A></td>
      <%}%>
    </tr>
    <%}%>
  </table>
  <form name="form1" method="post" action="../book/search.jsp"
    onsubmit="return funcCheck()">
  <p>
    <%if(user.getLevel()==2){%>
      <A href="../user/list.jsp">ユーザー管理</A>
    <%}%>
    <A href="../book/return.jsp?id=<%=user.getid()%>">返す</A>
    <%if(user.getLevel()>=1){%>
      <A href="../librarian/new.jsp">新規登録</A>
    <%}%>
    <%if(user.getLevel()>=1){%>
    <A href="../book/delete.jsp">削除</A>
    <%}%>
    |
    <select name="inttype"　style="margin-left:100px;">
      <option value="4" selected>すべて
      <option value="0">小説
      <option value="1">漫画
      <option value="2">参考書
      <option value="3">辞書
      </option>
    </select>
    <input type="text" name="search">
    <input type="submit" value="検索">
      <A href="../login/logout.jsp">ログアウト</A>
    </p>
</form>
  </div>
</body>
</html>

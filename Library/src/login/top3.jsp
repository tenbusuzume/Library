<%@ page contentType="text/html; charset=Windows-31J"%>
<%@ page import="library.*"%>
<jsp:useBean class="library.Message" id="message" scope="session"/>
<jsp:useBean class="library.User" id="user" scope="session"/>
<jsp:useBean class="library.Librarian" id="librarian" scope="session"/>
<%
if(user.getName()==null){
  response.sendRedirect("../login/session_timeout.jsp");
  return;
}
BookList booklist = new BookList();
booklist.Load();
String[] arytype={"小説","漫画","参考書","辞書"};
String[] statustype={"○","×"};
%>
<html>
<head>
<title>リスト</title>
<link rel="stylesheet" type="text/css" href="../style.css">
</head>
<body>
  <h1>図書管理</h1>
  <div class="main">
    <h2>図書リスト</h2>
    <table>
    <tr>
      <th>操作</th>
      <th>貸出</th>
      <th>本の名前</th>
      <th>著者</th>
      <th>出版社</th>
      <th>出版日</th>
      <th>分類</th>
      <th>本のID</th>
      <%if(user.getLevel()>=1){%>
        <th>図書館貯蔵日</th>
        <th>編集</th>
      <%}%>
    </tr>
    <%while(booklist.hasNext()){
      Librarian albook = booklist.getNext();
      %>
    <tr>
      <td class="center"><A href="../book/borrow.jsp?id=<%=albook.getIntId()%>">借りる</A></td>
      <td><%=statustype[albook.getIntStatus()]%></td>
      <td><%=albook.getStrBook()%></td>
      <td><%=albook.getStrWriter()%></td>
      <td><%=albook.getStrCompany()%></td>
      <td><%=albook.getStrDate()%></td>
      <td><%=arytype[albook.getIntType()]%></td>
      <td class="center"><%=albook.getIntId()%></td>
      <%if(user.getLevel()>=1){%>
      <td><%=albook.getStrRGS_Date()%></td>
      <td class="center"><A href="../librarian/edit.jsp?id=<%=albook.getIntId()%>">編集</A></td>
      <%}%>
    </tr>
    <%}%>
  </table>
  <p>
    <%if(user.getLevel()==2){%>
      <A href="../user/list.jsp">ユーザー管理</A>
    <%}%>
    <form name="form2" action="../book/return.jsp" method="post">
      <input type="submit" value="返す">
    </form>
    <A href="../librarian/new.jsp">新規登録</A>
    <A href="..librarian/delete.jsp">削除</A>
    <form name="form1" method="get" action="../book/search.jsp">
    <input type="text" name="search" style="margin-left:100px;">
    <input type="submit" value="検索">
  </p>
</form>
  </div>
</body>
</html>

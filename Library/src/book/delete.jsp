<%@ page contentType="text/html; charset=Windows-31J"%>
<%@ page import="library.*"%>
<jsp:useBean class="library.User" id="user" scope="session"/>
<jsp:useBean class="library.Librarian" id="bookEdit" scope="session"/>
<jsp:useBean class="library.Message" id="message" scope="session"/>
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
<title>図書管理</title>
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
      <th>図書館貯蔵日</th>
    </tr>
    <%while(booklist.hasNext()){
      Librarian albook = booklist.getNext();
      %>
    <tr>
      <%if(albook.getIntStatus()==0){%>
      <td class="center"><A href="../book/delete_confirm.jsp?id=<%=albook.getIntId()%>">削除</A></td>
      <%}else{%>
      <td class="center"><input type="button" value="貸出中"></td>
      <%}%>
      <td><%=statustype[albook.getIntStatus()]%></td>
      <td><%=albook.getStrBook()%></td>
      <td><%=albook.getStrWriter()%></td>
      <td><%=albook.getStrCompany()%></td>
      <td><%=albook.getStrDate()%></td>
      <td><%=arytype[albook.getIntType()]%></td>
      <td class="center"><%=albook.getIntId()%></td>
      <td><%=albook.getStrRGS_Date()%></td>
    </tr>
    <%}%>
  </table>
  <p>
    <A href="javascript:history.back()">戻る</A>
  </p>
</form>
  </div>
</body>
</html>

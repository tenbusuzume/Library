<%@ page contentType="text/html; charset=Windows-31J"%>
<%@ page import="library.*"%>
<jsp:useBean class="library.User" id="user" scope="session"/>
<jsp:useBean class="library.Librarian" id="bookEdit" scope="session"/>
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
    <title>貸出リスト</title>
    <link rel="stylesheet" type="text/css" href="../style.css">
  </head>
  <body>
    <h1>貸出リスト</h1>
    <div class="main">
      <table>
        <tr>
          <th>本のID</th>
          <th>本の名前</th>
          <th>著者</th>
          <th>出版社</th>
          <th>出版日</th>
          <th>分類</th>
          <th>貯蔵日</th>
          <th>貸出</th>
        </tr>
        <%while(booklist.hasNext()){
          Librarian albook = booklist.getNext();
          %>
        <tr>
          <td class="center"><%=albook.getIntId()%></td>
          <td><%=albook.getStrBook()%></td>
          <td><%=albook.getStrWriter()%></td>
          <td><%=albook.getStrCompany()%></td>
          <td><%=albook.getStrDate()%></td>
          <td><%=arytype[albook.getIntType()]%></td>
          <td><%=albook.getStrRGS_Date()%></td>
          <td><%=statustype[albook.getIntStatus()]%></td>
        </tr>
        <%}%>
      </table>
      <p>
        <input type="submit" value="借りる">
        <input type="button" value="戻る" onclick="history.back()">
      </p>
    </div>
  </body>
</html>

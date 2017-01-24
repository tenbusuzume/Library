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
String[] arytype={"¬à","æ","Ql","«"};
%>
<html>
<head>
<title>}Ç</title>
<link rel="stylesheet" type="text/css" href="../style.css">
</head>
<body>
  <h1>}Ç</h1>
  <div class="main">
    <h2>}Xg</h2>
    <table>
    <tr>
      <th>{ÌID</th>
      <th>{Ì¼O</th>
      <th>Ò</th>
      <th>oÅÐ</th>
      <th>oÅú</th>
      <th>ªÊ</th>
      <th>ÒW</th>
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
      <td class="center"><A href="edit.jsp?id=<%=albook.getIntId()%>">ÒW</A></td>
    </tr>
    <%}%>
  </table>
  <p>
    <A href="new.jsp">VKo^</A>
    <A href="javascript:history.back()">ßé</A>
    <A href="delete.jsp">í</A>
  </p>
  </div>
</body>
</html>

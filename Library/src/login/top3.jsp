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
String[] statustype={"","~"};
%>
<html>
<head>
<title>Xg</title>
<link rel="stylesheet" type="text/css" href="../style.css">
</head>
<body>
  <h1>}Ç</h1>
  <div class="main">
    <h2>}Xg</h2>
    <table>
    <tr>
      <th>ì</th>
      <th>Ýo</th>
      <th>{Ì¼O</th>
      <th>Ò</th>
      <th>oÅÐ</th>
      <th>oÅú</th>
      <th>ªÞ</th>
      <th>{ÌID</th>
      <%if(user.getLevel()>=1){%>
        <th>}Ù ú</th>
        <th>ÒW</th>
      <%}%>
    </tr>
    <%while(booklist.hasNext()){
      Librarian albook = booklist.getNext();
      %>
    <tr>
      <td class="center"><A href="../book/borrow.jsp?id=<%=albook.getIntId()%>">Øèé</A></td>
      <td><%=statustype[albook.getIntStatus()]%></td>
      <td><%=albook.getStrBook()%></td>
      <td><%=albook.getStrWriter()%></td>
      <td><%=albook.getStrCompany()%></td>
      <td><%=albook.getStrDate()%></td>
      <td><%=arytype[albook.getIntType()]%></td>
      <td class="center"><%=albook.getIntId()%></td>
      <%if(user.getLevel()>=1){%>
      <td><%=albook.getStrRGS_Date()%></td>
      <td class="center"><A href="../librarian/edit.jsp?id=<%=albook.getIntId()%>">ÒW</A></td>
      <%}%>
    </tr>
    <%}%>
  </table>
  <p>
    <%if(user.getLevel()==2){%>
      <A href="../user/list.jsp">[U[Ç</A>
    <%}%>
    <form name="form2" action="../book/return.jsp" method="post">
      <input type="submit" value="Ô·">
    </form>
    <A href="../librarian/new.jsp">VKo^</A>
    <A href="..librarian/delete.jsp">í</A>
    <form name="form1" method="get" action="../book/search.jsp">
    <input type="text" name="search" style="margin-left:100px;">
    <input type="submit" value="õ">
  </p>
</form>
  </div>
</body>
</html>

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
String[] arytype={"¬à","æ","Ql","«"};
String[] statustype={"","~"};
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
      <th>ì</th>
      <th>Ýo</th>
      <th>{Ì¼O</th>
      <th>Ò</th>
      <th>oÅÐ</th>
      <th>oÅú</th>
      <th>ªÞ</th>
      <th>{ÌID</th>
      <th>}Ù ú</th>
    </tr>
    <%while(booklist.hasNext()){
      Librarian albook = booklist.getNext();
      %>
    <tr>
      <%if(albook.getIntStatus()==0){%>
      <td class="center"><A href="../book/delete_confirm.jsp?id=<%=albook.getIntId()%>">í</A></td>
      <%}else{%>
      <td class="center"><input type="button" value="Ýo"></td>
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
    <A href="javascript:history.back()">ßé</A>
  </p>
</form>
  </div>
</body>
</html>

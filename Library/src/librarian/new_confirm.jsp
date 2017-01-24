<%@ page contentType="text/html; charset=Windows-31J"%>
<jsp:useBean class="library.User" id="user" scope="session"/>
<jsp:useBean class="library.Librarian" id="bookEdit" scope="session"/>
<jsp:useBean class="library.Message" id="message" scope="session"/>
<%
if(user.getName()==null){
  response.sendRedirect("../login/session_timeout.jsp");
  return;
}
request.setCharacterEncoding("Windows-31J");
String strBook = request.getParameter("strbook");
String strWriter = request.getParameter("strwriter");
String strCompany = request.getParameter("strcompany");
String strDate = request.getParameter("strdate");
int intType=Integer.parseInt(request.getParameter("inttype"));
int intstatus=0;
bookEdit.setStrBook(strBook);
bookEdit.setStrWriter(strWriter);
bookEdit.setStrCompany(strCompany);
bookEdit.setStrDate(strDate);
bookEdit.setIntType(intType);
bookEdit.setIntStatus(intstatus);
String strMessage=bookEdit.Register();
%>
<html>
  <head>
    <title>}‘“o˜^</title>
    <link rel="stylesheet" type="text/css" href="../style.css">
  </head>
  <body>
    <h1>}‘“o˜^</h1>
    <div class="main">
      <%if(strMessage==null){%>
      “o˜^‚ªŠ®—¹‚µ‚Ü‚µ‚½<br>
      <A href="../login/top2.jsp">ˆê——‚Ö–ß‚é</A>
      <%}else{%>
      <%=strMessage%>
      <A href="javascript:history.back()">–ß‚é</A>
      <%}%>
    </div>
  </body>
</html>

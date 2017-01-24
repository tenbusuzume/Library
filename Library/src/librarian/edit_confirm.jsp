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
String strbook = request.getParameter("strBook");
String strwriter = request.getParameter("strWriter");
String strcompany = request.getParameter("strCompany");
String strdate = request.getParameter("strDate");
String strRGS_date = request.getParameter("strRgs_date");
int inttype = Integer.parseInt(request.getParameter("intType"));
bookEdit.setStrBook(strbook);
bookEdit.setStrWriter(strwriter);
bookEdit.setStrCompany(strcompany);
bookEdit.setStrDate(strdate);
bookEdit.setStrRGS_Date(strRGS_date);
bookEdit.setIntType(inttype);
String strMessage=bookEdit.Update();
%>
<html>
  <head>
    <title>編集結果</title>
    <link rel="stylesheet" type="text/css" href="../style.css">
  </head>
  <body>
    <h1>編集結果</h1>
    <div class="main">
      <%if(strMessage==null){%>
      更新しました<br>
      <A href="../login/top2.jsp">リストに戻る</A>
      <%}else{%>
      <%=strMessage%>
      <A href="javascript:history.back()">戻る</A>
      <%}%>
    </div>
  </body>
</html>

<%@ page contentType="text/html; charset=Windows-31J"%>
<jsp:useBean class="library.User" id="userEdit" scope="page"/>
<%
request.setCharacterEncoding("Windows-31J");
String strUser_Id = request.getParameter("user_Id");
String strName = request.getParameter("user_name");
String strEmail = request.getParameter("user_email");
String strPassword = request.getParameter("user_password1");
int intLevel = Integer.parseInt(request.getParameter("user_level"));
userEdit.setId(strUser_Id);
userEdit.setName(strName);
userEdit.setEmail(strEmail);
userEdit.setLevel(intLevel);
String strMessage=userEdit.Add(strPassword);
%>
<html>
  <head>
    <title>V‹K“o˜^</title>
    <link rel="stylesheet" type="text/css" href="../style.css">
  </head>
  <body>
    <h1>V‹K“o˜^</h1>
    <div class="main">
      <p>
      <%if(strMessage==null){%>
        “o˜^‚ªŠ®—¹‚µ‚Ü‚µ‚½<br />
        <A href="../user/list.jsp">ƒŠƒXƒg‚Ö–ß‚é</A>
      <%}else{%>
      <%=strMessage%><br>
      <A href="javascript:history.back()">–ß‚é</A>
      <%}%>
    </p>
    </div>
  </body>
</html>

<%@ page contentType="text/html; charset=Windows-31J"%>
<jsp:useBean class="library.User" id="user" scope="session"/>
<jsp:useBean class="library.User" id="userEdit" scope="session"/>
<%
if(user.getName()==null){
  response.sendRedirect("../login/session_timeout.jsp");
  return;
}
request.setCharacterEncoding("Windows-31J");
String strId = request.getParameter("id");
int intId = Integer.parseInt(strId);
userEdit.setid(intId);
String strMessage = userEdit.Delete();
%>
<html>
<head>
  <title>削除結果</title>
  <link rel="stylesheet" type="text/css" href="../style.css">
</head>
<body>
  <h1>削除結果</h1>
    <%if(strMessage==null){%>
    削除しました<br>
    <A href="../user/list.jsp">リストへ戻る</A>
    <%}else{%>
    <%=strMessage%>
    <A href="javascript:history.back()">戻る</A>
    <%}%>
  </div>
</body>
</html>

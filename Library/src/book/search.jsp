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
request.setCharacterEncoding("Windows-31J");
String strName = request.getParameter("search");
String strType = request.getParameter("inttype");
int intType = Integer.parseInt(strType);
BookList booklist = new BookList();
booklist.setName(strName);
if(intType==4){
  String strMessage=booklist.allSearch(strName);
}else{
  String strMessage=booklist.search(strName,intType);
}
String[] arytype={"小説","漫画","参考書","辞書"};
%>
<html>
<head>
<title>図書リスト</title>
<link rel="stylesheet" type="text/css" href="../style.css">
</head>
<body>
  <h1>図書リスト</h1>
  <div class="main">
    <h2>検索結果</h2>
    <%if(booklist.getSize()>=1){%>
    <table>
    <tr>
      <th>貸出</th>
      <th>本のID</th>
      <th>本の名前</th>
      <th>著者</th>
      <th>出版社</th>
      <th>出版日</th>
      <th>分類</th>
      <%if(user.getLevel()>=1){%>
        <th>図書館貯蔵日</th>
        <th>編集</th>
      <%}%>
    </tr>
    <%while(booklist.hasNext()){
      Librarian albook = booklist.getNext();
      %>
    <tr>
      <%if(albook.getIntStatus()==0){%>
      <td class="center"><A href="../book/borrow.jsp?id=<%=albook.getIntId()%>">借りる</A></td>
      <%}else{%>
      <td class="center"><input type="button" value="貸出中"></td>
      <%}%>
      <td class="center"><%=albook.getIntId()%></td>
      <td><%=albook.getStrBook()%></td>
      <td><%=albook.getStrWriter()%></td>
      <td><%=albook.getStrCompany()%></td>
      <td><%=albook.getStrDate()%></td>
      <td><%=arytype[albook.getIntType()]%></td>
      <%if(user.getLevel()>=1){%>
      <td><%=albook.getStrRGS_Date()%></td>
      <td class="center"><A href="../librarian/edit.jsp?id=<%=albook.getIntId()%>">編集</A></td>
      <%}%>
    </tr>
    <%}%>
  </table>
  <%}else{%>
  <table>
    <tr>
      <td>
        該当する本はありません。
      </td>
    </tr>
  </table>
    <%}%>
  <p>
    <input type="button" value="戻る" onclick="history.back()">
  </p>
  </div>
</body>
</html>

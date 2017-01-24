<%@ page contentType="text/html; charset=Windows-31J"%>
<jsp:useBean class="library.User" id="user" scope="session"/>
<jsp:useBean class="library.Librarian" id="bookEdit" scope="session"/>
<jsp:useBean class="library.Message" id="message" scope="session"/>
<%
if(user.getName()==null){
  response.sendRedirect("../login/session_timeout.jsp");
  return;
}
String strid = request.getParameter("id");
int intid = Integer.parseInt(strid);
String strMessage = bookEdit.Load(intid);
if(strMessage==null){
  message.setMessage(strMessage);
}
%>
<html>
  <head>
    <title>編集画面</title>
    <link rel="stylesheet" type="text/css" href="../style.css">
      <script type="text/javascript">
      function funcConfirm(){
          if(document.form1.strBook.value==""){
            alert("名前が空白です");
            return false;
          }
          if(document.form1.strWriter.value==""){
            alert("著者が空白です");
            return false;
          }
          if(document.form1.strCompany.value==""){
            alert("出版社が空白です");
            return false;
          }
          if(document.form1.strDate.value==""){
            alert("出版日が空白です");
            return false;
          }
          if(!document.form1.strDate.value.match(/^\d{4}\/\d{2}\/\d{2}$/)){
            alert("出版日の記入が不適切です");
            return false;
          }
          if(document.form1.strRgs_date.value==""){
            alert("貯蔵日が空白です");
            return false;
          }
          if(!document.form1.strRgs_date.value.match(/^\d{4}\-\d{2}\-\d{2}$/)){
            alert("貯蔵日の記入が不適切です");
            return false;
          }
      }
      </script>
  </head>
  <body>
    <h1>編集画面</h1>
    <div class="main">
      <form name="form1" action="edit_confirm.jsp" method="post"
        onsubmit="return funcConfirm()">
        <table>
          <tr>
            <td>名前</td>
            <td><input type="text" name="strBook" size="50"
               value="<%=bookEdit.getStrBook()%>"></td>
          </tr>
          <tr>
            <td>著者</td>
              <td><input type="text" name="strWriter" size="50"
                 value="<%=bookEdit.getStrWriter()%>"></td>
          </tr>
          <tr>
            <td>出版社</td>
              <td><input type="text" name="strCompany" size="50"
                 value="<%=bookEdit.getStrCompany()%>"></td>
          </tr>
          <tr>
            <td>出版日</td>
              <td><input type="text" name="strDate" size="50"
                 value="<%=bookEdit.getStrDate()%>"></td>
          </tr>
          <tr>
            <td>貯蔵日</td>
            <td><input type="text" name="strRgs_date" size="50"
              value="<%=bookEdit.getStrRGS_Date()%>"></td>
            </tr>
          <tr>
            <td>分類</td>
              <td>
                <select name="intType">
                  <option value="0" <%if(bookEdit.getIntType()==0){%>selected<%}%>>小説
                  <option value="1" <%if(bookEdit.getIntType()==1){%>selected<%}%>>漫画
                  <option value="2" <%if(bookEdit.getIntType()==2){%>selected<%}%>>参考書
                  <option value="3" <%if(bookEdit.getIntType()==3){%>selected<%}%>>辞書
                  </option>
                </select>
              </td>
          </tr>
        </table>
        <p>
          <input type="submit" value="送信">
          <input type="button" value="戻る" onclick="history.back()">
        </p>
      </form>
    </div>
  </body>
</html>

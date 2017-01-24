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
    <title>�ҏW���</title>
    <link rel="stylesheet" type="text/css" href="../style.css">
      <script type="text/javascript">
      function funcConfirm(){
          if(document.form1.strBook.value==""){
            alert("���O���󔒂ł�");
            return false;
          }
          if(document.form1.strWriter.value==""){
            alert("���҂��󔒂ł�");
            return false;
          }
          if(document.form1.strCompany.value==""){
            alert("�o�ŎЂ��󔒂ł�");
            return false;
          }
          if(document.form1.strDate.value==""){
            alert("�o�œ����󔒂ł�");
            return false;
          }
          if(!document.form1.strDate.value.match(/^\d{4}\/\d{2}\/\d{2}$/)){
            alert("�o�œ��̋L�����s�K�؂ł�");
            return false;
          }
          if(document.form1.strRgs_date.value==""){
            alert("���������󔒂ł�");
            return false;
          }
          if(!document.form1.strRgs_date.value.match(/^\d{4}\-\d{2}\-\d{2}$/)){
            alert("�������̋L�����s�K�؂ł�");
            return false;
          }
      }
      </script>
  </head>
  <body>
    <h1>�ҏW���</h1>
    <div class="main">
      <form name="form1" action="edit_confirm.jsp" method="post"
        onsubmit="return funcConfirm()">
        <table>
          <tr>
            <td>���O</td>
            <td><input type="text" name="strBook" size="50"
               value="<%=bookEdit.getStrBook()%>"></td>
          </tr>
          <tr>
            <td>����</td>
              <td><input type="text" name="strWriter" size="50"
                 value="<%=bookEdit.getStrWriter()%>"></td>
          </tr>
          <tr>
            <td>�o�Ŏ�</td>
              <td><input type="text" name="strCompany" size="50"
                 value="<%=bookEdit.getStrCompany()%>"></td>
          </tr>
          <tr>
            <td>�o�œ�</td>
              <td><input type="text" name="strDate" size="50"
                 value="<%=bookEdit.getStrDate()%>"></td>
          </tr>
          <tr>
            <td>������</td>
            <td><input type="text" name="strRgs_date" size="50"
              value="<%=bookEdit.getStrRGS_Date()%>"></td>
            </tr>
          <tr>
            <td>����</td>
              <td>
                <select name="intType">
                  <option value="0" <%if(bookEdit.getIntType()==0){%>selected<%}%>>����
                  <option value="1" <%if(bookEdit.getIntType()==1){%>selected<%}%>>����
                  <option value="2" <%if(bookEdit.getIntType()==2){%>selected<%}%>>�Q�l��
                  <option value="3" <%if(bookEdit.getIntType()==3){%>selected<%}%>>����
                  </option>
                </select>
              </td>
          </tr>
        </table>
        <p>
          <input type="submit" value="���M">
          <input type="button" value="�߂�" onclick="history.back()">
        </p>
      </form>
    </div>
  </body>
</html>

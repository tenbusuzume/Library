<%@ page contentType="text/html; charset=Windows-31J"%>
<jsp:useBean class="library.User" id="user" scope="session"/>
<jsp:useBean class="library.Message" id="message" scope="session"/>
<%
if(user.getName()==null){
  response.sendRedirect("../login/session_timeout.jsp");
  return;
}
%>
<html>
  <head>
    <title>�}���̐V�K�o�^</title>
    <link rel="stylesheet" type="text/css" href="../style.css">
      <script type="text/javascript">
      function funcConfirm(){
        if(document.form1.strbook.value==""){
          alert("���O���󔒂ł�");
          return false;
        }
        if(document.form1.strwriter.value==""){
          alert("���҂��󔒂ł�");
          return false;
        }
        if(document.form1.strcompany.value==""){
          alert("�o�ŎЂ��󔒂ł�");
          return false;
        }
        if(!document.form1.strdate.value.match(/^\d{4}\/\d{2}\/\d{2}$/)){
          alert("�o�œ��̋L�����s�K�؂ł�");
          return false;
        }
      }
      </script>
  </head>
  <body>
    <h1>�}���̐V�K�o�^</h1>
    <div class="main">
      <form name="form1" action="new_confirm.jsp" method="post"
         onsubmit="return funcConfirm()">
      <table>
        <tr>
          <td>���O</td>
          <td><input type="text" name="strbook" size="60"></td>
        </tr>
        <tr>
          <td>����</td>
          <td><input type="text" name="strwriter" size="60"></td>
        </tr>
        <tr>
          <td>�o�Ŏ�</td>
          <td><input type="text" name="strcompany" size="60"></td>
        </tr>
        <tr>
          <td>�o�œ�</td>
          <td><input type="text" name="strdate" size="60"></td>
        </tr>
        <tr>
          <td>����</td>
          <td>
          <select name="inttype">
            <option value="1" selected>���ޑI��
            <option value="1">����
            <option value="2">����
            <option value="3">�Q�l��
            <option value="4">����
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

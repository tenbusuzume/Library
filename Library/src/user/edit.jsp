<%@ page contentType="text/html; charset=Windows-31J"%>
<jsp:useBean class="library.User" id="user" scope="session"/>
<jsp:useBean class="library.User" id="userEdit" scope="session"/>
<jsp:useBean class="library.Message" id="message" scope="session"/>
<%
 if(user.getName()==null){
   response.sendRedirect("../login/session_timeout.jsp");
   return;
  }
  String strUserId = request.getParameter("id");
  int intUserId = Integer.parseInt(strUserId);
  String strMessage = userEdit.Load(intUserId);
  if(strMessage!=null){
    message.setMessage(strMessage);
    response.sendRedirect("error.jsp");
  }
  %>
  <html>
    <head>
      <title>���[�U�[�Ǘ�</title>
      <link rel="stylesheet" type="text/css" href="../style.css">
        <script type="text/javascript">
        function funcConfirm(){
          if(!document.form1.strUser_Id.value.match(/^[A-Za-z0-9]+$/)){
            alert("ID�͔��p�p�����œ��͂��Ă�������");
            return false;
          }
          if(document.form1.strName.value==""){
            alert("���������͂���Ă��܂���");
            return false;
          }
          if(!document.form1.strEmail.value.match(/^[A-Za-z0-9@\.]+$/)){
            alert("Email�͔��p�p�����œ��͂��Ă�������");
            return false;
          }
          if(document.form1.password1.value!=document.form1.password2.value){
            alert("�p�X���[�h����v���܂���")
            return false;
          }
        }
        function funcPasswordChange(){
          if(document.form1.password_change.checked==true){
            document.form1.password1.disabled=false;
            document.form1.password1.value="";
            document.form1.password2.disabled=false;
            document.form1.password2.value="";
          }else{
            document.form1.password1.disabled=true;
            document.form1.password1.value="*******";
            document.form1.password2.disabled=true;
            document.form1.password2.value="*******";
          }
        }
        function funcDelete(){
          if(confirm("�폜���܂��B��낵���ł����H")){
            location.href="delete.jsp";
          }
        }
        </script>
    </head>
    <body>
      <h1>���[�U�[�Ǘ�</h1>
    
      <div class="main">
        <h2>���[�U�[�ҏW</h2>
        <form name="form1" action="update.jsp" method="post" onsubmit="return funcConfirm()">
          <table>
            <tr>
              <td>ID</td>
              <td><input type="text" name="strUser_Id" size="20" value="<%=userEdit.getId()%>"</td>
            </tr>
            <tr>
              <td>����</td>
              <td><input type="text" name="strUser_Name" size="20" value="<%=userEdit.getName()%>"</td>
            </tr>
            <tr>
              <td>Email</td>
              <td><input type="text" name="strUser_Email" size="20" value="<%=userEdit.getEmail()%>"</td>
            </tr>
            <tr>
              <td>���[�U�[���x��</td>
              <td>
                <select name="user_level">
                <option value="0" <%if(userEdit.getLevel()==0){%>selected<%}%>>���p��
                <option value="1" <%if(userEdit.getLevel()==1){%>selected<%}%>>�i��
                <option value="2" <%if(userEdit.getLevel()==2){%>selected<%}%>>�V�X�e���Ǘ���
                </select>
              </td>
            </tr>
          </table>
          <br>
            <table>
              <tr>
                <td colspan="2">
                  <input type="checkbox" name="password_change" onclick="funcPasswordChange()">
                    �p�X���[�h��ύX
                </td>
              </tr>
              <tr>
                <td>�p�X���[�h</td>
                <td><input type="password" name="password1" size="20"
                  value="*******" disable></td>
              </tr>
              <tr>
                <td>�p�X���[�h�i�m�F�j</td>
                <td><input type="password" name="password2" size="20"
                  value="*******" disable></td>
              </tr>
            </table>
            <p>
              <input type="submit" value="���M">
              <input type="button" value="�߂�" onclick="history.back()">
              <input type="button" value="�폜" onclick="funcDelete()">
            </p>
        </form>
      </div>
    </body>
  </html>

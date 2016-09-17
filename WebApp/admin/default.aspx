<%@ Page language="c#" Codebehind="default.aspx.cs" AutoEventWireup="false" Inherits="WebApp.admin._default" %>

<html>
<head>
<title>Auction Admin: Control Panel</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<style type="text/css">
<!--
.copy_sm_bold_wh {  font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 8pt; font-weight: bolder; color: #FFFFFF}
.copy_smlr_bold_wh { font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 7pt; font-weight: bolder; color: #FFFFFF }
.copy_sm_bold_bl { font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 8pt; font-weight: bolder; color: #666666}
-->
</style>
</head>

<body bgcolor="#D5DDE5" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0" link="#FFFFFF">
<span class="copy_sm_bold_bl"></span> 
<table width="698" border="0" cellspacing="0" cellpadding="0" align="center">
  <tr> 
    <td> 
      <table width="600" border="0" cellspacing="0" cellpadding="0" bgcolor="#000000">
        <tr> 
          <td bgcolor="#000000" valign="top"> <img src="../images/splash_01.gif" width="309" height="61"> 
            <table width="100%" border="0" cellspacing="0" cellpadding="0" bgcolor="#000000">
              <tr> 
                <td> 
                  <table width="100%" border="0" cellpadding="10">
                    <tr> 
                      <td><font color="#FFFFFF" class="copy_sm_bold_wh"><asp:label id="lblTimeLeft" runat="server"/><br>
                        <asp:label id="lblVesselsAtSea" runat="server"/> vessels at sea </font></td>
                    </tr>
                  </table>
                </td>
              </tr>
            </table>
          </td>
          <td bgcolor="#000000" valign="top"><img src="../images/splash_02.gif" width="391" height="123"></td>
        </tr>
      </table>
    </td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td> 
      <table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr> 
          <td>
            <table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td><img src="../images/splash_admin_04.gif" width="529" height="127"></td>
              </tr>
              <tr>
                <td><img src="../images/splash_admin_06.gif" width="529" height="141"></td>
              </tr>
              <tr>
                <td><img src="../images/splash_admin_07.gif" width="529" height="109"></td>
              </tr>
            </table>
          </td>
          <td width="183" bgcolor="666666" valign="top" align="center"> 
            <table width="100%" border="0" cellspacing="0" cellpadding="10">
              <tr align="center"> 
                <td> <span class="copy_sm_bold_wh"><font color="#FFFFFF" class="copy_sm_bold_wh"><span class="copy_sm_bold_wh"><asp:label id="lblToday" runat="server"/><br>
                  <br>
                  Operator Log-in:</span><br>
                  </font></span> 
                  <form method="post" action="" runat="server">
                    <table width="100%" border="0" cellspacing="0" cellpadding="0">
                      <tr align="center"> 
                        <td> <span class="copy_sm_bold_wh">Username:</span><br>
                          <asp:textbox id="tbUsername" runat="server" maxlength="20" size="12"/>
                          <asp:requiredfieldvalidator runat="server"
                                                      errormessage="*"
                                                      controltovalidate="tbUsername"
                                                      display="Static"
                                                      enableclientscript="True"/>
                        </td>
                      </tr>
                      <tr align="center"> 
                        <td> <span class="copy_sm_bold_wh">Password:</span><br>
                          <asp:textbox id="tbPassword" runat="server" textmode="Password" maxlength="20" size="12"/>
                          <asp:requiredfieldvalidator runat="server"
                                                      errormessage="*"
                                                      controltovalidate="tbPassword"
                                                      display="Static"
                                                      enableclientscript="True"/>                          
                        </td>
                      </tr>
                      <tr align="center"> 
                        <td> 
                          <asp:button id="btnSubmit" runat="server" text="Submit"/>
                        </td>
                      </tr>
                      <asp:label id="lblErrorMsg" runat="server">
                        <tr><td>
                        <font size="2" color="Red">
                        Invalid username/password, please try again
                        </font>
                        </td></tr>
                      </asp:label>

                    </table>
                  </form>
                  <span class="copy_sm_bold_wh"><font color="#FFFFFF" class="copy_sm_bold_wh"><br>
                  <br>
                  </font></span> </td>
              </tr>
            </table>              
            </td>
        </tr>
      </table>
    </td>
  </tr>
  <tr bgcolor="#999999"> 
    <td>&nbsp;</td>
  </tr>
</table>
</body>
</html>

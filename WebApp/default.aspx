<%@ Page language="c#" Codebehind="default.aspx.cs" AutoEventWireup="false" Inherits="WebApp._default" %>
<html>
<head>
<title>Live Fish Auction: Borealis Trading Inc.</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<link rel="stylesheet" href="/styles.css">
<style type="text/css">
<!--
-->
</style>
</head>

<body bgcolor="D5DDE5" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0" link="#FFFFFF" vlink="#FFFFFF" alink="#FFFFFF">
<table width="698" border="0" cellspacing="0" cellpadding="0" align="center">
  <tr> 
    <td> 
      <table width="600" border="0" cellspacing="0" cellpadding="0" bgcolor="#000000">
        <tr> 
          <td bgcolor="#000000" valign="top"> <img src="/images/splash_01.gif" width="309" height="61"> 
            <table width="100%" border="0" cellspacing="0" cellpadding="0" bgcolor="#000000">
              <tr> 
                <td> 
                  <table width="100%" border="0" cellpadding="10">
                    <tr> 
                      <td><font color="#FFFFFF" class="copy_sm_bold_wh">
                        <asp:Label ID="lblTimeLeft" Runat="server"/><br>
                        <asp:Label ID="lblLiveAuctions" Runat="server"/> current live auctions</font></td>
                    </tr>
                  </table>
                </td>
              </tr>
            </table>
          </td>
          <td bgcolor="#000000" valign="top"><img src="/images/splash_02.gif" width="391" height="123"></td>
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
                <td><img src="/images/splash_2_04.gif" width="529" height="127"></td>
              </tr>
              <tr>
                <td><img src="/images/splash_2_06.gif" width="529" height="141"></td>
              </tr>
              <tr>
                <td><img src="/images/splash_2_07.gif" width="529" height="109"></td>
              </tr>
            </table>
          </td>
          <td width="183" bgcolor="666666" valign="top"> 
            <table width="100%" border="0" cellspacing="0" cellpadding="10">
              <tr align="center"> 
                <td> <span class="copy_sm_bold_wh"><font color="#FFFFFF" class="copy_sm_bold_wh"><span class="copy_sm_bold_wh"> 
                  <asp:Label ID="lblToday" Runat="server"/></span> <br>
                  <br>
                  </font></span> 
                  <form method="post" action="" runat="server">
                    <table width="100%" border="0" cellspacing="0" cellpadding="0">
                      <tr align="center"> 
                        <td> <span class="copy_sm_bold_wh">Username:</span><br>
                          <asp:textbox id="tbUsername" runat="server" size="12"/>
                          <asp:requiredfieldvalidator id="reqUsername"
                                                    runat="server"
                                                    enableclientscript="True"
                                                    errormessage="*"
                                                    display="Dynamic"
                                                    controltovalidate="tbUsername"/>
                          
                        </td>
                      </tr>
                      <tr align="center"> 
                        <td> <span class="copy_sm_bold_wh">Password:</span><br>
                          <asp:textbox id="tbPassword" textmode="Password" runat="server" size="12"/>
                          <asp:requiredfieldvalidator id="reqPassword"
                                                    runat="server"
                                                    enableclientscript="True"
                                                    errormessage="*"
                                                    display="Dynamic"
                                                    controltovalidate="tbPassword"/>
                          
                        </td>
                      </tr>
                      <tr align="center"> 
                        <td> 
                          <asp:button runat="server" text="Submit"/>
                        </td>
                      </tr>
                      <asp:label id="lblErrorMsg" runat="server">
                      <tr align="center">
                        <td colspan="2">
                        <font size="2" color="Red">
                        Invalid username/password, please try again
                        </font>
                        </td>
                      </tr>
                      </asp:label>                            
                    </table>
                  </form>
                </td>
              </tr>
              <tr align="left"> 
                <td class="copy_sm_bold_wh">

<table cellpadding="5"><TR><TD class="copy_sm_bold_wh">

Welcome to shrimpauction.ca. You must have a minimum of Internet Explorer 6.0 to use this site. <a href="http://www.microsoft.com/downloads/details.aspx?FamilyID=1e1550cb-5e5d-48f5-b02b-20b602228de6&amp;DisplayLang=en" target="_blank">Download your free copy here</a>.</td>

</td></tr></table>
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

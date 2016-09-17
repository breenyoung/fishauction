<%@ Page language="c#" Codebehind="default.aspx.cs" AutoEventWireup="false" Inherits="WebApp.admin.dayactivity._default" %>
<% if(!IsPostBack) { %>
<!doctype html public "-//w3c//dtd html 4.0 transitional//en" > 
<html>

  <head>
    <title>Daily Report</title>
    <meta name="GENERATOR" Content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" Content="C#">
    <meta name=vs_defaultClientScript content="JavaScript">
    <meta name=vs_targetSchema content="http://schemas.microsoft.com/intellisense/ie5">

<link rel="stylesheet" href="../styles.css">

  </head>

<body bgcolor="#D5DDE5" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0" MS_POSITIONING="FlowLayout">
<span class="copy_sm_bold_bl"></span> 
<table width="698" border="0" cellspacing="0" cellpadding="0" align="center">
  <tr> 
    <td> 
      <table width="600" border="0" cellspacing="0" cellpadding="0" bgcolor="#000000">
        <tr> 
          <td bgcolor="#000000" valign="top"> <img src="../../images/splash_01.gif" width="309" height="61"> 
            <table width="100%" border="0" cellspacing="0" cellpadding="0" bgcolor="#000000">
              <tr> 
                <td> 
                  <table width="100%" border="0" cellpadding="10">
                    <tr> 
                      <td><font color="#FFFFFF" class="copy_sm_bold_wh"> <span class="copy_lg_bold_ylCopy2">auction 
                        clerk operator panel</span></font></td>
                    </tr>
                  </table>
                </td>
              </tr>
            </table>
          </td>
          <td bgcolor="#000000" valign="top"><img src="../../images/splash_02.gif" width="391" height="123"></td>
        </tr>
        <tr> 
          <td bgcolor="#000000" valign="top" colspan="2"><img src="../../images/splash_04.gif" width="698" height="5"></td>
        </tr>
      </table>
    </td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td> 
      <table width="100%" border="0" cellspacing="0" cellpadding="0">

        <tr> 
          <td valign="top">

              <table width="100%" border="0" cellspacing="0" cellpadding="0">
                <tr> 
                  <td colspan="3" valign="top">
                    <table width="100%" border="0" cellspacing="0" cellpadding="0">
                      <tr> 
                        <td width="139" bgcolor="468093" class="copy_lg_bold_ylCopy2"> 
                          <table width="100%" border="0" cellspacing="0" cellpadding="10">
                            <tr align="center"> 
                              <td class="copy_lg_bold_ylCopy2">Download Data</td>
                            </tr>
                          </table>
                        </td>
                        <td class="copy_sm_bold_wh" bgcolor="#FFFFFF" width="1"><img src="../../images/spacer.gif" width="1" height="1"></td>
                        <td class="copy_sm_bold_wh" bgcolor="468093" width="375"> 
                          <table width="100%" border="0" cellspacing="0" cellpadding="10" class="copy_sm_bold_wh">
                            <tr> 
                              <td>Download daiy auction data packet for offline 
                                processing. </td>
                            </tr>
                          </table>
                        </td>
                      </tr>
                    </table>
                  </td>
                </tr>
                <tr> 
                  <td width="257" valign="top"> 
                    <table width="95%" border="0" cellspacing="0" cellpadding="0">
                      <tr> 
                        <td> 
                          <table width="100%" border="0" cellspacing="0" cellpadding="10">
                            <tr valign="top"> 
                              <td class="copy_sm_bold_gr" align="center"><BR><BR>

<form id="Form1" method="post" runat="server">
		<asp:Button ID="btnSubmit" Runat="server" Text="Download daily activity file"/>
		<asp:label id="lblNoReport" runat="server">
		<br>No reports at this time
		</asp:label>
     </form>

<BR><BR></td>
                            </tr>
                          </table>
                        </td>
                      </tr>
                    </table>
                  </td>
                  <td bgcolor="#000000" width="1"><img src="../../images/spacer.gif" width="1" height="10"></td>
                  <td width="257" valign="top">&nbsp; </td>
                </tr>
              </table>
                
          </td>
          <td width="183" bgcolor="666666" valign="top">&nbsp; </td>
        </tr>
      </table>
</td>
  </tr>
  <tr bgcolor="#999999"> 
    <td>

<table width="100%" border="0" cellspacing="0" cellpadding="10">
  <tr align="right"> 
    <td><span class="copy_sm_bold_wh"><a href="../index_panel_op.asp">Main</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a href="/admin/logout.asp">Log Out</a></span></td>
  </tr>
</table>


</table>
</body>
</html>


<% } %>
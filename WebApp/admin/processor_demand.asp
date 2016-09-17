<%@ Language = "VBScript"%>
<!--#include file="auth.asp"-->
<%

response.buffer = true

'---- CursorTypeEnum Values ----
Const adOpenForwardOnly = 0
Const adOpenKeyset = 1
Const adOpenDynamic = 2
Const adOpenStatic = 3
'---- LockTypeEnum Values ----
Const adLockReadOnly = 1
Const adLockPessimistic = 2
Const adLockOptimistic = 3
Const adLockBatchOptimistic = 4
'---- CommandTypeEnum Values ----
Const adCmdUnknown = &H0008
Const adCmdText = &H0001
Const adCmdTable = &H0002
Const adCmdStoredProc = &H0004
Const adCmdFile = &H0100
Const adCmdTableDirect = &H0200

%>

<html>
<head>
<title>Auction Admin: Control Panel</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<link rel="stylesheet" href="styles.css">
</head>

<body bgcolor="#D5DDE5" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
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
                      <td><font color="#FFFFFF" class="copy_sm_bold_wh"> <span class="copy_lg_bold_ylCopy2">auction 
                        clerk operator panel</span><br>
                        auction day expires in: 2:38 hours <br>
                        101 vessels at sea </font></td>
                    </tr>
                  </table>
                </td>
              </tr>
            </table>
          </td>
          <td bgcolor="#000000" valign="top"><img src="../images/splash_02.gif" width="391" height="123"></td>
        </tr>
        <tr> 
          <td bgcolor="#000000" valign="top" colspan="2"><img src="../images/splash_04.gif" width="698" height="5"></td>
        </tr>
      </table>
    </td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td>

<form method="post" action="adds_proc.asp">
<input type="hidden" name="Proc" value="UpdateDemand">

        <table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr> 
          <td valign="top"> 
              <table width="100%" border="0" cellspacing="0" cellpadding="0">
                <tr> 
                  <td colspan="3" valign="top"> 
                    <table width="100%" border="0" cellspacing="0" cellpadding="0">
                      <tr> 
                        <td colspan="3" valign="top"> 
                          <table width="100%" border="0" cellspacing="0" cellpadding="0">
                            <tr> 
                              <td width="139" bgcolor="468093" class="copy_lg_bold_ylCopy2"> 
                                <table width="100%" border="0" cellspacing="0" cellpadding="10">
                                  <tr align="center"> 
                                    <td class="copy_lg_bold_ylCopy2">update processor 
                                      demand </td>
                                  </tr>
                                </table>
                              </td>
                              <td class="copy_sm_bold_wh" bgcolor="#FFFFFF" width="1"><img src="../images/spacer.gif" width="1" height="1"></td>
                              <td class="copy_sm_bold_wh" bgcolor="468093" width="375"> 
                                <table width="100%" border="0" cellspacing="0" cellpadding="10" class="copy_sm_bold_wh">
                                  <tr> 
                                    <td>Update data as it appears on form on a 
                                      weekly basis.</td>
                                  </tr>
                                </table>
                              </td>
                            </tr>
                          </table>
                    </table>
                  </td>
                </tr>
                <tr> 
                  <td colspan="3" valign="top">
                    <table width="100%" border="0" cellspacing="0" cellpadding="20">
                      <tr valign="top"> 
                        <td> 
                          <table width="100%" border="0" cellspacing="0" cellpadding="10">
                            <tr bgcolor="#E9F3F3"> 
                              <td colspan="3" class="copy_sm_bold_bl">Processor 
                                Production Demand:</td>
                            </tr>

<%

<!--#INCLUDE VIRTUAL="/include/adovbs.inc"-->

set openConnection = Server.CreateObject("ADODB.Connection")
openConnection.Open "DSN=fishauction_sqlConn;uid=fishauction;pwd=tavel2004"

SQL = "ProcessorsGetAll"
set rs = openConnection.Execute (SQL, 4)


rs.movefirst

do while not rs.eof

response.write "<tr>"
response.write "<td class='copy_sm_bold_bl' width='40%'>" & rs("name") & "</td>"

response.write "<td class='copy_sm_bold_gr' width='40%'>" & rs("location") & "</td>"

response.write "<td class='copy_sm_bold_bl' width='20%'>"
response.write "<input type='text' name='demand' maxlength='7' size='10' value='" & rs("demand") & "'>"
response.write "<input type='hidden' name='id' value='" & rs("id") & "'>"
response.write "</td>"
response.write "</tr>"

rs.movenext

loop

OpenConnection.close
set openConnection=nothing
set rs=nothing


%>

                           
                           
                            <tr> 
                              <td class="copy_sm_bold_bl" width='40%'>&nbsp;</td>
<td class="copy_sm_bold_bl" width='40%'>&nbsp;</td>
                              <td class="copy_sm_bold_bl" width='20%'> 
                                <input type="submit" name="Submit" value="Update Records">
                              </td>
                            </tr>
                          </table>
                        </td>
                      </tr>
                    </table>
                  </td>
                </tr>
              </table>
          </td>
            <td width="183" bgcolor="666666" valign="top">&nbsp; </td>
        </tr>
      </table>
</form>
    </td>
  </tr>
  <tr bgcolor="#999999"> 
    <td><!--#include file="admin_footer_include.asp" --></td>
  </tr>
</table>
</body>
</html>

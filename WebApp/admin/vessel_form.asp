
<%@ Language = "VBScript"%>
<!--#include file="auth.asp"-->

<%

response.buffer = true

'Declare all variables
dim rs
dim sql
dim strconn


Const adOpenKeyset = 1
Const adLockOptimistic = 3
Const adCmdTable = &H0002
CONST ForReading=1	



%>

<html>
<head>
<title>Auction Admin: Control Panel</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<link rel="stylesheet" href="styles.css">
</head>

<body bgcolor="#E9E9D1" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
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
                        clerk operator panel</span>
                         </font></td>
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

<form method="post" action="adds_proc.asp">
<input type='hidden' name='Proc' value='AddVessel'>


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
                                    <td class="copy_lg_bold_ylCopy2">add new vessel: 
                                    </td>
                                  </tr>
                                </table>
                              </td>
                              <td class="copy_sm_bold_wh" bgcolor="#FFFFFF" width="1"><img src="../images/spacer.gif" width="1" height="1"></td>
                              <td class="copy_sm_bold_wh" bgcolor="468093" width="375"> 
                                <table width="100%" border="0" cellspacing="0" cellpadding="10" class="copy_sm_bold_wh">
                                  <tr> 
                                    <td>Use this Form to Add a Vessel to the Auction</td>
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
                            <tr bgcolor="F5F5CF"> 
                              <td class="copy_sm_bold_bl">Vessel Name:</td>
                              <td class="copy_sm_bold_bl"> 
                                <input type="text" name="name">
                              </td>
                            </tr>
                            <tr bgcolor="#FFFFFF"> 
                              <td class="copy_sm_bold_bl">Vessel CFV:</td>
                              <td class="copy_sm_bold_bl"> 
                                <input type="text" name="cfv" maxlength="9">
                              </td>
                            </tr>
                            <tr bgcolor="F5F5CF"> 
                              <td class="copy_sm_bold_bl">Vessel Captain:</td>
                              <td class="copy_sm_bold_bl"> 
                                <input type="text" name="captain">
                              </td>
                            </tr>
                            <tr bgcolor="#FFFFFF"> 
                              <td class="copy_sm_bold_bl">Phone 1:</td>
                              <td class="copy_sm_bold_bl"> 
                                <input type="text" name="phone1" maxlength="15">
                              </td>
                            </tr>
                            <tr bgcolor="F5F5CF"> 
                              <td class="copy_sm_bold_bl">Phone 2:</td>
                              <td class="copy_sm_bold_bl"> 
                                <input type="text" name="phone2" maxlength="15">
                              </td>
                            </tr>
                            <tr bgcolor="#FFFFFF"> 
                              <td class="copy_sm_bold_bl">Phone 3:</td>
                              <td class="copy_sm_bold_bl"> 
                                <input type="text" name="phone3" maxlength="15">
                              </td>
                            </tr>
                            <tr bgcolor="F5F5CF"> 
                              <td class="copy_sm_bold_bl">Email 1:</td>
                              <td class="copy_sm_bold_bl"> 
                                <input type="text" name="email">
                              </td>
                            </tr>
                            <tr bgcolor="#FFFFFF"> 
                              <td class="copy_sm_bold_bl">Email 2:</td>
                              <td class="copy_sm_bold_bl"> 
                                <input type="text" name="email2">
                              </td>
                            </tr>
                            <tr bgcolor="F5F5CF"> 
                              <td class="copy_sm_bold_bl">Email 3:</td>
                              <td class="copy_sm_bold_bl"> 
                                <input type="text" name="email3">
                              </td>
                            </tr>
                            <tr bgcolor="#FFFFFF"> 
                              <td class="copy_sm_bold_bl">Vessel Capacity:</td>
                              <td class="copy_sm_bold_bl"> 
                                <input type="text" name="capacity" maxlength="10">
                              </td>
                            </tr>
                            <tr bgcolor="F5F5CF"> 
                              <td class="copy_sm_bold_bl">Vessel Stowage Method:</td>
                              <td class="copy_sm_bold_bl"> 
                                <select name="vessel_stow">
                                  <option value="0" selected>Select Stowage</option>
                                  <%

ThisAction = Request.Querystring("Action")

' calling stored proc (sp) for all stowage records (stowagegetall)

<!--#INCLUDE VIRTUAL="/include/adovbs.inc"-->

set openConnection = Server.CreateObject("ADODB.Connection")
openConnection.Open "DSN=fishauction_sqlConn;uid=fishauction;pwd=tavel2004"

Select Case ThisAction

Case "add"

SQL = "stowagegetall"
set rs = openConnection.Execute (SQL, 4)

rs.MoveFirst

do while not rs.eof

response.write "<option value='" & rs("id") & "'>" & rs("name") & "</option>"

rs.movenext

loop

set rs=nothing

end select


%> 
                                </select>
                              </td>
                            </tr>
                            <tr> 
                              <td class="copy_sm_bold_bl">&nbsp;</td>
                              <td class="copy_sm_bold_bl"> 
                                <input type="submit" name="Submit" value="Submit">
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
            <td width="183" bgcolor="666666" valign="top"><img src="../images/spacer.gif" width="183" height="1"> 
            </td>
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

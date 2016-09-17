<!--#include file="auth.asp"-->

<html>
<head>
<title>Auction Admin: Control Panel</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<link rel="stylesheet" href="styles.css">
</head>

<body bgcolor="#D5DDE5" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
<form method="post" action="vessel_in_2.asp">
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
                        clerk operator panel</span></font></td>
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
                                    <td class="copy_lg_bold_ylCopy2">vessel hail 
                                      in:<br>
                                    Step 1</td>
                                </tr>
                              </table>
                            </td>
                            <td class="copy_sm_bold_wh" bgcolor="#FFFFFF" width="1"><img src="../images/spacer.gif" width="1" height="1"></td>
                            <td class="copy_sm_bold_wh" bgcolor="468093" width="375"> 
                              <table width="100%" border="0" cellspacing="0" cellpadding="10" class="copy_sm_bold_wh">
                                <tr> 
                                  <td>Identify Vessel</td>
                                </tr>
                              </table>
                            </td>
                          </tr>
                        </table>
                  </table>
                </td>
              </tr>
              <tr> 
                <td width="257" valign="top"> 
                  <table width="95%" border="0" cellspacing="0" cellpadding="0">
                    <tr> 
                      <td> 
                        <table width="100%" border="0" cellspacing="0" cellpadding="10">
                          <tr> 
                            <td class="copy_sm_bold_bl"> 


                                <table width="100%" border="0" cellspacing="0" cellpadding="10">
                                  <tr bgcolor="F5F5CF"> 
                                    <td class="copy_sm_bold_bl">Enter Transaction#: 
                                    </td>
                                  </tr>
                                  <tr> 
                                    <td> 
                                      <table width="100%" border="0" cellspacing="0" cellpadding="3">
                                        <tr> 
                                          <td width="77%"> 
                                            <input type="text" name="form_tid" maxlength="6">
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
                    </tr>
                  </table>
                    <br>
                  </td>
                <td bgcolor="#000000" width="1"><img src="../images/spacer.gif" width="1" height="10"></td>
                <td width="257" valign="top"> 
                  <table width="100%" border="0" cellspacing="0" cellpadding="10" class="copy_sm_bold_bl">
                      <tr valign="top" align="right"> 
                        <td> 
                          <table width="100%" border="0" cellspacing="0" cellpadding="10">
                            <tr bgcolor="#E9F3F3"> 
                              <td class="copy_sm_bold_bl">OR: Select a Vessel 
                                by Name:</td>
                            </tr>
                            <tr> 
                              <td> 
                                <table width="100%" border="0" cellspacing="0" cellpadding="3">
                                  <tr> 
                                    <td width="94%"> 
                                      <select name="form_vid">
                                        <option value="0" selected>Select Vessel 
                                        From List</option>
                                        <%

ThisAction = Request.Querystring("Action")

' calling stored proc (sp) for all stowage records (stowagegetall)

<!--#INCLUDE VIRTUAL="/include/adovbs.inc"-->

set openConnection = Server.CreateObject("ADODB.Connection")
openConnection.Open "DSN=fishauction_sqlConn;uid=fishauction;pwd=tavel2004"

SQL = "VesselGetActive"
set rs = openConnection.Execute (SQL, 4)


if rs.eof and rs.bof then 

response.write "</select><BR><span class='copy_sm_bold_bl'>There are no active vessels.</span>"

else 
rs.MoveFirst

do while not rs.eof

response.write "<option value='" & rs("id") & "'>" & rs("name") & "</option>"


rs.movenext

loop

end if

response.write "</select>"
set rs=nothing


%> 
                                      </select>
                                    </td>
                                    <td width="94%">&nbsp; </td>
                                  </tr>
                                </table>
                              </td>
                            </tr>
                          </table>



                          <br>
                          <input type="submit" name="Submit32" value="Submit">
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
    </td>
  </tr>
  <tr bgcolor="#999999"> 
    <td><!--#include file="admin_footer_include.asp" --></td>
  </tr>
</table>
</form>
</body>
</html>

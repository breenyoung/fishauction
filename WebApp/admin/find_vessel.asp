<html>
<head>
<title>Auction Admin: Control Panel</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<link rel="stylesheet" href="styles.css">
</head>

<body bgcolor="#D5DDE5" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">

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
                                      out:<br>
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


<%

tAction = request.querystring("Action")

If tAction = "in" then

response.write "<form method='post' action='adds_proc.asp'>"
response.write "<input type='hidden' name='proc' value='SearchbytID'>"
response.write "<table width='100%' border='0' cellspacing='0' cellpadding='10'>"
response.write "<tr bgcolor='F5F5CF'>"
response.write "<td class='copy_sm_bold_bl'>Enter Transaction#: </td>"
response.write "</tr>"
response.write "<tr>"
response.write "<td>"
response.write "<table width='100%' border='0' cellspacing='0' cellpadding='3'>"
response.write "<tr>"
response.write "<td width='77%'><input type='text' name='tid'></td>"
response.write "<td width='23%'><input type='submit' name='Submit3' value='Submit'></td>"
response.write "</tr>"
response.write "</table>"
response.write "</td>"
response.write "</tr>"
response.write "</table>"
response.write "</form>"

end if

%>


<form method="post" action="adds_proc.asp">
<input type="hidden" name="proc" value="SearchbyCFV">

                                <table width="100%" border="0" cellspacing="0" cellpadding="10">
                                  <tr bgcolor="F5F5CF"> 
                                    <td class="copy_sm_bold_bl">Enter CFV#: </td>
                                  </tr>
                                  <tr> 
                                    <td> 
                                      <table width="100%" border="0" cellspacing="0" cellpadding="3">
                                        <tr> 
                                          <td width="77%"> 
                                            <input type="text" name="cfv">
                                          </td>
                                          <td width="23%"> 
                                            <input type="submit" name="Submit3" value="Submit">
                                          </td>
                                        </tr>
                                      </table>
                                    </td>
                                  </tr>
                                </table>
 </form>



                              
                            </td>
                          </tr>
                        </table>
                      </td>
                    </tr>
                  </table>
                    <table width="100%" border="0" cellspacing="0" cellpadding="10">
                      <tr> 
                        
                      <td class="copy_sm_bold_bl"> 

<%

if request.querystring("VID") <> "" then

if request.querystring("VID") = "Nul" then

response.write "No matching records."

else

response.write "The following vessel was located: <BR>"
response.write request.querystring("name") & "<BR>"
response.write "CFV: " & request.querystring("cfv") & "<BR>"

tVID=request.querystring("vid")

end if
end if

%> 

</td>
                      </tr>
                    </table>
                    <br>
                  </td>
                <td bgcolor="#000000" width="1"><img src="../images/spacer.gif" width="1" height="10"></td>
                <td width="257" valign="top"> 
                  <table width="100%" border="0" cellspacing="0" cellpadding="10" class="copy_sm_bold_bl">
                    <tr valign="top"> 
                        
                      <td> 
                        <form method="post" action="">
                          <table width="100%" border="0" cellspacing="0" cellpadding="10">
                            <tr bgcolor="#E9F3F3"> 
                              <td class="copy_sm_bold_bl">OR: Search By Vessel 
                                Name:</td>
                            </tr>
                            <tr> 
                              <td> 
                                <table width="100%" border="0" cellspacing="0" cellpadding="3">
                                  <tr> 
                                    <td width="94%"> 
                                      <select name="">
                                        <option value="0" selected>Select Vessel From List</option>
                                        <%

ThisAction = Request.Querystring("Action")

' calling stored proc (sp) for all stowage records (stowagegetall)

<!--#INCLUDE VIRTUAL="/include/adovbs.inc"-->

set openConnection = Server.CreateObject("ADODB.Connection")
openConnection.Open "DSN=fishauction_sqlConn;uid=fishauction;pwd=tavel2004"

Case "add"

SQL = "VesselGetAll"
set rs = openConnection.Execute (SQL, 4)

rs.MoveFirst

do while not rs.eof

response.write "<option value='" & rs("id") & "'>" & rs("name") & "</option>"

rs.movenext

loop

set rs=nothing


%> 
                                      </select>
                                    </td>
                                  </tr>
                                </table>
                              </td>
                            </tr>
                          </table>
                        </form>
                        
                      </td>
                    </tr>
                    <tr valign="top" align="right"> 
                        
                      <td>&lt;<a href="vessel_out_2.asp?id=<%= tVID %>">go to step 2</a>&gt;</td>
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
</body>
</html>

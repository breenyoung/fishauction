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

VesselView = request.querystring("View")

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
                        clerk operator panel</span></font></td>
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
    <td><form method="post" action="">
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
                                    <td class="copy_lg_bold_ylCopy2">View Vessels: 
                                    </td>
                                  </tr>
                                </table>
                              </td>
                              <td class="copy_sm_bold_wh" bgcolor="#FFFFFF" width="1"><img src="../images/spacer.gif" width="1" height="1"></td>
                              <td class="copy_sm_bold_wh" bgcolor="468093" width="375"> 
                                <table width="100%" border="0" cellspacing="0" cellpadding="10" class="copy_sm_bold_wh">
                                  <tr> 
                                    <td>

<%

if VesselView="all" then
response.write "List of all registered fishing vessels."
else
response.write "List of all active vessels/trips."

end if
%>
</td>
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
                          <table width="100%" border="0" cellspacing="0" cellpadding="5">
                            <%

' calling stored proc (sp) for all stowage records (stowagegetall)

<!--#INCLUDE VIRTUAL="/include/adovbs.inc"-->

set openConnection = Server.CreateObject("ADODB.Connection")
openConnection.Open "DSN=fishauction_sqlConn;uid=fishauction;pwd=tavel2004"



Select Case VesselView

'---------------------------

		Case "all"

'---------------------------

SQL = "VesselGetAll"
set rs = openConnection.Execute (SQL, 4)

IF rs.BOF AND rs.EOF THEN

'no records

response.write "<tr><td colspan='3' class='copy_sm_bold_gr'>There are no vessels to report.</td></tr>"

else

rs.movefirst


response.write "<tr class='copy_sm_bold_bl' bgcolor='F5F5CF'>"
response.write "<td>Vessel Name</td>"
response.write "<td align='left' bgcolor='F5F5CF'>CFV</td>"
response.write "<td align='left'>Captain</td>"
response.write "<td align='left'>Edit</td>"

do while not rs.eof

'list all registered vessels in db



response.write "<tr>"

response.write "<td class='copy_sm_bold_gr'>" & rs("name") & "</td>"
response.write "<td class='copy_sm_bold_gr'>" & rs("cfv") & "</td>"
response.write "<td class='copy_sm_bold_gr'>" & rs("captain") & "</td>"
response.write "<td align='left' class='copy_sm_bold_gr'><a href='vessel_form_edit.asp?vid=" & rs("id") & "'>Edit</a></td>"

response.write "</tr>"

rs.movenext

loop

end if

'---------------------------

			Case 1
'       see active trips

'---------------------------

' this is the number that sets the string length of the transactid ... 
' adjust number up as necessary (if transactid exceeds 6 characters)

Const constNumberSize = 6

' end set trans str length

SQL = "TripsGetByStatus '1'"

set rs = openConnection.Execute (SQL, 4)

response.write "<tr class='copy_sm_bold_bl' bgcolor='F5F5CF'>"
response.write "<td>TransactionID</td>"
response.write "<td>Vessel Name</td>"
response.write "<td align='left' bgcolor='F5F5CF'>CFV</td>"
response.write "<td align='left'>Captain</td>"
response.write "<td align='left'>Departure</td>"
response.write "<td align='center'>Cancel</td>"

IF rs.BOF AND rs.EOF THEN

response.write "<tr><td colspan='4' class='copy_sm_bold_gr'>There are no active vessels to report.</td></tr>"

else 

rs.movefirst

do while not rs.eof

SQL2 = "VesselGetById '" & rs("vesselid") & "'"
set rs2 = openConnection.Execute (SQL2, 4)

response.write "<tr>"

strOut = Right("0000000000000000" & rs("id").Value,constNumberSize)

response.write "<td class='copy_sm_bold_gr'>" & strOut & "<br>"
response.write "<td class='copy_sm_bold_gr'>" & rs2("name") & "</td>"
response.write "<td class='copy_sm_bold_gr'>" & rs2("cfv") & "</td>"
response.write "<td class='copy_sm_bold_gr'>" & rs2("Captain") & "</td>"
response.write "<td class='copy_sm_bold_gr'>" & rs("HailOutDate") & "</td>"

response.write "<td align='center' class='copy_sm_bold_gr'><a href='trip_cancel_2.asp?TID=" & rs("id") & "'>Cancel</a></td>"

response.write "</tr>"


rs.movenext

loop

end if


'---------------------------

		Case 2
'    cancelled trips

'---------------------------

SQL = "TripsGetByStatus '3'"
set rs = openConnection.Execute (SQL, 4)

response.write "<tr class='copy_sm_bold_bl' bgcolor='F5F5CF'>"
response.write "<td>TransactionID</td>"
response.write "<td>Vessel Name</td>"
response.write "<td align='left' bgcolor='F5F5CF'>CFV</td>"
response.write "<td align='left'>Captain</td>"
response.write "<td align='left'>Departure</td>"
response.write "<td>Reason</td>"

IF rs.BOF AND rs.EOF THEN

response.write "<tr><td colspan='4' class='copy_sm_bold_gr'>There are no cancelled trips to report.</td></tr>"

else 

rs.movefirst

do while not rs.eof

SQL2 = "VesselGetById '" & rs("vesselid") & "'"
set rs2 = openConnection.Execute (SQL2, 4)

response.write "<tr>"

strOut = Right("0000000000000000" & rs("id").Value,constNumberSize)

response.write "<td class='copy_sm_bold_bl'>" & strOut & "<br>"

response.write "<td class='copy_sm_bold_gr'>" & rs2("name") & "</td>"
response.write "<td class='copy_sm_bold_gr'>" & rs2("cfv") & "</td>"
response.write "<td class='copy_sm_bold_gr'>" & rs2("Captain") & "</td>"
response.write "<td class='copy_sm_bold_gr'>" & rs("HailOutDate") & "</td>"


if rs("statusreason") <> "" then
SQL3 = "StatusReasonsGetById '" & rs("statusreason") & "'"
set rs3 = openConnection.Execute (SQL3, 4)


response.write "<td class='copy_sm_bold_gr'>" & rs3("reason") & "</td>"

else 

response.write "<td>&nbsp;</td>"

end if

response.write "</tr>"


rs.movenext

loop

end if

end select

set rs=nothing


%> 
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
</form>
    </td>
  </tr>
  <tr bgcolor="#999999"> 
    <td><!--#include file="admin_footer_include.asp" --> </td>
  </tr>
</table>
</body>
</html>

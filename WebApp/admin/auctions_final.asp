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
                                    <td class="copy_lg_bold_ylCopy2">Completed 
                                      Auctions </td>
                                  </tr>
                                </table>
                              </td>
                              <td class="copy_sm_bold_wh" bgcolor="#FFFFFF" width="1"><img src="../images/spacer.gif" width="1" height="1"></td>
                              <td class="copy_sm_bold_wh" bgcolor="468093" width="375"> 
                                <table width="100%" border="0" cellspacing="0" cellpadding="10" class="copy_sm_bold_wh">
                                  <tr> 
                                    <td>All closed auctions/purchases must be 
                                      confirmed to vessel operator.</td>
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
                    <table width="100%" border="0" cellspacing="0" cellpadding="10">
                      <tr valign="top"> 
                        <td> 
                          <table width="100%" border="0" cellspacing="0" cellpadding="5">
                            <tr class="copy_sm_bold_bl" bgcolor="F5F5CF"> 
                              <td>Transaction#</td>
                              <td bgcolor="F5F5CF">Auction Closed</td>
                              <td align="left">Buyer</td>
                              <td align="left">Vessel</td>
                              <td align="center">Conf.</td>
                            </tr>

<%

' this is the number that sets the string length of the transactid ... adjust number up as necessary (if transactid exceed 6 characters

Const constNumberSize = 6

' end set trans str length

<!--#INCLUDE VIRTUAL="/include/adovbs.inc"-->

set openConnection = Server.CreateObject("ADODB.Connection")
openConnection.Open "DSN=fishauction_sqlConn;uid=fishauction;pwd=tavel2004"

SQL = "AuctionLotsGetClosed"
set rs = openConnection.Execute (SQL, 4)

if rs.eof and rs.bof then
response.write "<tr><td colspan='5' class='copy_sm_bold_gr'>There are no closed auctions to report.</td</tr>"

else

	rs.MoveFirst
	do while not rs.eof

	response.write "<tr>" 

	strOut = Right("0000000000000000" & rs("id").Value,constNumberSize)

	response.write "<td class='copy_sm_bold_gr'>" & strOut & "</td>"

	StopDate = rs("enddate")

aMonth = datepart("m",StopDate)
aDay = datepart("d",StopDate)
aHour = datepart("h",Stopdate)
aMinute= datepart("n", stopdate)
aSecs = datepart("s", stopdate)

aDate = DateSerial(2004,aMonth,aDay)
aTime = TimeSerial(aHour,aMinute,aSecs)


'response.write "<td class='copy_sm_bold_gr'>" & MonthName(Month(StopDate)) & "&nbsp;" & Day(StopDate) & "<span class='copy_sm_bold_gr'> | </span>" & Hour(StopDate) & ":" & Minute(StopDate)& "</td>"
response.write "<td class='copy_sm_bold_gr'>" & FormatDateTime(aDate,2) & ": " & FormatDateTime(aTime,4) &"</td>"
		SQL2 = "AuctionLotsGetWinner'" & rs("id") & "'"
		set rs2 = openConnection.Execute (SQL2, 4)

					if rs2.eof and rs2.bof then
					response.write "<td class='copy_sm_bold_gr'>NO WINNER</td>"
					AuctionWin="Nil"

					else
					response.write "<td class='copy_sm_bold_gr'>" & rs2("lastname") & ", " & rs2("firstname") & "</td>"

					end if

	SQL3 = "TripsGetbyLotID'" & rs("id") & "'"
	set rs3 = openConnection.Execute (SQL3, 4)


		SQL4 = "VesselGetbyID'" & rs3("vesselid") & "'"
		set rs4 = openConnection.Execute (SQL4, 4)

response.write "<td class='copy_sm_bold_gr'>" & rs4("name") & "</td>"
response.write "<td class='copy_sm_bold_gr' align='center'>"

			if rs("Confirmed") = "False" AND AuctionWin="Nil" then
			response.write "-"

			else if rs("Confirmed") = "True" then
			response.write "YES"

			else
			response.write "<a href='confirm_buy.asp?AID="& rs("id") & "'>NO</a>"
			end if
			end if

response.write "</td>"
response.write "</tr>"

rs.movenext

loop

end if

'rs2.close
'rs3.close
'rs.close
'rs4.close

'set rs2=nothing
'set rs3=nothing
'set rs4=nothing

openconnection.close
set openconnection=nothing

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
    <td><!--#include file="admin_footer_include.asp" --></td>
  </tr>
</table>
</body>
</html>

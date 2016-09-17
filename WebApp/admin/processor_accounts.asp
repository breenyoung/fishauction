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
<link rel="stylesheet" href="styles.css">
<style type="text/css">
<!--
.smlr_black {  font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 7pt; font-weight: normal}
-->
</style>
</head>

<body bgcolor="#D5DDE5" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
<span class="copy_sm_bold_bl"></span> 
<table width="700" border="0" cellspacing="0" cellpadding="0" align="center">
  <tr> 
    <td> 
      <table width="600" border="0" cellspacing="0" cellpadding="0" bgcolor="#000000">
        <tr> 
          <td bgcolor="#000000" valign="top"> <img src="../images/splash_800_01.gif" width="409" height="61"> 
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
    <td>

<form method="post" action="adds_proc.asp">
<input type="hidden" name="Proc" value="UpdateAccounts">


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
                                      accounts
</td>
                                  </tr>
                                </table>
                              </td>
                              <td class="copy_sm_bold_wh" bgcolor="#FFFFFF" width="1"><img src="../images/spacer.gif" width="1" height="1"></td>
                              <td class="copy_sm_bold_wh" bgcolor="468093" width="375"> 
                                <table width="100%" border="0" cellspacing="0" cellpadding="10" class="copy_sm_bold_wh">
                                  <tr> 
                                    <td>Update balance on account, and suspend 
                                      or activate trading priviledges.</td>
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
                          <table width="90%" border="1" cellspacing="0" cellpadding="5" align="center" class="smlr_black">
                            <tr> 
                              <td colspan="7" class="copy_sm_bold_bl" bgcolor="#E9F3F3">Processor 
                                Accounts: Status on <%=Date()%></td>
                            </tr>
                            <tr> 
                              <td width="20%"><b> </b></td>
                              <td width="15%" align="right"><b>Balance</b></td>
                              <td width="15%" align="right"><b>Minimum</b></td>
                              <td width="15%" align="right"><b>Purchases<br>
                                (Total$) </b></td>
                              <td width="15%" align="center"><b>+/-</b></td>
                              <td width="15%" align="right"><b>Bids 
                                in Process<br>
                                (Total$) </b></td>
                              <td align="center"><b>Trading 
                                </b></td>
                            </tr>




<%


<!--#INCLUDE VIRTUAL="/include/adovbs.inc"-->

set openConnection = Server.CreateObject("ADODB.Connection")
openConnection.Open "DSN=fishauction_sqlConn;uid=fishauction;pwd=tavel2004"

SQL = "ProcessorsGetAll"
set rs = openConnection.Execute (SQL, 4)

rs.MoveFirst

rCount = 0
do while not rs.eof

response.write "<tr>"
response.write "<td height='33'>" & rs("name") & "<BR>" & rs("location") & "</td>"
response.write "<td height='33' align='right'><input type='text' name='balance" & rCount & "' size='10' value='" & rs("accountbalance")& "'></td>"
response.write "<td align='right' height='33'><input type='text' name='minbal" & rCount & "' size='10' value='" & rs("minbalance")& "'></td>"

' get processor purchases

yesterday = Now() -1
today = Now()

SQL2 = "BidsGetWonByProcId " & rs("id") & "," & "'" & yesterday & "'" & "," & "'" & today & "'"


	set rs2 = openConnection.Execute (SQL2, 4)

	if rs2.eof and rs2.bof then
	BuyTot=0
	else

		BuyTot = 0
		rs2.movefirst
		do while not rs2.eof
		BuyTot = BuyTot + rs2("amount")

	rs2.movenext
	loop
	end if


response.write "<td align='right' height='33'>" & FormatCurrency(BuyTot) & "</td>"


' balance - purchases

response.write "<td align='right' height='33'>" & FormatCurrency(rs("accountbalance") - BuyTot) & "</td>"


response.write "<input type='hidden' name='id" & rCount & "' value='" & rs("id") & "'>"

' get processor leading

	SQL3 = "BidsGetWinningByProcId " & rs("id") & "," & "'" & today & "'"
	set rs3 = openConnection.Execute (SQL3, 4)

	if rs3.eof and rs3.bof then
	BidTot=0
	else

		rs3.movefirst
		do while not rs3.eof
		BidTot = BidTot + rs3("amount")

	rs3.movenext
	loop
	end if


response.write "<td align='right' height='33'>" & FormatCurrency(BidTot) & "</td>"

' pull active trading

if rs("istrading") = "True" then
	trading = "'-1' checked"
	else trading = "'0' unchecked"
	end if

response.write "<td align='center' height='33' bgcolor='468093'><input type='checkbox' name='newtrade" & rCount & "' value=" & trading & "></td>"

response.write "</tr>"

rs.movenext

rCount = rCount + 1
loop

set rs=nothing



%> 

                           
                            
                            <tr align="right"> 
                              <td class="copy_sm_bold_bl" colspan="7" bgcolor="F5F5CF"> 

<input type="hidden" name="ThisCount" value="<%=rCount%>">

                                <input type="submit" name="Submit" value="Update">
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
</form>
    </td>
  </tr>
  <tr bgcolor="#999999"> 
    <td><!--#include file="admin_footer_include.asp" --></td>
  </tr>
</table>
</body>
</html>

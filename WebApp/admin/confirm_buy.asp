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
 
<form method="post" action="adds_proc.asp">
<input type="hidden" name="Proc" value="ConfSale">

              <table width="100%" border="0" cellspacing="0" cellpadding="0">
                <tr> 
                  <td colspan="3" valign="top">
                    <table width="100%" border="0" cellspacing="0" cellpadding="0">
                      <tr> 
                        <td width="139" bgcolor="468093" class="copy_lg_bold_ylCopy2"> 
                          <table width="100%" border="0" cellspacing="0" cellpadding="10">
                            <tr align="center"> 
                              <td class="copy_lg_bold_ylCopy2">confirm auction 
                                purchase with vessel</td>
                            </tr>
                          </table>
                        </td>
                        <td class="copy_sm_bold_wh" bgcolor="#FFFFFF" width="1"><img src="../images/spacer.gif" width="1" height="1"></td>
                        <td class="copy_sm_bold_wh" bgcolor="468093" width="375"> 
                          <table width="100%" border="0" cellspacing="0" cellpadding="10" class="copy_sm_bold_wh">
                            <tr> 
                              <td>Review summary details with vessel operator 
                                and ask for confirmation.</td>
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
                              <td class="copy_sm_bold_gr">

<%

ThisAuction=request.querystring("AID")

' this is the number that sets the string length of the transactid ... 
' adjust number up as necessary (if transactid exceeds 6 characters)

Const constNumberSize = 6

' end set trans str length

<!--#INCLUDE VIRTUAL="/include/adovbs.inc"-->

set openConnection = Server.CreateObject("ADODB.Connection")
openConnection.Open "DSN=fishauction_sqlConn;uid=fishauction;pwd=tavel2004"

SQL = "AuctionLotsGetbyID '" & ThisAuction & "'"
set rs = openConnection.Execute (SQL, 4)

'response.write "auction id: " &  rs("id")
	
	SQL2 = "AuctionLotsGetWinner '" & ThisAuction & "'"
	set rs2 = openConnection.Execute (SQL2, 4)

'response.write "lname: " &  rs2("lastname")

		SQL3 = "BuyersGetbyID '" & rs2("id") & "'"
		set rs3 = openConnection.Execute (SQL3, 4)

'response.write "processorid: " &  rs3("processorid")

				SQL4 = "ProcessorsGetbyID '" & rs3("processorid") & "'"
				set rs4 = openConnection.Execute (SQL4, 4)

'response.write "processorid: " &  rs4("id")
'response.write "buyerid: " &  rs3("id")&  "<br>"

yesterday=Now()-1
today = Now()

'response.write SQL4 & "<BR>"
						SQL5 = "BidsGetWonByBuyerID '" & rs3("id") & "','" & today & "','" & yesterday & "'"
						set rs5 = openConnection.Execute (SQL5, 4)

'response.write yesterday&  "<br>"

'response.write SQL5& "<BR>"
'response.write today & "<br>"
'response.write rs5("selectedport")


								SQL6 = "PortsGetbyid '" & rs5("selectedport")& "'"
								set rs6 = openConnection.Execute (SQL6, 4)


strOut = Right("0000000000000000" & rs("id").Value,constNumberSize)
response.write "TransactionID: " & strOut & "<br>"

response.write "Processor: " & rs4("name") & "<br>"
response.write "Plant Location: " & rs4("location") & "<br>"
response.write "Contact Phone: " &  "<br>"



%>


                                <span class="copy_sm_bold_bl">. . . . . . . . 
                                . . . . . . . . . . . . . . . . . . . <br>
                                <br>
                                Purchase Summary:</span><br>
                                <br>
                                <table width="100%" border="0" cellspacing="0" cellpadding="5">
                                  <tr class="copy_sm_bold_bl">
                                    <td width="50%">Small:</td>
                                    <td width="50%"><%=FormatCurrency(rs5("sgrade"), 3)%></td>
                                  </tr>
                                  <tr class="copy_sm_bold_bl">
                                    <td width="50%">Medium:</td>
                                    <td width="50%"><%=FormatCurrency(rs5("mgrade"), 3)%></td>
                                  </tr>
                                  <tr class="copy_sm_bold_bl">
                                    <td width="50%">Large:</td>
                                    <td width="50%"><%=FormatCurrency(rs5("lgrade"), 3)%></td>
                                  </tr>
                                  <tr class="copy_sm_bold_bl">
                                    <td width="50%">X-Large:</td>
                                    <td width="50%"><%=FormatCurrency(rs5("xlgrade"), 3)%></td>
                                  </tr>
                                  <tr class="copy_sm_bold_bl">
                                    <td width="50%">Average:</td>
                                    <td width="50%"><%=FormatCurrency(rs5("avgperlb"), 3)%></td>
                                  </tr>
                                </table>
                                <br>
                              </td>
                            </tr>
                          </table>
                        </td>
                      </tr>
                    </table>
                  </td>
                  <td bgcolor="#000000" width="1"><img src="../images/spacer.gif" width="1" height="10"></td>
                  <td width="257" valign="top"> 
                    <table width="100%" border="0" cellspacing="0" cellpadding="10" class="copy_sm_bold_bl">
                      <tr valign="top"> 
                        <td> Deliver to Port:&nbsp;&nbsp;<%=rs6("name")%><br><br><br>
                          
                          <table width="100%" border="0" cellspacing="0" cellpadding="5" class="copy_sm_bold_bl">
                            <tr> 
                              <td>Confirm that Vessel Operator has all Information 
                                of Purchase/Sale:</td>
                              <td> 
                                <input type="checkbox" name="conf" value="checkbox">
                              </td>
                            </tr>
                          </table>
                        </td>
                      </tr>
                      <tr valign="top" align="right"> 
                        <td>
                          <input type="submit" name="Submit" value="Confirm Purchase">
                        </td>
                      </tr>
                    </table>
                  </td>
                </tr>
              </table>
</form>
                
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


<%

set openconnection=nothing

rs.close
rs2.close
rs3.close
rs4.close

set rs=nothing
set rs2=nothing
set rs3=nothing
set rs4=nothing

%>
<%@ Language = "VBScript"%>

<%

<!--#INCLUDE VIRTUAL="/include/adovbs.inc"-->

set openConnection = Server.CreateObject("ADODB.Connection")
openConnection.Open "DSN=fishauction_sqlConn;uid=fishauction;pwd=tavel2004"

if request.form("form_vid")> 0 then
tVID = request.form("form_vid")

		SQL = "VesselGetByID'" & tVID & "'"
		set rs = openConnection.Execute (SQL, 4)
else

tCFV=request.form("form_cfv")

		SQL = "VesselGetBycfv'" & tcfv & "'"
		set rs = openConnection.Execute (SQL, 4)

tVID = rs("id")

'response.write tVID

'response.write request.form("form_cfv")

end if


%> 

<html>
<head>
<title>Auction Admin: Control Panel</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<link rel="stylesheet" href="styles.css">
</head>

<body bgcolor="#D5DDE5" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
<span class="copy_sm_bold_bl"></span> <span class="copy_lg_bold_ylCopy2"></span>
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


<form method="post" action="hails_proc.asp?VID=<%=tVID%>">
<input type="hidden" name="Hail" Value="NewTrip">

              <table width="100%" border="0" cellspacing="0" cellpadding="0">
                <tr align="left"> 
                  <td colspan="3" valign="top"> 
                    <table width="100%" border="0" cellspacing="0" cellpadding="0">
                      <tr> 
                        <td width="139" bgcolor="468093" class="copy_lg_bold_ylCopy2"> 
                          <table width="100%" border="0" cellspacing="0" cellpadding="10">
                            <tr align="center"> 
                              <td class="copy_lg_bold_ylCopy2">vessel hail out:<br>
                                Step 2</td>
                            </tr>
                          </table>
                          
                        </td>
                        <td class="copy_sm_bold_wh" bgcolor="#FFFFFF" width="1"><img src="../images/spacer.gif" width="1" height="1"></td>
                        <td class="copy_sm_bold_wh" bgcolor="468093" width="375"> 
                          <table width="100%" border="0" cellspacing="0" cellpadding="10" class="copy_sm_bold_wh">
                            <tr>
                              <td>Enter ETA and Departure Date and Time for voyage</td>
                            </tr>
                          </table>
                          
                        </td>
                      </tr>
                    </table>
                  </td>
                </tr>
                <tr align="center"> 
                  <td colspan="3" valign="top"> <img src="../images/spacer.gif" width="1" height="10"> 
                    <table width="95%" border="0" cellspacing="0" cellpadding="0">
                      <tr> 
                        <td> 
                          <table width="100%" border="0" cellspacing="0" cellpadding="10">
                            <tr valign="top"> 
                              <td class="copy_sm_bold_bl"><span class="copy_sm_bold_gr"> 
                                Vessel Name: <%=rs("name")%> <br>
                                <span class="copy_sm_bold_gr">. . . . . . . . 
                                . . . . . . . . . . . . . . . . . . . . . . . 
                                . . . . . . . . . . . . . . . . . . . . . . . 
                                </span></span><br>
                                <br>
                                <table width="100%" border="0" cellspacing="0" cellpadding="5" class="copy_sm_bold_bl">
                                  <tr> 
                                    <td>Departure Date</td>
                                    <td> 
                                      <table width="60%" border="0" cellspacing="0" cellpadding="5" class="body">
                                        <tr> 
                                          <td> 
                                            <select name="DMonth">
                                              <option value="1" selected>January</option>
                                              <option value="2">February</option>
                                              <option value="3">March</option>
                                              <option value="4">April</option>
                                              <option value="5">May</option>
                                              <option value="6">June</option>
                                              <option value="7">July</option>
                                              <option value="8">August</option>
                                              <option value="9">September</option>
                                              <option value="10">October</option>
                                              <option value="11">November</option>
                                              <option value="12">December</option>
                                            </select>
                                          </td>
                                          <td> 
                                            <select name="DDay">
                                              <option value="1" selected>01</option>
                                              <option value="2">02</option>
                                              <option value="3">03</option>
                                              <option value="4">04</option>
                                              <option value="5">05</option>
                                              <option value="6">06</option>
                                              <option value="7">07</option>
                                              <option value="8">08</option>
                                              <option value="9">09</option>
                                              <option value="10">10</option>
                                              <option value="11">11</option>
                                              <option value="12">12</option>
                                              <option value="13">13</option>
                                              <option value="14">14</option>
                                              <option value="15">15</option>
                                              <option value="16">16</option>
                                              <option value="17">17</option>
                                              <option value="18">18</option>
                                              <option value="19">19</option>
                                              <option value="20">20</option>
                                              <option value="21">21</option>
                                              <option value="22">22</option>
                                              <option value="23">23</option>
                                              <option value="24">24</option>
                                              <option value="25">25</option>
                                              <option value="26">26</option>
                                              <option value="27">27</option>
                                              <option value="28">28</option>
                                              <option value="29">29</option>
                                              <option value="30">30</option>
                                              <option value="31">31</option>
                                            </select>
                                          </td>
                                        </tr>
                                      </table>
                                    </td>
                                    <td>Departure Time</td>
                                    <td> 
                                      <select name="DTime">
                                        <option value="00:30" selected>00:30</option>
                                        <option value="01:00">01:00</option>
                                        <option value="01:30">01:30</option>
                                        <option value="02:00">02:00</option>
                                        <option value="02:30">02:30</option>
                                        <option value="03:00">03:00</option>
                                        <option value="03:30">03:30</option>
                                        <option value="04:00">04:00</option>
                                        <option value="04:30">04:30</option>
                                        <option value="05:00">05:00</option>
                                        <option value="05:30">05:30</option>
                                        <option value="06:00">06:00</option>
                                        <option value="06:30">06:30</option>
                                        <option value="07:00">07:00</option>
                                        <option value="07:30">07:30</option>
                                        <option value="08:00">08:00</option>
                                        <option value="08:30">08:30</option>
                                        <option value="09:00">09:00</option>
                                        <option value="09:30">09:30</option>
                                        <option value="10:00">10:00</option>
                                        <option value="10:30">10:30</option>
                                        <option value="11:00">11:00</option>
                                        <option value="11:30">11:30</option>
                                        <option value="12:00">12:00</option>
                                        <option value="12:30">12:30</option>
                                        <option value="13:00">13:00</option>
                                        <option value="13:30">13:30</option>
                                        <option value="14:00">14:00</option>
                                        <option value="14:30">14:30</option>
                                        <option value="15:00">15:00</option>
                                        <option value="15:30">15:30</option>
                                        <option value="16:00">16:00</option>
                                        <option value="16:30">16:30</option>
                                        <option value="17:00">17:00</option>
                                        <option value="17:30">17:30</option>
                                        <option value="18:00">18:00</option>
                                        <option value="18:30">18:30</option>
                                        <option value="19:00">19:00</option>
                                        <option value="19:30">19:30</option>
                                        <option value="20:00">20:00</option>
                                        <option value="20:30">20:30</option>
                                        <option value="21:00">21:00</option>
                                        <option value="21:30">21:30</option>
                                        <option value="22:00">22:00</option>
                                        <option value="22:30">22:30</option>
                                        <option value="23:00">23:00</option>
                                        <option value="23:30">23:30</option>
                                        <option value="24:00">24:00</option>
                                      </select>
                                    </td>
                                  </tr>
                                  <tr> 
                                    <td height="30">&nbsp; </td>
                                    <td height="30">&nbsp;</td>
                                    <td height="30">&nbsp;</td>
                                    <td height="30">&nbsp;</td>
                                  </tr>
                                  <tr> 
                                    <td bgcolor="F5F5CF">ETA DATE</td>
                                    <td bgcolor="F5F5CF"> 
                                      <table width="60%" border="0" cellspacing="0" cellpadding="5" class="body">
                                        <tr> 
                                          <td> 
                                            <select name="EMonth">
                                              <option value="1" selected>January</option>
                                              <option value="2">February</option>
                                              <option value="3">March</option>
                                              <option value="4">April</option>
                                              <option value="5">May</option>
                                              <option value="6">June</option>
                                              <option value="7">July</option>
                                              <option value="8">August</option>
                                              <option value="9">September</option>
                                              <option value="10">October</option>
                                              <option value="11">November</option>
                                              <option value="12">December</option>
                                            </select>
                                          </td>
                                          <td> 
                                            <select name="EDay">
                                              <option value="1" selected>01</option>
                                              <option value="2">02</option>
                                              <option value="3">03</option>
                                              <option value="4">04</option>
                                              <option value="5">05</option>
                                              <option value="6">06</option>
                                              <option value="7">07</option>
                                              <option value="8">08</option>
                                              <option value="9">09</option>
                                              <option value="10">10</option>
                                              <option value="11">11</option>
                                              <option value="12">12</option>
                                              <option value="13">13</option>
                                              <option value="14">14</option>
                                              <option value="15">15</option>
                                              <option value="16">16</option>
                                              <option value="17">17</option>
                                              <option value="18">18</option>
                                              <option value="19">19</option>
                                              <option value="20">20</option>
                                              <option value="21">21</option>
                                              <option value="22">22</option>
                                              <option value="23">23</option>
                                              <option value="24">24</option>
                                              <option value="25">25</option>
                                              <option value="26">26</option>
                                              <option value="27">27</option>
                                              <option value="28">28</option>
                                              <option value="29">29</option>
                                              <option value="30">30</option>
                                              <option value="31">31</option>
                                            </select>
                                          </td>
                                        </tr>
                                      </table>
                                    </td>
                                    <td bgcolor="F5F5CF">ETA TIME</td>
                                    <td bgcolor="F5F5CF"> 
                                      <select name="ETime">
                                        <option value="00:30" selected>00:30</option>
                                        <option value="01:00">01:00</option>
                                        <option value="01:30">01:30</option>
                                        <option value="02:00">02:00</option>
                                        <option value="02:30">02:30</option>
                                        <option value="03:00">03:00</option>
                                        <option value="03:30">03:30</option>
                                        <option value="04:00">04:00</option>
                                        <option value="04:30">04:30</option>
                                        <option value="05:00">05:00</option>
                                        <option value="05:30">05:30</option>
                                        <option value="06:00">06:00</option>
                                        <option value="06:30">06:30</option>
                                        <option value="07:00">07:00</option>
                                        <option value="07:30">07:30</option>
                                        <option value="08:00">08:00</option>
                                        <option value="08:30">08:30</option>
                                        <option value="09:00">09:00</option>
                                        <option value="09:30">09:30</option>
                                        <option value="10:00">10:00</option>
                                        <option value="10:30">10:30</option>
                                        <option value="11:00">11:00</option>
                                        <option value="11:30">11:30</option>
                                        <option value="12:00">12:00</option>
                                        <option value="12:30">12:30</option>
                                        <option value="13:00">13:00</option>
                                        <option value="13:30">13:30</option>
                                        <option value="14:00">14:00</option>
                                        <option value="14:30">14:30</option>
                                        <option value="15:00">15:00</option>
                                        <option value="15:30">15:30</option>
                                        <option value="16:00">16:00</option>
                                        <option value="16:30">16:30</option>
                                        <option value="17:00">17:00</option>
                                        <option value="17:30">17:30</option>
                                        <option value="18:00">18:00</option>
                                        <option value="18:30">18:30</option>
                                        <option value="19:00">19:00</option>
                                        <option value="19:30">19:30</option>
                                        <option value="20:00">20:00</option>
                                        <option value="20:30">20:30</option>
                                        <option value="21:00">21:00</option>
                                        <option value="21:30">21:30</option>
                                        <option value="22:00">22:00</option>
                                        <option value="22:30">22:30</option>
                                        <option value="23:00">23:00</option>
                                        <option value="23:30">23:30</option>
                                        <option value="24:00">24:00</option>
                                      </select>
                                    </td>
                                  </tr>
                                  <tr> 
                                    <td>&nbsp;</td>
                                    <td>&nbsp; </td>
                                    <td>&nbsp; </td>
                                    <td>&nbsp; </td>
                                  </tr>
                                  <tr> 
                                    <td>Fishing Area</td>
                                    <td> 
                                      <select name="fArea">
                                        <option value="0" selected>Select</option>
                                        <%

<!--#INCLUDE VIRTUAL="/include/adovbs.inc"-->

set openConnection = Server.CreateObject("ADODB.Connection")
openConnection.Open "DSN=fishauction_sqlConn;uid=fishauction;pwd=tavel2004"


SQL2 = "areasgetall"
set rs2 = openConnection.Execute (SQL2, 4)

rs2.MoveFirst

do while not rs2.eof

response.write "<option value='" & rs2("id") & "'>" & rs2("name") & "</option>"

rs2.movenext

loop

openconnection.close
set openconnection=nothing

set rs2=nothing


%> 
                                      </select>
                                    </td>
                                    <td>&nbsp;</td>
                                    <td>&nbsp;</td>
                                  </tr>
                                  <tr align="right"> 
                                    <td colspan="4"><a href="vessel_out_2.asp"> 
                                      </a> </td>
                                  </tr>
                                </table>
                                <br>

<%

if request.querystring("fail") = "PickOne" then
response.write "<span class='copy_sm_bold_gr'><font color='#CC0000'>&nbsp;&nbsp;*You can only select ports *OR* zones. Please reselect.</font></class>"
end if

response.write "<table width='100%' border='0' cellspacing='0' cellpadding='10'>"
response.write "<tr valign='top'>"
response.write "<td class='copy_sm_bold_bl' colspan='2'><span class='copy_sm_bold_gr'>"
response.write "Select Ports or Zones for Landing: <br>"
response.write "<span class='copy_sm_bold_gr'>. . . . . . . . "
response.write ". . . . . . . . . . . . . . . <span class='copy_sm_bold_gr'>."
response.write " . . . . . . . . . . . . . . . . . . . . . . </span><span class='copy_sm_bold_gr'>. "
response.write " . . . . . . . . . . . .</span></span></span></td>"
response.write "</tr>"
response.write "<tr valign='top'>"
response.write "<td class='copy_sm_bold_bl'>Specify 5 Possible "
response.write "Ports of Landing with first as Preferred:<br>"
response.write "<br>"
response.write "<table width='100%' border='0' cellspacing='0' cellpadding='10' class='copy_sm_bold_bl'>"
response.write "<tr>"
response.write "<td width='15%' bgcolor='F5F5CF'>1</td>"
response.write "<td bgcolor='F5F5CF'>Preferred Port</td>"
response.write "<td bgcolor='F5F5CF'>"



response.write "<select name='Port1'>"
response.write "<option value='0' selected>Select</option>"

' ---- get ports ------------------

set openConnection = Server.CreateObject("ADODB.Connection")
openConnection.Open "DSN=fishauction_sqlConn;uid=fishauction;pwd=tavel2004"

SQL3 = "PortsGetActive"
set rs3 = openConnection.Execute (SQL3, 4)

rs3.movefirst
do while not rs3.eof

response.write "<option value='" & rs3("id") & "'>" & rs3("name") & "</option>"
rs3.movenext
loop

openConnection.close

response.write "</select>"

	For pCount = 2 to 5 step 1
                                      
response.write "</td></tr><tr><td width='15%'>" & pCount & "</td><td>Port #" & pCount & "</td><td>"

response.write "<select name='Port" & pCount & "'>"
response.write "<option value='0' selected>Select</option>"


set openConnection = Server.CreateObject("ADODB.Connection")
openConnection.Open "DSN=fishauction_sqlConn;uid=fishauction;pwd=tavel2004"

SQL4 = "PortsGetActive"
set rs4 = openConnection.Execute (SQL4, 4)

rs4.movefirst
do while not rs4.eof

response.write "<option value='" & rs4("id") & "'>" & rs4("name") & "</option>"
rs4.movenext
loop

openConnection.close

response.write "</select>"

	next


response.write "</td></tr></table></td>"
response.write "<td class='copy_sm_bold_bl' align='center'> * OR *<br>"
response.write "<br>"
response.write "Select three Possible Zones for Landing with first "
response.write "as Preferred:<br>"
response.write "<br>"
response.write "<table width='100%' border='0' cellspacing='0' cellpadding='10' class='copy_sm_bold_bl'>"
response.write "<tr bgcolor='F5F5CF'>"
response.write "<td width='15%'>1</td>"
response.write "<td width='46%'>Preferred</td>"
response.write "<td width='39%'>"
response.write "<select name='Zone1'>"
response.write "<option value='0' selected>Select</option>"
                                      
' ----------get zones ----------------

Set rs5 = Server.CreateObject("ADODB.Recordset")
sql5 = "SELECT Zones.* FROM Zones  WHERE active=1"


strconn = "DSN=fishauction_sqlConn;uid=fishauction;pwd=tavel2004"
Set rs5 = Server.CreateObject("ADODB.Recordset")
rs5.Open sql5, strconn

rs5.MoveFirst

do while Not rs5.eof

	if rs5("id") <> 0 then
	response.write "<option value='" & rs5("id") & "'>" & rs5("name") & "</option>"
	end if

rs5.MoveNext
loop

rs5.close
set rs5 = nothing


response.write "</select></td></tr><tr><td width='15%'>2</td><td width='46%'>Alternate</td><td width='39%'>"
                                      
response.write "<select name='Zone2'>"
response.write "<option value='0' selected>Select</option>"
                                      


Set rs5 = Server.CreateObject("ADODB.Recordset")
sql5 = "SELECT Zones.* FROM Zones  WHERE active=1"


strconn = "DSN=fishauction_sqlConn;uid=fishauction;pwd=tavel2004"
Set rs5 = Server.CreateObject("ADODB.Recordset")
rs5.Open sql5, strconn

rs5.MoveFirst

do while Not rs5.eof

	if rs5("id") <> 0 then
	response.write "<option value='" & rs5("id") & "'>" & rs5("name") & "</option>"
	end if

rs5.MoveNext
loop

rs5.close
set rs5 = nothing

response.write "</select></td></tr><tr><td width='15%'>2</td><td width='46%'>Alternate</td><td width='39%'>"
                                      
response.write "<select name='Zone3'>"
response.write "<option value='0' selected>Select</option>"
                                      

Set rs5 = Server.CreateObject("ADODB.Recordset")
sql5 = "SELECT Zones.* FROM Zones WHERE active=1"


strconn = "DSN=fishauction_sqlConn;uid=fishauction;pwd=tavel2004"
Set rs5 = Server.CreateObject("ADODB.Recordset")
rs5.Open sql5, strconn

rs5.MoveFirst

do while Not rs5.eof

	if rs5("id") <> 0 then
	response.write "<option value='" & rs5("id") & "'>" & rs5("name") & "</option>"
	end if

rs5.MoveNext
loop

rs5.close
set rs5 = nothing


response.write "</select></td></tr></table><BR><input type='submit' name='Submit' value='Create Trip'></td></tr>"


response.write "</table>"


%>
                              </td>
                            </tr>
                            <tr valign="top" align="right"> 
                              <td class="copy_sm_bold_bl"> 
                                
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

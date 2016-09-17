<html>
<head>
<title>Live Fish Auction: Borealis Trading Inc.</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<link rel="stylesheet" href="styles.css"body bgcolor="#D5DDE5"s">

</head>

<body bgcolor="D5DDE5" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
<table width="800" border="0" cellspacing="0" cellpadding="0" align="center">
  <tr bgcolor="#000000" align="right"> 
    <td> 
      <table width="600" border="0" cellspacing="0" cellpadding="0" bgcolor="#000000">
        <tr> 
          <td bgcolor="#000000" valign="top"> <img src="images/splash_800_01.gif" width="409" height="61"> 
            <table width="100%" border="0" cellspacing="0" cellpadding="0" bgcolor="#000000">
              <tr> 
                <td> 
                  <table width="100%" border="0" cellpadding="10">
                    <tr> 
                      <td><font color="#FFFFFF" class="copy_sm_bold_wh"> </font></td>
                    </tr>
                  </table>
                </td>
              </tr>
            </table>
          </td>
          <td bgcolor="#000000" valign="top"><img src="images/splash_02.gif" width="391" height="123"></td>
        </tr>
      </table>
    </td>
  </tr>
  <tr valign="top"> 
    <td bgcolor="#FFFFFF"> 
      <table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr valign="top"> 
          <td> 
            <table width="100%" border="0" cellspacing="0" cellpadding="0" align="center" class="copy_sm_blCopy">
              <tr align="center"> 
                <td class="copy"><b><br>
                  Harvesting Supply and Demand<br>
                  <br>
                  </b></td>
              </tr>
              <tr align="center"> 
                <td> 
                  <table border=1 cellpadding=5 cellspacing=0 width=95% class="copy_sm_blCopy">
                    <tr align="center" class="copy_sm_bold_bl"> 
                      <td class="copy_sm_bold_wh" bgcolor="F5F5CF">&nbsp;</td>
                      <td bgcolor="F5F5CF">&nbsp;</td>
                      <td class="copy_sm_bold_bl" colspan="7" bgcolor="F5F5CF">Catch 
                        &amp; Processing Needs by Landing Zone ('000 lbs)</td>
                    </tr>
                    <tr align="center" class="copy_sm_bold_bl"> 
                      <td class="copy_sm_bold_wh" bgcolor="F5F5CF"><b class="copy_sm_bold_bl"> 
                        Vessels At Sea</b></td>
                      <td bgcolor="F5F5CF"><b>#Boats</b></td>
                      <td bgcolor="F5F5CF"><b>Zone 1<br>
                        Labrador</b></td>
                      <td bgcolor="F5F5CF"><b> Zone 2<br>
                        West Coast</b></td>
                      <td class="copy_sm_bold_bl" bgcolor="F5F5CF"><b>Zone 3<br>
                        N. Penninsula</b></td>
                      <td class="copy_sm_bold_bl" bgcolor="F5F5CF"><b>Zone 4<br>
                        NE Coast</b></td>
                      <td class="copy_sm_bold_bl" bgcolor="F5F5CF"><b>Zone 5<br>
                        Eastern</b></td>
                      <td bgcolor="F5F5CF"><b>Zone 6<br>
                        S. Coast</b></td>
                      <td bgcolor="F5F5CF"><b>Total</b></td>
                    </tr>

<%

set openConnection = Server.CreateObject("ADODB.Connection")
openConnection.Open "DSN=fishauction_sqlConn;uid=fishauction;pwd=tavel2004"


tDay = Date()
	
tTime = Time()



NFTime = DateAdd("n", 270, tTime)

'response.write NFTime

tDate = tDay + NFTime

tripCount = 0


dim ArrBoats(7)
dim ArrCap(7)
dim ArrZ1(7)
dim arrZ2(7)
dim arrZ3(7)
dim arrZ4(7)
dim arrZ5(7)
dim arrZ6(7)


	zTotal1 = 0
	zTotal2 = 0
	zTotal3 = 0
	zTotal4 = 0
	zTotal5 = 0
	zTotal6 = 0

'-------------------------------------------
'      
'         BEGIN LARGE LOOPING HERE
'
'-------------------------------------------

for rowCount = 0 to 6 STEP 1

'response.write tDate & "rowcount: " & rowCount & "<BR>"

Set rs2 = Server.CreateObject("ADODB.Recordset")
SQL2 = "SELECT Trips.* FROM Trips WHERE statusID=1 AND eta > '" & tDate & "'"

strconn = "DSN=fishauction_sqlConn;uid=fishauction;pwd=tavel2004"
Set rs2 = Server.CreateObject("ADODB.Recordset")
rs2.Open SQL2, strconn

if rs2.eof AND rs2.bof then

'---------------------------------------------------------
'    Output Blank Row
'---------------------------------------------------------

response.write "<tr>"
response.write "<td>" & FormatDateTime(tDate,2) & "</td>"
response.write "<td align='right'>-</td>"
response.write "<td align='right'>-</td>"
response.write "<td align='right'>-</td>"
response.write "<td align='right'>-</td>"
response.write "<td align='right'>-</td>"
response.write "<td align='right'>-</td>"
response.write "<td align='right'>-</td>"
response.write "<td class='copy_sm_bold_bl' align='right'>-</td>"
response.write "</tr>"

	
else


rs2.movefirst
do while not rs2.eof

'---------------------------------------
'              trip looping here
'-----------------------------------------


' write trip data


'GET VESSEL CAPACITY

			SQL3 = "VesselGetById '" & rs2("vesselid") & "'"
			set rs3 = openConnection.Execute (SQL3, 4)

'response.write rs3("id") & "<BR>" & rs3("Capacity") & "<BR>"

'GET TRIP PORTS

			Set rs4 = Server.CreateObject("ADODB.Recordset")
			SQL4 = "SELECT TripPorts.* FROM TripPorts WHERE tripid=" & rs2("id") & " AND alternate=1"

			strconn = "DSN=fishauction_sqlConn;uid=fishauction;pwd=tavel2004"
			Set rs4 = Server.CreateObject("ADODB.Recordset")
			rs4.Open SQL4, strconn

'response.write "TripPort: " & rs4("portid") & "<BR>" & rs4("alternate") & "<BR>"
			
'GET ZONEID FOR TRIP PORTS

			SQL5 = "PortsGetById '" & rs4("portid") & "'"
			set rs5 = openConnection.Execute (SQL5, 4)

'response.write "Zone: " & rs5("zoneid") & "<BR>"


'LOOP THRU SEL PORT & ASSIGN TO A ZONE


If rs5("zoneid") = 1 then
		ZTotal1 = ZTotal1 + Clng(rs3("capacity"))

	else if rs5("zoneid") = 2 then
		zTotal2 = zTotal2 + Clng(rs3("capacity"))
	
		else if rs5("zoneid") = 3 then
			zTotal3 = zTotal3 + Clng(rs3("capacity"))

			else if rs5("zoneid") = 4 then
				zTotal4 = zTotal4 + Clng(rs3("capacity"))

				else if rs5("zoneid") = 5 then
					zTotal5 = zTotal5 + Clng(rs3("capacity"))

						else rs5("zoneid") = 6
							zTotal6 = zTotal6 + Clng(rs3("capacity"))

end if
end if
end if
end if
end if


'END ZONE ROUTINE

					
	rs2.movenext
	tripCount = tripCount + 1
	loop


TotCap = zTotal1 + zTotal2 + zTotal3 + zTotal4 + zTotal5 + zTotal6

arrZ1(rowCount) = zTotal1
arrZ2(rowCount) = zTotal2
arrZ3(rowCount) = zTotal3
arrZ4(rowCount) = zTotal4
arrZ5(rowCount) = zTotal5
arrZ6(rowCount) = zTotal6
arrCap(rowCount) = TotCap
				

'end a loop here/stop looping trips start looping general q

response.write "<tr>"
response.write "<td>" & FormatDateTime(tDate,2) & "</td>"
response.write "<td align='right'>" & tripCount & "</td>"

'---------------------------------------------------------
'    Output Row
'---------------------------------------------------------

response.write "<td align='right'>" & FormatNumber((ZTotal1/1000),1,-1,-1,-1) & "</td>"
response.write "<td align='right'>" & FormatNumber((ZTotal2/1000),1,-1,-1,-1) & "</td>"
response.write "<td align='right'>" & FormatNumber((zTotal3/1000),1,-1,-1,-1) & "</td>"
response.write "<td align='right'>" & FormatNumber((zTotal4/1000),1,-1,-1,-1) & "</td>"
response.write "<td align='right'>" & FormatNumber((zTotal5/1000),1,-1,-1,-1) & "</td>"
response.write "<td align='right'>" & FormatNumber((zTotal6/1000),1,-1,-1,-1) & "</td>"
response.write "<td class='copy_sm_bold_bl' align='right'>" & FormatNumber((TotCap/1000),1,-1,-1,-1) & "</td>"
response.write "</tr>"


	zTotal1 = 0
	zTotal2 = 0
	zTotal3 = 0
	zTotal4 = 0
	zTotal5 = 0
	zTotal6 = 0

arrBoats(rowCount) = tripCount
arrCap(rowCount)= TotCap

'response.write ArrBoats(rowCount) & "<BR>"
'response.write ArrCap(rowCount) & "<BR>"

tripCount = 0


'-------------------------------------------
'      
'         NEXT LARGE LOOP
'
'-------------------------------------------

end if

tDate = DateAdd("d", 1, tDate)

Next

%> 

<tr bgcolor="D5DDE5"> 

<% 

' max catch is 100% of total capacity

%>
                      <td>Total Maximum Catch</td>
                      <td align="right">

<%
' total boats over 7 days

AllBoats = 0
for boatCount = 0 to 7
AllBoats = AllBoats + arrBoats(boatCount)
next
response.write AllBoats

%>
</td>
                      <td align="right">

<%
' zone 1 totals over 7 days

MaxZ1 = 0
for MaxZ1Count = 0 to 7
MaxZ1 = MaxZ1 + arrZ1(MaxZ1Count)
next
response.write FormatNumber((MaxZ1/1000),1,-1,-1,-1)

%>

</td>
                      <td align="right">

<%
' zone 2 totals over 7 days

MaxZ2 = 0
for MaxZ2Count = 0 to 7
MaxZ2 = MaxZ2 + arrZ2(MaxZ2Count)
next
response.write FormatNumber((MaxZ2/1000),1,-1,-1,-1)

%>

</td>
                      <td align="right">

<%
' zone 3 totals over 7 days

MaxZ3 = 0
for MaxZ3Count = 0 to 7
MaxZ3 = MaxZ3 + arrZ3(MaxZ3Count)
next
response.write FormatNumber((MaxZ3/1000),1,-1,-1,-1)

%>
</td>
                      <td align="right">

<%
' zone 4 totals over 7 days

MaxZ4 = 0
for MaxZ4Count = 0 to 7
MaxZ4 = MaxZ4 + arrZ4(MaxZ4Count)
next
response.write FormatNumber((MaxZ4/1000),1,-1,-1,-1)

%>

</td>
                      <td align="right">

<%
' zone 5 totals over 7 days

MaxZ5 = 0
for MaxZ5Count = 0 to 7
MaxZ5 = MaxZ5 + arrZ5(MaxZ5Count)
next
response.write FormatNumber((MaxZ5/1000),1,-1,-1,-1)

%>

</td>
                      <td align="right">

<%
' zone 6 totals over 7 days

MaxZ6 = 0
for MaxZ6Count = 0 to 7
MaxZ6 = MaxZ6 + arrZ6(MaxZ6Count)
next
response.write FormatNumber((MaxZ6/1000),1,-1,-1,-1)

%>

</td>
                      <td class="copy_sm_bold_bl" align="right">

<%
' Total Cap totals over 7 days

MaxCap = 0
for MaxCapCount = 0 to 7
MaxCap = MaxCap + arrCap(MaxCapCount)
next
response.write FormatNumber((MaxCap/1000),1,-1,-1,-1)

%>

</td>
                    </tr>

<% 

' est catch is 80% of total max catch

%>

                    <tr bgcolor="D5DDE5"> 
                      <td>Total Estimated Catch</td>
                      <td align="right">&nbsp;</td>
                      <td align="right"><%=FormatNumber(((MaxZ1/1000)*.8),1,-1,-1,-1)%></td>
                      <td align="right"><%=FormatNumber(((MaxZ2/1000)*.8),1,-1,-1,-1)%></td>
                      <td align="right"><%=FormatNumber(((MaxZ3/1000)*.8),1,-1,-1,-1)%></td>
                      <td align="right"><%=FormatNumber(((MaxZ4/1000)*.8),1,-1,-1,-1)%></td>
                      <td align="right"><%=FormatNumber(((MaxZ5/1000)*.8),1,-1,-1,-1)%></td>
                      <td align="right"><%=FormatNumber(((MaxZ6/1000)*.8),1,-1,-1,-1)%></td>
                      <td class="copy_sm_bold_bl" align="right"><%=FormatNumber(((MaxCap/1000)*.8),1,-1,-1,-1)%></td>
                    </tr>
                    <%

set openConnection = Server.CreateObject("ADODB.Connection")
openConnection.Open "DSN=fishauction_sqlConn;uid=fishauction;pwd=tavel2004"

SQL = "ProcessorsGetAll"
set rs = openConnection.Execute (SQL, 4)

dzTotal1 = 0
dzTotal2 = 0
dzTotal3 = 0
dzTotal4 = 0
dzTotal5 = 0
dzTotal6 = 0

rs.movefirst

do while not rs.eof

	If rs("zoneid") = 1 then
		dZTotal1 = dZTotal1 + Clng(rs("demand"))

	else if rs("zoneid") = 2 then
		dzTotal2 = dzTotal2 + Clng(rs("demand"))
	
		else if rs("zoneid") = 3 then
			dzTotal3 = dzTotal3 + Clng(rs("demand"))

			else if rs("zoneid") = 4 then
				dzTotal4 = dzTotal4 + Clng(rs("demand"))

				else if rs("zoneid") = 5 then
					dzTotal5 = dzTotal5 + Clng(rs("demand"))

						else if rs("zoneid") = 6 then
							dzTotal6 = dzTotal6 + Clng(rs("demand"))


end if
end if
end if
end if
end if
end if

					
rs.movenext

loop

TotalNeeds= dzTotal1 + dzTotal2 + dzTotal3 + dzTotal4 + dzTotal5 + dzTotal6


%> 
                    <tr> 
                      <td bgcolor="F5F5CF">Total Needs</td>
                      <td align="right" bgcolor="F5F5CF">&nbsp;</td>
                      <td align="right" bgcolor="F5F5CF"><%=FormatNumber(dzTotal1/1000,1,-1,-1,-1)%></td>
                      <td align="right" bgcolor="F5F5CF"><%=FormatNumber(dzTotal2/1000,1,-1,-1,-1)%></td>
                      <td align="right" bgcolor="F5F5CF"><%=FormatNumber(dzTotal3/1000,1,-1,-1,-1)%></td>
                      <td align="right" bgcolor="F5F5CF"><%=FormatNumber(dzTotal4/1000,1,-1,-1,-1)%></td>
                      <td align="right" bgcolor="F5F5CF"><%=FormatNumber(dzTotal5/1000,1,-1,-1,-1)%></td>
                      <td align="right" bgcolor="F5F5CF"><%=FormatNumber(dzTotal6/1000,1,-1,-1,-1)%></td>
                      <td class="copy_sm_bold_bl" align="right" bgcolor="F5F5CF"><%=FormatNumber(TotalNeeds/1000,1,-1,-1,-1)%></td>
                    </tr>
                    <tr> 
                      <td colspan="2">Catch Shortfall <font color="#CC0000">&lt;Surplus&gt;</font> 
                        -Low</td>
                      <td align="right" bgcolor="#FFFFFF"><%=FormatNumber((dzTotal1-(MaxZ1))/1000,1,-1,-1,-1)%></td>
                      <td align="right"><%=FormatNumber((dzTotal2-(MaxZ2))/1000,1,-1,-1,-1)%></td>
                      <td align="right"><%=FormatNumber((dzTotal3-(MaxZ3))/1000,1,-1,-1,-1)%></td>
                      <td align="right"><%=FormatNumber((dzTotal4-(MaxZ4))/1000,1,-1,-1,-1)%></td>
                      <td align="right"><%=FormatNumber((dzTotal5-(MaxZ5))/1000,1,-1,-1,-1)%></td>
                      <td align="right"><%=FormatNumber((dzTotal6-(MaxZ6))/1000,1,-1,-1,-1)%></td>
                      <td class="copy_sm_bold_bl" align="right"><%=FormatNumber((TotalNeeds-(MaxCap))/1000,1,-1,-1,-1)%></td>
                    </tr>
                    <tr> 
                      <td colspan="2">Catch Shortfall <font color="#CC0000">&lt;Surplus&gt;</font> 
                        -High</td>
                      <td align="right" bgcolor="#FFFFFF"><%=FormatNumber((dzTotal1-(MaxZ1*.8))/1000,1,-1,-1,-1)%></td>
                      <td align="right"><%=FormatNumber((dzTotal2-(MaxZ2*.8))/1000,1,-1,-1,-1)%></td>
                      <td align="right"><%=FormatNumber((dzTotal3-(MaxZ3*.8))/1000,1,-1,-1,-1)%></td>
                      <td align="right"><%=FormatNumber((dzTotal4-(MaxZ4*.8))/1000,1,-1,-1,-1)%></td>
                      <td align="right"><%=FormatNumber((dzTotal5-(MaxZ5*.8))/1000,1,-1,-1,-1)%></td>
                      <td align="right"><%=FormatNumber((dzTotal6-(MaxZ6*.8))/1000,1,-1,-1,-1)%></td>
                      <td class="copy_sm_bold_bl" align="right"><%=FormatNumber((TotalNeeds-(MaxCap*.8))/1000,1,-1,-1,-1)%></td>
                    </tr>
                  </table>
                </td>
              </tr>
            </table>
            <br>
          </td>
        </tr>
      </table>
    </td>
  </tr>
  <tr> 
    <td bgcolor="#999999">&nbsp;</td>
  </tr>
</table>
</body>
</html>

<%

OpenConnection.close
set openConnection=nothing
set rs=nothing

%>

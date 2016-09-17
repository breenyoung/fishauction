
<%@ Language = "VBScript"%>
<%

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


response.buffer = true

'set openConnection = Server.CreateObject("ADODB.Connection")

PosHail = request.form("Hail")


select case PosHail

'-----------------------------------------------------
'
'                   Case "HailIn" 
'
'----------------------------------------------------------

Case "NewAuction"
TID = request.form("trip")


set openConnection = Server.CreateObject("ADODB.Connection")
openConnection.Open "DSN=fishauction_sqlConn;uid=fishauction;pwd=tavel2004"

' check to make sure trip is not still active

SQLCk = "TripsGetbyID'" & TID & "'"
set rsCk = openConnection.Execute (SQLCk, 4)


if rsCk("statusid") <> 1 then

response.redirect "index_panel_op.asp"

else

' create the hail out

response.write "Trip ID: " & TID

' collect the grade percents

response.write "Small: " & request.form("SM") & "<BR>"
response.write "Medium: " & request.form("M") & "<BR>"
response.write "Large: " & request.form("L") & "<BR>"
response.write "XLarge: " & request.form("XL") & "<BR>"




' error trapping for double selects on ports & zones

if request.form("Port1") <> 0 AND request.form("Zone1") <> 0 then
response.redirect "vessel_in_2.asp?id=" & tID & "&fail=PickOne"
end if


' ports & zones update


set openConnection = Server.CreateObject("ADODB.Connection")
openConnection.Open "DSN=fishauction_sqlConn; uid=fishauction; pwd=tavel2004" 

' Delete all exiting trip ports for this trip

SQL50 = "DELETE FROM TripPorts WHERE TripID=" & TID & ""
openConnection.execute(SQL50)

' end trap



' Create new ports/zone-ports


	zone1 = request.form("Zone1")
	zone2 = request.form("Zone2")
	zone3 = request.form("Zone3")


if zone1 <> 0 or zone2 <> 0 or zone3 <> 0 then
Response.Write("<LI>Zones!")
  if Zone1 > 0 then

    sql = "INSERT INTO TripPorts (TripId,PortID,Alternate,iszone) SELECT " & TID & ", id, 1, 1 from ports where ZoneId = (" & zone1 & ") AND Active=1"
Response.Write("<LI>SQL:" & sql)
    openConnection.Execute sql
  end if
  if Zone2 > 0 then
    sql = "INSERT INTO TripPorts (TripId,PortID,Alternate, iszone) SELECT " & TID & ", id, 2, 1 from ports where ZoneId = (" & zone2 & ") AND Active=1"
Response.Write("<LI>SQL:" & sql)
    openConnection.Execute sql
  end if
  if Zone3 > 0 then
    sql = "INSERT INTO TripPorts (TripId,PortID,Alternate, iszone) SELECT " & TID & ", id, 2, 1 from ports where ZoneId = (" & zone3 & ") AND Active=1"
Response.Write("<LI>SQL:" & sql)
    openConnection.Execute sql
  end if

else ' they selected ports

Response.Write("<LI>POrts!")
Port1 = Request.Form("Port1")
if isNumeric(Port1) then
  Port1 = CLng(Port1)
end if

Port2 = Request.Form("Port2")
if isNumeric(Port2) then
  Port2 = CLng(Port2)
end if

Port3 = Request.Form("Port3")
if isNumeric(Port3) then
  Port3 = CLng(Port3)
end if

Port4 = Request.Form("Port4")
if isNumeric(Port4) then
  Port4 = CLng(Port4)
end if

Port5 = Request.Form("Port5")
if isNumeric(Port5) then
  Port5 = CLng(Port5)
end if


if Port1 > 0 then
    sql = "INSERT INTO TripPorts (TripId,PortID,Alternate) Values(" & TID & "," & Port1 & ", 1)"
Response.Write("<LI>SQL:" & sql)
    openConnection.Execute sql
  end if
  if Port2 > 0 then
    sql = "INSERT INTO TripPorts (TripId,PortID,Alternate) Values(" & TID & "," & Port2 & ", 2)"
Response.Write("<LI>SQL:" & sql)
    openConnection.Execute sql
  end if
  if Port3 > 0 then
    sql = "INSERT INTO TripPorts (TripId,PortID,Alternate) Values(" & TID & "," & Port3 & ", 2)"
Response.Write("<LI>SQL:" & sql)
    openConnection.Execute sql
  end if
if Port4 > 0 then
    sql = "INSERT INTO TripPorts (TripId,PortID,Alternate) Values(" & TID & "," & Port4 & ", 2)"
Response.Write("<LI>SQL:" & sql)
    openConnection.Execute sql
  end if
if Port5 > 0 then
    sql = "INSERT INTO TripPorts (TripId,PortID,Alternate) Values(" & TID & "," & Port5 & ", 2)"
Response.Write("<LI>SQL:" & sql)
    openConnection.Execute sql
  end if



end if





















' collect the catch by day

for cCount = 1 to 10
	response.write "Day" & cCount & ":" & request.form("C" & cCount & "") & "<BR>"
	next

' collect the stow method

response.write "Stow: " & request.form("stow") & "<BR>"

' collect supplies

if request.form("ice") <> "" then
response.write "Ice: " & request.form("ice") & "<BR>"
end if

if request.form("bags") <> "" then
response.write "Bags: " & request.form("bags") & "<BR>"
end if

if request.form("pans") <> "" then
response.write "Pans: " & request.form("pans") & "<BR>"
end if

if request.form("inscons") <> "" then
response.write "Isulated Ctrs: " & request.form("inscons") & "<BR>"
end if

' collect ix

if request.form("ix") <> "" then
response.write "Instructs: " & request.form("ix") & "<BR>"
end if


' collect dates

Lmonth=request.form("lmonth")
Lday=request.form("lday")
Ltime=request.form("ltime")

landing = CDate(lmonth & " " & lday & ", " & Year(date()) & " " & ltime)
response.write "Landing at: " & landing & "" & "<BR>"

Stopmonth=request.form("stopmonth")
StopDay=request.form("stopday")
Stoptime=request.form("stoptime")

auctionend = CDate(stopmonth & " " & stopday & ", " & Year(date()) & " " & stoptime)

response.write "Auction Ends at: " & auctionend & "" & "<BR>"

'submit to db

set openConnection = Server.CreateObject("ADODB.Connection")
openConnection.Open "DSN=fishauction_sqlConn; uid=fishauction; pwd=tavel2004" 

' Insert into auction lots
SQL = "INSERT into auctionlots(startdate, enddate, active, statusid, confirmed) "
SQL = SQL + "values ('" & landing & "','" & auctionend & "', " & "1,1,0)"
openConnection.execute(SQL)

' Get back the auctionId identity
Dim newAuctionId
SQL14 = "SELECT @@IDENTITY id FROM auctionlots"
set rs6 = openConnection.Execute (SQL14, 5)
newAuctionId = rs6("id")
response.write SQL14 & "<BR>"



' enter landing date value as hailindate

SQL10 = "UPDATE Trips SET HailinDate ='" & Landing & "', specialinstructions='" & request.form("ix") & "', lotid=" & newAuctionId & ", statusid=2 WHERE id=" & tid & ""
response.write "tid=" & tid & "<BR>"

response.write SQL10 & "<BR>"

openConnection.execute(SQL10)



response.write SQL & "<BR>"

'Loop through and get total pounds for catch table
Dim totalCatchQuantity
for cCount = 1 to 10 step 1
	if(request.form("C" & cCount & "") <> "") then
		totalCatchQuantity = totalCatchQuantity + cint(request.form("C" & cCount & ""))
	end if
next

'Insert one line in catch table
SQL2 = "INSERT INTO catches (tripid,speciesid,quantity,stowid) "
SQL2 = SQL2 + "values (" & TID & ",1," & totalCatchQuantity  & "," & request.form("stow") & ")"
openConnection.execute(SQL2)
response.write SQL2 & "<BR>"


' Get back the catchID identity
Dim newCatchId
SQL5 = "SELECT catches.id FROM Catches WHERE Catches.tripid = " & tid & ""
set rs5 = openConnection.Execute (SQL5, 5)
newCatchId = rs5("id")
response.write SQL5 & "<BR>"

'newCatchId = 1 ' TEMP..REMOVE after uncommenting above


' Now loop through again and insert catchbreakdown table entries

for cCount = 1 to 10 step 1

	if(request.form("C" & cCount & "") <> "") then

		SQL2 = "INSERT INTO catchbreakdowns (catchid,day,value) "
		SQL2 = SQL2 + "values (" & newCatchId & "," & cCount & "," & request.form("C" & cCount & "") & ")"
		openConnection.execute(SQL2)
		response.write SQL2 & "<BR>"
	end if		

next 

' Insert into CatchGrades table

' SMALL
SQL3 = "INSERT into catchgrades(catchid,gradeid,value) "
SQL3 = SQL3 + "values(" & newCatchId & ",1," & request.form("SM") & ")"
openConnection.execute(SQL3)

' MEDIUM
SQL3 = "INSERT into catchgrades(catchid,gradeid,value) "
SQL3 = SQL3 + "values(" & newCatchId & ",2," & request.form("M") & ")"
openConnection.execute(SQL3)

' LARGE
SQL3 = "INSERT into catchgrades(catchid,gradeid,value) "
SQL3 = SQL3 + "values(" & newCatchId & ",3," & request.form("L") & ")"
openConnection.execute(SQL3)

' XL
SQL3 = "INSERT into catchgrades(catchid,gradeid,value) "
SQL3 = SQL3 + "values(" & newCatchId & ",4," & request.form("XL") & ")"
openConnection.execute(SQL3)


' Insert into CatchSupplies table

if request.form("ice") <> "" then

SQL6 = "INSERT INTO CatchSupplies (catchid,supplyid,value) "
SQL6 = SQL6 + "values(" & newCatchId & ",1," & request.form("ice") & ")"
openConnection.execute(SQL6)

response.write SQL6 & "<BR>"

end if

if request.form("bags") <> "" then

SQL7 = "INSERT INTO CatchSupplies (catchid,supplyid,value) "
SQL7 = SQL7 + "values(" & newCatchId & ",2," & request.form("bags") & ")"
openConnection.execute(SQL7)

response.write SQL7 & "<BR>"

end if

if request.form("pans") <> "" then

SQL8 = "INSERT INTO CatchSupplies (catchid,supplyid,value) "
SQL8 = SQL8 + "values(" & newCatchId & ",3," & request.form("pans") & ")"
openConnection.execute(SQL8)

response.write SQL8 & "<BR>"

end if

if request.form("inscons") <> "" then

SQL9 = "INSERT INTO CatchSupplies (catchid,supplyid,value) "
SQL9 = SQL9 + "values(" & newCatchId & ",4," & request.form("inscons") & ")"
openConnection.execute(SQL9)

response.write SQL9 & "<BR>"

end if

SQL20 = "UPDATE Vessels SET active = 0 WHERE id='" & request.form("vessel") & "'"
openConnection.execute(SQL20)


'connExe = SQL

'openConnection.execute connExe
'openConnection.Close

NewPage =  "index_panel_op.asp"

end if




'-----------------------------------------------------
'
'                   Case "CreateTrip" 
'    on hail-out the operator collects data relating to a trip
'     which creates and assigns a tripid (= transactionid)
'
'----------------------------------------------------------

Case "NewTrip"

'openConnection.Open "DSN=fishauction_sqlConn; uid=fishauction; pwd=tavel2004" 

tVID = request.querystring("vid")

' check to make sure vessel is not already active


	set openConnection = Server.CreateObject("ADODB.Connection")
	openConnection.Open "DSN=fishauction_sqlConn;uid=fishauction;pwd=tavel2004"

	SQL40 = "SELECT Vessels.ID from Vessels WHERE id=" & tVID & " AND Active=1"
	set rs40 = openConnection.Execute (SQL40, 4)

	
	if rs40.eof and rs40.bof then


' do the hail out


' error trapping for double selects on ports & zones


if request.form("Port1") <> 0 AND request.form("Zone1") <> 0 then

response.redirect "vessel_out_2.asp?id=" & tVID & "&fail=PickOne"

' end trap


else

Emonth=request.form("emonth")
Eday=request.form("eday")
Etime=request.form("etime")

eta = CDate(emonth & " " & eday & ", " & Year(date()) & " " & etime)

Dmonth=request.form("dmonth")
DDay=request.form("dday")
Dtime=request.form("dtime")

depart = CDate(dmonth & " " & dday & ", " & Year(date()) & " " & dtime)

fArea = Request.Form("FArea")

response.write eta & "<BR>"

response.write depart & "<BR>"

response.write request.form("fArea") & "<BR>"

response.write "Vesselid: " & tVID


	for pCount = 1 to 5
	response.write request.form("Port" & pCount & "") & "<BR>"
	next


		for zCOunt = 1 to 3
		response.write request.form("Zone" & zCount & "") & "<BR>"
		next


end if

set openConnection = Server.CreateObject("ADODB.Connection")
openConnection.Open "DSN=fishauction_sqlConn; uid=fishauction; pwd=tavel2004" 

Dim objRS

SET objRS = Server.CreateObject("ADODB.Recordset")
objRS.Open "Trips",openConnection,adOpenDynamic,adLockOptimistic,adCmdTable ' Opens connection to table.
  objRS.AddNew ' Create a new record.
  objRS.Fields.Item("VesselId").Value = tVID
  objRS.Fields.Item("hailoutdate").Value = Depart
  objRS.Fields.Item("Statusid").Value = -1
  objRS.Fields.Item("eta").Value = eta
  objRS.Fields.Item("areaid").Value = fArea


  objRS.Update
  objRS.Close()
' Needs to be in the SQL if you are going to update it.
sql = "select id,StatusId from trips where vesselid = " & tVID & " AND StatusId = -1"
Response.Write ("<LI>SQL:" & sql)
objRS.Open sql,openconnection,adOpenDynamic,adLockOptimistic,adCmdText
 if objRS.EOF and objRS.BOf then ' no recs found
    Response.Write "Error"
    Response.End
  end if
  TripId = objRS.fields.Item("id").Value
  objRS.Fields.Item("StatusId").Value = 1 ' Now active

  objRS.Update
objRS.Close
'Doh!


SET objRS = Nothing


	zone1 = request.form("Zone1")
	zone2 = request.form("Zone2")
	zone3 = request.form("Zone3")


if zone1 <> 0 or zone2 <> 0 or zone3 <> 0 then
Response.Write("<LI>Zones!")
  if Zone1 > 0 then

    sql = "INSERT INTO TripPorts (TripId,PortID,Alternate,iszone) SELECT " & TripId & ", id, 1, 1 from ports where ZoneId = (" & zone1 & ") AND Active=1"
Response.Write("<LI>SQL:" & sql)
    openConnection.Execute sql
  end if
  if Zone2 > 0 then
    sql = "INSERT INTO TripPorts (TripId,PortID,Alternate, iszone) SELECT " & TripId & ", id, 2, 1 from ports where ZoneId = (" & zone2 & ") AND Active=1"
Response.Write("<LI>SQL:" & sql)
    openConnection.Execute sql
  end if
  if Zone3 > 0 then
    sql = "INSERT INTO TripPorts (TripId,PortID,Alternate, iszone) SELECT " & TripId & ", id, 2, 1 from ports where ZoneId = (" & zone3 & ") AND Active=1"
Response.Write("<LI>SQL:" & sql)
    openConnection.Execute sql
  end if

else ' they selected ports

Response.Write("<LI>POrts!")
Port1 = Request.Form("Port1")
if isNumeric(Port1) then
  Port1 = CLng(Port1)
end if

Port2 = Request.Form("Port2")
if isNumeric(Port2) then
  Port2 = CLng(Port2)
end if

Port3 = Request.Form("Port3")
if isNumeric(Port3) then
  Port3 = CLng(Port3)
end if

Port4 = Request.Form("Port4")
if isNumeric(Port4) then
  Port4 = CLng(Port4)
end if

Port5 = Request.Form("Port5")
if isNumeric(Port5) then
  Port5 = CLng(Port5)
end if


if Port1 > 0 then
    sql = "INSERT INTO TripPorts (TripId,PortID,Alternate) Values(" & TripId & "," & Port1 & ", 1)"
Response.Write("<LI>SQL:" & sql)
    openConnection.Execute sql
  end if
  if Port2 > 0 then
    sql = "INSERT INTO TripPorts (TripId,PortID,Alternate) Values(" & TripId & "," & Port2 & ", 2)"
Response.Write("<LI>SQL:" & sql)
    openConnection.Execute sql
  end if
  if Port3 > 0 then
    sql = "INSERT INTO TripPorts (TripId,PortID,Alternate) Values(" & TripId & "," & Port3 & ", 2)"
Response.Write("<LI>SQL:" & sql)
    openConnection.Execute sql
  end if
if Port4 > 0 then
    sql = "INSERT INTO TripPorts (TripId,PortID,Alternate) Values(" & TripId & "," & Port4 & ", 2)"
Response.Write("<LI>SQL:" & sql)
    openConnection.Execute sql
  end if
if Port5 > 0 then
    sql = "INSERT INTO TripPorts (TripId,PortID,Alternate) Values(" & TripId & "," & Port5 & ", 2)"
Response.Write("<LI>SQL:" & sql)
    openConnection.Execute sql
  end if



end if

SQL20 = "UPDATE Vessels SET active = 1 WHERE id='" & tVID & "'"
openConnection.execute(SQL20)

openConnection.Close()


NewPage =  "view_vessels.asp?view=1"


' throw back if vessel already exists in trips

	else

	response.redirect "index_panel_op.asp"

	end if

end select

set rs=nothing

response.redirect NewPage




'StatusReasonsGetAll
%>
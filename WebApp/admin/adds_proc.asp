
<%@ Language = "VBScript"%>

<%

response.buffer = true

set openConnection = Server.CreateObject("ADODB.Connection")

PosProc = request.form("Proc")

select case PosProc


'---------------------------------------------------
'
'          Case "AddVessel" 
'
'-------------------------------------------------------

Case "AddVessel"

openConnection.Open "DSN=fishauction_sqlConn; uid=fishauction; pwd=tavel2004" 


SQL = "INSERT into Vessels(name, cfv, captain, phone1, phone2, phone3, email, email2, email3, capacity, stowid) "
SQL = SQL + "values ('" & request.form("name") & "', " & request.form("cfv") & "," & "'" & request.form("captain") & "', "
SQL = SQL + "'" & request.form("phone1") & "'," & "'" & request.form("phone2") & "', '" & request.form("phone3") & "', "
SQL = SQL + "'" & request.form("email") & "', '" & request.form("email2") & "', '" & request.form("email3") & "', " & request.form("capacity") & ", " & request.form("vessel_stow") & ")"

connExe = SQL

openConnection.execute connExe
openConnection.Close

NewPage =  "index_panel_op.asp"

'---------------------------------------------------
'
'          Case "EditVessel" 
'
'-------------------------------------------------------

Case "EditVessel"

response.write "edit vessel"


openConnection.Open "DSN=fishauction_sqlConn; uid=fishauction; pwd=tavel2004" 


SQL = "UPDATE Vessels SET name = '" & Request.Form("name")& "', "
SQL = SQL + "cfv = '" & Request.Form("cfv")& "', "
SQL = SQL + "captain = '" & Request.Form("captain")& "', "
SQL = SQL + "phone1 = '" & Request.Form("phone1")& "', "
SQL = SQL + "phone2 = '" & Request.Form("phone2")& "', "
SQL = SQL + "phone3 = '" & Request.Form("phone3")& "', "
SQL = SQL + "email = '" & Request.Form("email")& "', "
SQL = SQL + "email2 = '" & Request.Form("email2")& "', "
SQL = SQL + "email3 = '" & Request.Form("email3")& "', "
SQL = SQL + "capacity ="  & Request.Form("capacity")& ", "
SQL = SQL + "stowid =" & Request.Form("vessel_stow")& " "
SQL = SQL + "WHERE id=" & Request.Form("tVID") & ""

response.write SQL

connExe = SQL

openConnection.execute connExe
openConnection.Close

NewPage =  "index_panel_op.asp"



'---------------------------------------------------
'
'          Case "ConfSale" 
'
'-------------------------------------------------------

Case "ConfSale"

openConnection.Open "DSN=fishauction_sqlConn; uid=fishauction; pwd=tavel2004" 

if request.form("conf") <> "" then
iConf = 1
else iConf = 0
end if

SQL = "UPDATE AuctionLots SET Confirmed =" & iConf & ""

connExe = SQL

openConnection.execute connExe
openConnection.Close

NewPage =  "auctions_final.asp"

'---------------------------------------------------
'
'          Case "CancelTrip/Update Status" 
'
'-------------------------------------------------------

Case "CancelTrip"

openConnection.Open "DSN=fishauction_sqlConn; uid=fishauction; pwd=tavel2004" 

	if request.form("reasonid") = 0 then
	tReason=5
	else 
	tReason=request.form("reasonid")
	end if

response.write request.form("VID")

SQL = "UPDATE Trips SET statusid=3, statusreason=" & tReason & ", reason='" & request.form("details") & "' WHERE id=" & request.form("tripid") & ""


SQL2 = "UPDATE Vessels SET active = 0 WHERE id='" & request.form("VID") & "'"

response.write SQL

connExe = SQL
connExe2 = SQL2

openConnection.execute connExe
openconnection.execute connExe2

NewPage =  "view_vessels.asp?view=1"

'---------------------------------------------------
'
'  Case "UpdateDemand"            
'
'-------------------------------------------------------

Case "UpdateDemand"

DemandString = request.form("demand")
DemandArray = Split(DemandString, ",")


idString = request.form("id")
idArray = Split(idString, ",")

openConnection.Open "DSN=fishauction_sqlConn; uid=fishauction; pwd=tavel2004" 

For iCount = 0 to UBound(idArray)

SQL = "UPDATE Processors SET demand = " &  DemandArray(iCount)  & " WHERE id = " & idArray(iCount) & ""

connExe = SQL

openConnection.execute connExe

next

openConnection.Close

NewPage = "index_panel_op.asp"

'---------------------------------------------------
'
'  Case "UpdateAccounts"            
'
'-------------------------------------------------------

Case "UpdateAccounts"

EndCount = request.form("ThisCount")

'response.write "endcount=" & endcount & "<BR>"

openConnection.Open "DSN=fishauction_sqlConn; uid=fishauction; pwd=tavel2004" 

For iCount = 0 to (EndCount-1) step 1

if request.form("newtrade" & iCount) <> "" then
ThisTrade = 1
else ThisTrade = 0
end if

SQL = "UPDATE Processors SET accountbalance = " &  request.form("balance" & iCount & "") & ", minbalance = " &  request.form("minbal" & iCount & "") & ", istrading=" &  ThisTrade & " WHERE id = " & request.form("id" & iCount & "") & ""

'response.write SQL & "<br>"

connExe = SQL

openConnection.execute connExe

next

openConnection.Close

NewPage = "processor_accounts.asp"


'---------------------------------------------------
'
'  Case "SearchbyCFV"            
'
'-------------------------------------------------------

Case "SearchbyCFV"

<!--#INCLUDE VIRTUAL="/include/adovbs.inc"-->

set openConnection = Server.CreateObject("ADODB.Connection")
openConnection.Open "DSN=fishauction_sqlConn;uid=fishauction;pwd=tavel2004"

SQL = "VesselGetByCfv'" & request.form("cfv") & "'"


set rs = openConnection.Execute (SQL, 4)


if rs.bof and rs.eof then


NewPage = "find_vessel_out.asp?VID=Nul"


else

NewPage = "find_vessel_out.asp?VID=" & rs("id") & "&Name=" & rs("name") & "&CFV=" & rs("cfv") & ""

end if

openconnection.close


'---------------------------------------------------
'
'  Case "SearchbyTID"            
'
'-------------------------------------------------------
Case "SearchbytID"

<!--#INCLUDE VIRTUAL="/include/adovbs.inc"-->

set openConnection = Server.CreateObject("ADODB.Connection")
openConnection.Open "DSN=fishauction_sqlConn;uid=fishauction;pwd=tavel2004"

SQL = "TripsGetbyID'" & request.form("tid") & "'"
set rs = openConnection.Execute (SQL, 4)


	SQL2 = "VesselGetbyID'" & rs("Vesselid") & "'"
	set rs2 = openConnection.Execute (SQL2, 4)


if rs.bof and rs.eof then

NewPage = "find_vessel_in.asp?action=out&VID=Nul"


else
NewPage = "find_vessel_in.asp?TID=" & rs("id") & "&VID=" & rs2("id") & "&Name=" & rs2("name") & "&CFV=" & rs2("cfv") & ""

end if

rs.close
rs2.close

openconnection.close



Case Else

response.write "Case Else"

end select

set rs=nothing

response.redirect NewPage


'StatusReasonsGetAll
%>
<%@ Language = "VBScript"%>

<%

<!--#INCLUDE VIRTUAL="/include/adovbs.inc"-->

set openConnection = Server.CreateObject("ADODB.Connection")
openConnection.Open "DSN=fishauction_sqlConn;uid=fishauction;pwd=tavel2004"




if request.form("form_vid")> 0 then
tVID = request.form("form_vid")

	SQL = "TripsGetOpenbyVesselID'" & tVID & "'"
	set rs = openConnection.Execute (SQL, 4)

		SQL5 = "VesselGetByID'" & rs("vesselid") & "'"
		set rs5 = openConnection.Execute (SQL5, 4)

ThisTrip = rs("id")


' need to get trip id from vessel id BUT where trip is open

else

' if coming in as transaction id from page previous

tTID=request.form("form_tid")

		SQL = "TripsGetByID'" & tTID & "'"
		set rs = openConnection.Execute (SQL, 4)

			SQL5 = "VesselGetByID'" & rs("vesselid") & "'"
			set rs5 = openConnection.Execute (SQL5, 4)

ThisTrip = rs("id")


end if

ThisV = rs("vesselid")


%> 



<html>
<head>
<title>Auction Admin: Control Panel</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<link rel="stylesheet" href="styles.css">
</head>

<body bgcolor="#D5DDE5" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">

<form name="thisform" method="post" action="hails_proc.asp" onSubmit="javascript: return validateTotals();">
<input type="hidden" name="hail" value="NewAuction">
<input type="hidden" name="trip" value="<%=ThisTrip%>">
<input type="hidden" name="vessel" value="<%=ThisV%>">

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
                                      Step 2</td>
                                  </tr>
                                </table>
                              </td>
                              <td class="copy_sm_bold_wh" bgcolor="#FFFFFF" width="1"><img src="../images/spacer.gif" width="1" height="1"></td>
                              <td class="copy_sm_bold_wh" bgcolor="468093" width="375"> 
                                <table width="100%" border="0" cellspacing="0" cellpadding="10" class="copy_sm_bold_wh">
                                  <tr> 
                                    <td>Enter Supplies, Stowage Method and Special 
                                      Instructions </td>
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
                            <tr valign="top"> 
                              <td class="copy_sm_bold_bl"> 
                               <span class="copy_sm_bold_gr">Transaction ID: 
                                  <%=rs("id")%><br>
<%


response.write "Vessel Name: " & rs5("name") & "<br>"

%>


                                  Date Sailed: <%=rs("HailOutDate")%><br>
                                  . . . . . . . . . . . . . . . . . . . . . . 
                                  . . . . . . <br>
                                  </span><br>
                                  Stowage Method (check one):<br>
                               
                                <table width="90%" border="0" cellspacing="0" cellpadding="5">
                                  <tr bgcolor="F5F5CF"> 
                                    <td class="copy_sm_bold_bl" bgcolor="F5F5CF">Bags</td>
                                    <td> 
                                      <input type="radio" name="stow" value="1" checked>
                                    </td>
                                  </tr>
                                  <tr bgcolor="#FFFFFF"> 
                                    <td class="copy_sm_bold_bl">Pans</td>
                                    <td> 
                                      <input type="radio" name="stow" value="2">
                                    </td>
                                  </tr>
                                  <tr bgcolor="F5F5CF"> 
                                    <td class="copy_sm_bold_bl">Insulated Containers</td>
                                    <td> 
                                      <input type="radio" name="stow" value="3">
                                    </td>
                                  </tr>
                                  <tr bgcolor="#FFFFFF"> 
                                    <td class="copy_sm_bold_bl">Bags &amp; Pans</td>
                                    <td> 
                                      <input type="radio" name="stow" value="4">
                                    </td>
                                  </tr>
                                  <tr bgcolor="F5F5CF"> 
                                    <td class="copy_sm_bold_bl">Bags &amp; Insulated 
                                      Ctrs</td>
                                    <td> 
                                      <input type="radio" name="stow" value="5">
                                    </td>
                                  </tr>
                                  <tr bgcolor="#FFFFFF"> 
                                    <td class="copy_sm_bold_bl">Pans &amp; Insulated 
                                      Ctrs</td>
                                    <td> 
                                      <input type="radio" name="stow" value="6">
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
                  <td bgcolor="#000000" width="1"><img src="../images/spacer.gif" width="1" height="10"></td>
                  <td width="257" valign="top"> 
                    <table width="100%" border="0" cellspacing="0" cellpadding="10" class="copy_sm_bold_bl">
                      <tr valign="top" align="center"> 
                        <td>Supplies Required (enter values):<br>
                          <br>
                          <table width="80%" border="0" cellspacing="0" cellpadding="5" align="center">
                            <tr bgcolor="F5F5CF"> 
                              <td class="copy_sm_bold_bl">Ice (tonnes)</td>
                              <td> 
                                <input type="text" name="ice" size="5">
                              </td>
                            </tr>
                            <tr bgcolor="#FFFFFF"> 
                              <td class="copy_sm_bold_bl">Bags (#)</td>
                              <td> 
                                <input type="text" name="bags" size="5">
                              </td>
                            </tr>
                            <tr bgcolor="F5F5CF"> 
                              <td class="copy_sm_bold_bl" bgcolor="F5F5CF">Pans 
                                (#)</td>
                              <td> 
                                <input type="text" name="pans" size="5">
                              </td>
                            </tr>
                            <tr bgcolor="#FFFFFF"> 
                              <td class="copy_sm_bold_bl">Insulated Containers 
                                (#)</td>
                              <td> 
                                <input type="text" name="inscons" size="5">
                              </td>
                            </tr>
                          </table>
                          <br>
                          <br>
                          Special Instructions:<br>
                          <textarea name="ix" cols="25" rows="6"></textarea>
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
  <tr bgcolor="#FFFFFF"> 
    <td><span class="copy_sm_bold_gr"> </span> 
      <table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr> 
          <td colspan="3" valign="top"> 
            <table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr> 
                <td width="139" bgcolor="468093" class="copy_lg_bold_ylCopy2"> 
                  <table width="100%" border="0" cellspacing="0" cellpadding="10">
                    <tr align="center"> 
                      <td class="copy_lg_bold_ylCopy2">vessel hail in:<br>
                        Step 3</td>
                    </tr>
                  </table>
                </td>
                <td class="copy_sm_bold_wh" bgcolor="#FFFFFF" width="1"><img src="../images/spacer.gif" width="1" height="1"></td>
                <td class="copy_sm_bold_wh" bgcolor="468093" width="375"> 
                  <table width="100%" border="0" cellspacing="0" cellpadding="10" class="copy_sm_bold_wh">
                    <tr> 
                      <td>Enter catch in pounds per day and grade percentages. 
                        Total of grade percents must equal 100%. </td>
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
                      <td class="copy_sm_bold_bl"> <br>
                        Enter Total Catch % Per Grade:<br>
                        <br>
                        <table width="100%" border="0" cellspacing="0" cellpadding="5" class="copy_sm_bold_bl">
                          <tr bgcolor="F5F5CF"> 
                            <td bgcolor="F5F5CF">SMALL</td>
                            <td> 
                              <input type="text" name="SM" size="5" onBlur="formatDecimal(this);updateTotal();">
                            </td>
                          </tr>
                          <tr> 
                            <td>MEDIUM</td>
                            <td> 
                              <input type="text" name="M" size="5" onBlur="formatDecimal(this);updateTotal();">
                            </td>
                          </tr>
                          <tr bgcolor="F5F5CF"> 
                            <td bgcolor="F5F5CF">LARGE</td>
                            <td> 
                              <input type="text" name="L" size="5" onBlur="formatDecimal(this);updateTotal();">
                            </td>
                          </tr>
                          <tr> 
                            <td>X-LARGE</td>
                            <td> 
                              <input type="text" name="XL" size="5" onBlur="formatDecimal(this);updateTotal();">
                            </td>
                          </tr>
<tr><td colspan="2">-----------------------------------------</td></tr>
                          <tr> 
                            <td><font color="#cc0000">TOTAL %</font></td>
                            <td><input type="text" name="pTotal" size="5" onBlur="formatDecimal(this);updateTotal();"></td>
							
                          </tr>
                        </table>
                        <br>
<script language="JavaScript">
		function validateTotals() {
		    // ensure percentage total = 100%
			if (parseFloat(document.thisform.pTotal.value) != 100) {
				alert('Total Catch Breakdown must equal 100%');
				document.thisform.SM.focus();
				return false;
			}
			return true;
		}

		function updateTotal() {
						
			var box1 = document.thisform.SM.value;
			var box2 = document.thisform.M.value;
			var box3 = document.thisform.L.value;
			var box4 = document.thisform.XL.value;

			var newTotal = "0.00";
		
			if(box1 != "" && isValidDecimal(box1)) {
				var floatToAdd = parseFloat(box1);
				if(!isNaN(floatToAdd)) {
					newTotal = parseFloat(newTotal) + floatToAdd;
				}
			}
	
			if(box2 != "" && isValidDecimal(box2)) {
				var floatToAdd = parseFloat(box2);
				if(!isNaN(floatToAdd)) {
					newTotal = parseFloat(newTotal) + floatToAdd;
				}
			}
			
			if(box3 != "" && isValidDecimal(box3)) {
				var floatToAdd = parseFloat(box3);
				if(!isNaN(floatToAdd)) {
					newTotal = parseFloat(newTotal) + floatToAdd;
				}
			}

			if(box4 != "" && isValidDecimal(box4)) {
				var floatToAdd = parseFloat(box4);
				if(!isNaN(floatToAdd)) {
					newTotal = parseFloat(newTotal) + floatToAdd;
				}
			}

			// Round Total to 2 decimal places
			newTotal = Math.round(newTotal*100)/100;

			// Make sure Total Price has 2 decimals showing, if not
			// append necessary 0's
			var strNewTotal = new String(newTotal);			
			var decimalInTotal = strNewTotal.indexOf(".");
			if(decimalInTotal != -1) {
				// Has a decimal, drop it.
				strNewTotal = strNewTotal.substr(0,decimalInTotal);
			}

			// Update Total Percentage
			document.thisform.pTotal.value = strNewTotal;
		}
		
		function updateTotalCatch() {
						
	
			var box1 = document.thisform.C1.value;
			var box2 = document.thisform.C2.value;
			var box3 = document.thisform.C3.value;
			var box4 = document.thisform.C4.value;
			var box5 = document.thisform.C5.value;
			var box6 = document.thisform.C6.value;
			var box7 = document.thisform.C7.value;
			var box8 = document.thisform.C8.value;
			var box9 = document.thisform.C9.value;
			var box10 = document.thisform.C10.value;

			var newTotal = "0.00";
		
			if(box1 != "" && isValidDecimal(box1)) {
				var floatToAdd = parseFloat(box1);
				if(!isNaN(floatToAdd)) {
					newTotal = parseFloat(newTotal) + floatToAdd;
				}
			}
	
			if(box2 != "" && isValidDecimal(box2)) {
				var floatToAdd = parseFloat(box2);
				if(!isNaN(floatToAdd)) {
					newTotal = parseFloat(newTotal) + floatToAdd;
				}
			}
			
			if(box3 != "" && isValidDecimal(box3)) {
				var floatToAdd = parseFloat(box3);
				if(!isNaN(floatToAdd)) {
					newTotal = parseFloat(newTotal) + floatToAdd;
				}
			}

			if(box4 != "" && isValidDecimal(box4)) {
				var floatToAdd = parseFloat(box4);
				if(!isNaN(floatToAdd)) {
					newTotal = parseFloat(newTotal) + floatToAdd;
				}
			}

			if(box5 != "" && isValidDecimal(box5)) {
				var floatToAdd = parseFloat(box5);
				if(!isNaN(floatToAdd)) {
					newTotal = parseFloat(newTotal) + floatToAdd;
				}
			}

			if(box6 != "" && isValidDecimal(box6)) {
				var floatToAdd = parseFloat(box6);
				if(!isNaN(floatToAdd)) {
					newTotal = parseFloat(newTotal) + floatToAdd;
				}
			}
			if(box7 != "" && isValidDecimal(box7)) {
				var floatToAdd = parseFloat(box7);
				if(!isNaN(floatToAdd)) {
					newTotal = parseFloat(newTotal) + floatToAdd;
				}
			}
			if(box8 != "" && isValidDecimal(box8)) {
				var floatToAdd = parseFloat(box8);
				if(!isNaN(floatToAdd)) {
					newTotal = parseFloat(newTotal) + floatToAdd;
				}
			}
			if(box9 != "" && isValidDecimal(box9)) {
				var floatToAdd = parseFloat(box9);
				if(!isNaN(floatToAdd)) {
					newTotal = parseFloat(newTotal) + floatToAdd;
				}
			}
			if(box10 != "" && isValidDecimal(box10)) {
				var floatToAdd = parseFloat(box10);
				if(!isNaN(floatToAdd)) {
					newTotal = parseFloat(newTotal) + floatToAdd;
				}
			}
			// Round Total to 2 decimal places
			newTotal = Math.round(newTotal*100)/100;

			// Make sure Total Price has 2 decimals showing, if not
			// append necessary 0's
			var strNewTotal = new String(newTotal);			
			var decimalInTotal = strNewTotal.indexOf(".");
			if(decimalInTotal != -1) {
				// Has a decimal, drop it.
				strNewTotal = strNewTotal.substr(0,decimalInTotal);
			}

			// Update Total Percentage
			document.all.cTotal.innerHTML = strNewTotal;
		}

		function formatDecimal(obj) {
		
		    var objVal = obj.value;

		    if(objVal.charAt(0) == "."  && !isNaN(parseFloat(objVal)) ) {
				// Starts with decimal point, set to 0
		        obj.value = 0
		    } 
		    else {
				if(objVal.indexOf(".") != -1  && !isNaN(parseFloat(objVal)) ) {
					obj.value = objVal.substr(0,objVal.indexOf("."));
				}
		    }
		
		}
		
		function isValidDecimal(boxValue) {
		
			var decimalPresent = boxValue.indexOf(".");
			if(decimalPresent != -1) {
			
				if((boxValue.length - decimalPresent) > 4) {
					return false;
				} else {
					return true;
				}
			} else {
				return true;
			}
		}

		function checkGradeMax(oSrc, args) {
			
			var floatToAdd = parseFloat(args.Value);
			if(!isNaN(floatToAdd)) {
				if(floatToAdd < 1.99) {
					args.IsValid = true;
				} else {
					args.IsValid = false;
				}
			}
		
		}

</script>

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
                <td> Enter Total Catch in Pounds by Day. If a vessel was at sea 
                  but catch was zero, enter 0. Leave extra fields blank: <br>
                  <br>
                  <table width="80%" border="0" cellspacing="0" cellpadding="2" class="copy_sm_bold_bl" align="center">
                    <tr bgcolor="F5F5CF"> 
                      <td width="15%" align="center">1</td>



                      <td width="46%">
<%

StartDate = FormatDateTime(rs("HailOutDate"),2) 
Date1 = StartDate
response.write "<input type='hidden' name='Date1' value='" & Date1 & "'>"
Response.write Date1
%>

</td>
                      <td width="39%"> 
                        <input type="text" onBlur="formatDecimal(this);updateTotalCatch();" name="C1" size="6">
                      </td>
                    </tr>
                    <tr> 
                      <td width="15%" align="center">2</td>
                      <td width="46%">

<%

Date2=DateAdd("d", 1, StartDate)
response.write "<input type='hidden' name='Date2' value='" & Date2 & "'>"
response.write Date2
%>

</td>
                      <td width="39%"> 
                        <input type="text" onBlur="formatDecimal(this);updateTotalCatch();" name="C2" size="6">
                      </td>
                    </tr>
                    <tr bgcolor="F5F5CF"> 
                      <td width="15%" align="center">3</td>
                      <td width="46%">

<%

Date3 = DateAdd("d", 2, StartDate)
response.write "<input type='hidden' name='Date3' value='" & Date3 & "'>"
response.write Date3
%>

</td>
                      <td width="39%"> 
                        <input type="text" onBlur="formatDecimal(this);updateTotalCatch();" name="C3" size="6">
                      </td>
                    </tr>
                    <tr> 
                      <td width="15%" align="center">4</td>
                      <td width="46%">

<%

Date4 = DateAdd("d", 3, StartDate)
response.write "<input type='hidden' name='Date4' value='" & Date4 & "'>"
response.write Date4
%>

</td>
                      <td width="39%"> 
                        <input type="text" onBlur="formatDecimal(this);updateTotalCatch();" name="C4" size="6">
                      </td>
                    </tr>
                    <tr bgcolor="F5F5CF"> 
                      <td width="15%" align="center">5</td>
                      <td width="46%">

<%

Date5 = DateAdd("d", 4, StartDate)
response.write "<input type='hidden' name='Date5' value='" & Date5 & "'>"
response.write Date5
%>
</td>
                      <td width="39%"> 
                        <input type="text" onBlur="formatDecimal(this);updateTotalCatch();" name="C5" size="6">
                      </td>
                    </tr>
                    <tr> 
                      <td width="15%" align="center">6</td>
                      <td width="46%">

<%

Date6 = DateAdd("d", 5, StartDate)
response.write "<input type='hidden' name='Date6' value='" & Date6 & "'>"
response.write Date6 %>

</td>
                      <td width="39%"> 
                        <input type="text" onBlur="formatDecimal(this);updateTotalCatch();" name="C6" size="6">
                      </td>
                    </tr>
                    <tr bgcolor="F5F5CF"> 
                      <td width="15%" align="center">7</td>
                      <td width="46%">

<%
Date7 = DateAdd("d", 6, StartDate)
response.write "<input type='hidden' name='Date7' value='" & Date7 & "'>"
response.write Date7
%>

</td>
                      <td width="39%"> 
                        <input type="text" onBlur="formatDecimal(this);updateTotalCatch();" name="C7" size="6">
                      </td>
                    </tr>
                    <tr> 
                      <td width="15%" align="center">8</td>
                      <td width="46%">

<%
Date8 = DateAdd("d", 7, StartDate)
response.write "<input type='hidden' name='Date8' value='" & Date8 & "'>"
response.write Date8
%>

</td>
                      <td width="39%"> 
                        <input type="text" onBlur="formatDecimal(this);updateTotalCatch();" name="C8" size="6">
                      </td>
                    </tr>
                    <tr bgcolor="F5F5CF"> 
                      <td width="15%" align="center">9</td>
                      <td width="46%">

<%
Date9 = DateAdd("d", 8, StartDate)
response.write "<input type='hidden' name='Date9' value='" & Date9 & "'>"
response.write Date9 %>

</td>
                      <td width="39%"> 
                        <input type="text" onBlur="formatDecimal(this);updateTotalCatch();" name="C9" size="6">
                      </td>
                    </tr>
                    <tr> 
                      <td width="15%" align="center">10</td>
                      <td width="46%">

<%
Date10 = DateAdd("d", 9, StartDate)
response.write "<input type='hidden' name='Date10' value='" & Date10 & "'>"
response.write Date10%>

</td>
                      <td width="39%"> 
                        <input type="text" onBlur="formatDecimal(this);updateTotalCatch();" name="C10" size="6">
                      </td>
                    </tr>
                  </table>
                  <br>
                  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Total 
                  Catch = <span name="cTotal" id="cTotal"></span></td>
              </tr>
            </table>
          </td>
        </tr>
      </table>
    </td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td>
        <table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr align="left"> 
            <td colspan="3" valign="top"> 
              <table width="100%" border="0" cellspacing="0" cellpadding="0">
                <tr> 
                  <td width="139" bgcolor="468093" class="copy_lg_bold_ylCopy2"> 
                    <table width="100%" border="0" cellspacing="0" cellpadding="10">
                      <tr align="center"> 
                        <td class="copy_lg_bold_ylCopy2">vessel hail in:<br>
                          Step 4</td>
                      </tr>
                    </table>
                  </td>
                  <td class="copy_sm_bold_wh" bgcolor="#FFFFFF" width="1"><img src="../images/spacer.gif" width="1" height="1"></td>
                  <td class="copy_sm_bold_wh" bgcolor="468093" width="375">
                    <table width="100%" border="0" cellspacing="0" cellpadding="10" class="copy_sm_bold_wh">
                      <tr> 
                        <td>Confirm Ports/Zones Selections from Hail-Out. Reselect 
                          if necessary</td>
                      </tr>
                    </table>
                  </td>
                </tr>
              </table>
            </td>
          </tr>
          <tr align="center">
            <td colspan="3" valign="top"><%

if request.querystring("fail") = "PickOne" then
response.write "<span class='copy_sm_bold_gr'><font color='#CC0000'>&nbsp;&nbsp;*You can only select ports *OR* zones. Please reselect.</font></class>"
end if

response.write "<table width='100%' border='0' cellspacing='0' cellpadding='10'>"

response.write "<tr valign='top'>"
response.write "<td class='copy_sm_bold_bl'>Specify 5 Possible "
response.write "Ports of Landing with first as Preferred:<br>"
response.write "<br>"
response.write "<table width='100%' border='0' cellspacing='0' cellpadding='10' class='copy_sm_bold_bl'>"
response.write "<tr>"
response.write "<td width='15%' bgcolor='F5F5CF'>1</td>"
response.write "<td bgcolor='F5F5CF'>Preferred Port</td>"
response.write "<td bgcolor='F5F5CF'>"


' ---- start Ports/Zones ReSelect Routines ------------------

set openConnection = Server.CreateObject("ADODB.Connection")
openConnection.Open "DSN=fishauction_sqlConn;uid=fishauction;pwd=tavel2004"

	SQL30 = "TripPortsGetbyTripID '" & ThisTrip & "'"
	set rs30 = openConnection.Execute (SQL30, 4)

	rs30.movefirst

	if rs30("iszone") = true then

	PortsA

	else 

	PortsB

	end if
	rs30.close

'-----------------------------------------------
'-----------------------------------------------

'        subPortsA ' Ports INActive
'
'-----------------------------------------------
' -----------------------------------------------

sub PortsA

'response.write "subportsA"

response.write "<select name='Port1'>"
response.write "<option value='0' selected>Select</option>"


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

ZonesB

end sub




'-----------------------------------------------
'-----------------------------------------------

'        subPortsB ' Ports Active
'
'-----------------------------------------------
' -----------------------------------------------



sub PortsB

'response.write "subportsB"

set openConnection = Server.CreateObject("ADODB.Connection")
openConnection.Open "DSN=fishauction_sqlConn;uid=fishauction;pwd=tavel2004"

' SQL to get the preferred port selected

	Set rs31 = Server.CreateObject("ADODB.Recordset")
	sql31 = "SELECT TripPorts.* FROM TripPorts WHERE tripid=" & ThisTrip & " AND alternate=1"


	strconn = "DSN=fishauction_sqlConn;uid=fishauction;pwd=tavel2004"
	Set rs31 = Server.CreateObject("ADODB.Recordset")
	rs31.Open sql31, strconn

	rs31.MoveFirst

	response.write "<select name='Port1'>"
	
	set openConnection = Server.CreateObject("ADODB.Connection")
	openConnection.Open "DSN=fishauction_sqlConn;uid=fishauction;pwd=tavel2004"


' output preferred port as selected in drop down of all ports

	SQL3 = "PortsGetActive"
	set rs3 = openConnection.Execute (SQL3, 4)

	rs3.movefirst
	do while not rs3.eof

		If rs31("portid") = rs3("id") then

		response.write 	"<option value='" & rs3("id") & "' selected>" & rs3("name") & "</option>"
		else
		response.write "<option value='" & rs3("id") & "'>" & rs3("name") & "</option>"
		end if

		rs3.movenext
		loop

	openConnection.close

	response.write "</select>"

	

set openConnection = Server.CreateObject("ADODB.Connection")
openConnection.Open "DSN=fishauction_sqlConn;uid=fishauction;pwd=tavel2004"


' SQL to get alternate ports

	Set rs32 = Server.CreateObject("ADODB.Recordset")
	sql32 = "SELECT TripPorts.* FROM TripPorts WHERE tripid=" & ThisTrip & " AND alternate=2"


	strconn = "DSN=fishauction_sqlConn;uid=fishauction;pwd=tavel2004"
	Set rs32 = Server.CreateObject("ADODB.Recordset")
	rs32.Open sql32, strconn


dim arrPorts(4)
			rCount = 0


if rs32.eof and rs32.bof then
rCount=0
else
			rs32.movefirst

			DO WHILE NOT RS32.eof

' build array with records

			arrPorts(rCount) = rs32("portid")

			rs32.movenext
			rCount = rCount + 1

			loop
' response.write "Totalrecs: " & rCount & "<BR>"


' output ports dropdowns with alt selections
end if

For p2Count = 0 to rCount-1


response.write "</td></tr><tr><td width='15%'>" & p2Count+2 & "</td><td>Port #" & p2Count+2 & "</td><td>"

response.write "<select name='Port" & p2Count+2 & "'>"

	set openConnection = Server.CreateObject("ADODB.Connection")
	openConnection.Open "DSN=fishauction_sqlConn;uid=fishauction;pwd=tavel2004"

	SQL34 = "PortsGetActive"
	set rs34 = openConnection.Execute (SQL34, 4)

	rs34.movefirst
	do while not rs34.eof

	if rs34("id") = arrPorts(p2Count) then

		response.write "<option value='" & rs34("id") & "' selected>" & rs34("name") & "</option>"
		else

		response.write "<option value='" & rs34("id") & "'>" & rs34("name") & "</option>"
		end if

	rs34.movenext

	loop

next

openConnection.close

response.write "</select>"

		

' output the blank ports with no selections
                                      
For p3Count = rCount+2 to 5 step 1

                                      
response.write "</td></tr><tr><td width='15%'>" & p3Count & "</td><td>Port #" & p3Count & "</td><td>"

response.write "<select name='Port" & p3Count & "'>"
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

next


response.write "</select>"



ZonesA

end sub



'-----------------------------------------------
'-----------------------------------------------

'        subZonesA ' Zones INActive
'
'-----------------------------------------------
' -----------------------------------------------

sub ZonesA

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


' get trip ports where iszone = 1 and zoneid =1
' if rs.eof and rs.bof then
' 

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

end sub

'-----------------------------------------------
'-----------------------------------------------

'        subZonesB ' Zones Active
'
'-----------------------------------------------
' -----------------------------------------------


sub ZonesB

response.write "</td></tr></table></td>"
response.write "<td class='copy_sm_bold_bl' align='center'> * OR *<br>"
response.write "<br>"
response.write "Select three Possible Zones for Landing with first "
response.write "as Preferred:"

if request.querystring("fail") = "PickOne" then
response.write "<span class='copy_sm_bold_gr'><font color='#CC0000'>&nbsp;&nbsp;*You can only select ports *OR* zones. Please reselect.</font></class>"
end if

response.write "<br>"
response.write "<br>"
response.write "<table width='100%' border='0' cellspacing='0' cellpadding='10' class='copy_sm_bold_bl'>"
response.write "<tr bgcolor='F5F5CF'>"
response.write "<td width='15%'>1</td>"
response.write "<td width='46%'>Preferred</td>"
response.write "<td width='39%'>"

	
' ----------get zones ----------------

set openConnection = Server.CreateObject("ADODB.Connection")
openConnection.Open "DSN=fishauction_sqlConn;uid=fishauction;pwd=tavel2004"



' ZONE 1

Set rs36 = Server.CreateObject("ADODB.Recordset")
	sql36 = "SELECT TripPorts.* FROM TripPorts WHERE tripid=" & ThisTrip & " AND alternate=1"


	strconn = "DSN=fishauction_sqlConn;uid=fishauction;pwd=tavel2004"
	Set rs36 = Server.CreateObject("ADODB.Recordset")
	rs36.Open sql36, strconn

rs36.movefirst


Set rs37 = Server.CreateObject("ADODB.Recordset")
	
	SQl37="SELECT Ports.* from Ports WHERE id=" & rs36("portid") & ""

	strconn = "DSN=fishauction_sqlConn;uid=fishauction;pwd=tavel2004"
	Set rs37 = Server.CreateObject("ADODB.Recordset")
	rs37.Open sql37, strconn

Zone1Pick = rs37("zoneid")


	response.write "<select name='Zone1'>"
	                                     

	Set rs5 = Server.CreateObject("ADODB.Recordset")
	sql5 = "SELECT Zones.* FROM Zones  WHERE active=1"


	strconn = "DSN=fishauction_sqlConn;uid=fishauction;pwd=tavel2004"
	Set rs5 = Server.CreateObject("ADODB.Recordset")
	rs5.Open sql5, strconn

	rs5.MoveFirst

	do while Not rs5.eof

		if rs5("id") <> 0 then

		if rs37("zoneid") = rs5("id") then
		response.write "<option value='" & rs5("id") & "' selected>" & rs5("name") & "</option>"
		else
		response.write "<option value='" & rs5("id") & "'>" & rs5("name") & "</option>"

		end if
		end if

	rs5.MoveNext
	loop

	rs5.close
	set rs5 = nothing


	response.write "</select></td></tr><tr><td width='15%'>2</td><td width='46%'>Alternate</td><td width='39%'>"
                                      

' ZONE 2

Set rs38 = Server.CreateObject("ADODB.Recordset")
	sql38 = "SELECT TOP 1 TripPorts.* FROM TripPorts WHERE tripid=" & ThisTrip & " AND alternate=2"


	strconn = "DSN=fishauction_sqlConn;uid=fishauction;pwd=tavel2004"
	Set rs38 = Server.CreateObject("ADODB.Recordset")

rs38.Open sql38, strconn


if rs38.eof and rs38.bof then

'no alt zones selected

NoAltZones

else
	rs38.movefirst


Set rs39 = Server.CreateObject("ADODB.Recordset")
	
	SQl39="SELECT Ports.* from Ports WHERE id=" & rs38("portid") & ""

	strconn = "DSN=fishauction_sqlConn;uid=fishauction;pwd=tavel2004"
	Set rs39 = Server.CreateObject("ADODB.Recordset")
	rs39.Open sql39, strconn


Zone2Pick=rs39("zoneid")

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

		if rs39("zoneid") = rs5("id") then
		response.write "<option value='" & rs5("id") & "' selected>" & rs5("name") & "</option>"
		else
		response.write "<option value='" & rs5("id") & "'>" & rs5("name") & "</option>"

		end if
		end if

	rs5.MoveNext
	loop

	rs5.close
	set rs5 = nothing

	response.write "</select></td></tr><tr><td width='15%'>3</td><td width='46%'>Alternate</td><td width='39%'>"

' ZONE 3

                              
	Set rs40 = Server.CreateObject("ADODB.Recordset")
	sql40 = "SELECT TripPorts.* FROM TripPorts WHERE tripid=" & ThisTrip & " AND alternate=2"


	strconn = "DSN=fishauction_sqlConn;uid=fishauction;pwd=tavel2004"
	Set rs40 = Server.CreateObject("ADODB.Recordset")

rs40.Open sql40, strconn


rs40.movefirst

do while not rs40.eof


Set rs41 = Server.CreateObject("ADODB.Recordset")
	
'response.write rs40("portid")

	SQl41="SELECT Ports.* from Ports WHERE id=" & rs40("portid") & ""

	strconn = "DSN=fishauction_sqlConn;uid=fishauction;pwd=tavel2004"
	Set rs41 = Server.CreateObject("ADODB.Recordset")
	rs41.Open sql41, strconn

'response.write "ZoneID: "& rs41("zoneid")

if rs41("zoneid") <> Zone2Pick then

Zone3Pick=rs41("zoneid")

else Zone3Pick=open

end if


rs40.movenext
loop


' write out zone3 with picked

response.write "<select name='Zone3'>"

if Zone3Pick = Open then
response.write "<option value='0' selected>Select</option>"
end if
	
	Set rs5 = Server.CreateObject("ADODB.Recordset")
	sql5 = "SELECT Zones.* FROM Zones  WHERE active=1"


	strconn = "DSN=fishauction_sqlConn;uid=fishauction;pwd=tavel2004"
	Set rs5 = Server.CreateObject("ADODB.Recordset")
	rs5.Open sql5, strconn

	rs5.MoveFirst

	do while Not rs5.eof

		if rs5("id") <> 0 then

		if Zone3Pick = rs5("id") then
		response.write "<option value='" & rs5("id") & "' selected>" & rs5("name") & "</option>"
		else
		response.write "<option value='" & rs5("id") & "'>" & rs5("name") & "</option>"

		end if
		end if

	rs5.MoveNext
	loop

	rs5.close
	set rs5 = nothing




end if


end sub

' SUB NO ALT ZONES


sub NoAltZones

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

response.write "</select></td></tr><tr><td width='15%'>3</td><td width='46%'>Alternate</td><td width='39%'>"
                                      
response.write "<select name='Zone3'>"
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

end sub

' end ports & zones select


response.write "</select></td></tr></table></td></tr>"


response.write "</table>"


%></td>
          </tr>
          <tr align="center">
            <td colspan="3" valign="top">
              <table width="100%" border="0" cellspacing="0" cellpadding="0">
                <tr> 
                  <td width="139" bgcolor="468093" class="copy_lg_bold_ylCopy2"> 
                    <table width="100%" border="0" cellspacing="0" cellpadding="10">
                      <tr align="center"> 
                        <td class="copy_lg_bold_ylCopy2">vessel hail in:<br>
                          Step 5</td>
                      </tr>
                    </table>
                  </td>
                  <td class="copy_sm_bold_wh" bgcolor="#FFFFFF" width="1"><img src="../images/spacer.gif" width="1" height="1"></td>
                  <td class="copy_sm_bold_wh" bgcolor="468093" width="375"> 
                    <table width="100%" border="0" cellspacing="0" cellpadding="10" class="copy_sm_bold_wh">
                      <tr> 
                        <td>Enter Landing Date and Time and Set Auction close 
                          Date and Time. Submit lot to active auction. Notify 
                          vessel to call in at auction end.</td>
                      </tr>
                    </table>
                  </td>
                </tr>
              </table>
            </td>
          </tr>
          <tr align="center"> 
            <td colspan="3" valign="top"> 
              <table width="95%" border="0" cellspacing="0" cellpadding="0">
                <tr> 
                  <td> 
                    <table width="100%" border="0" cellspacing="0" cellpadding="10">
                      <tr valign="top"> 
                        <td class="copy_sm_bold_bl"> 
                          <table width="100%" border="0" cellspacing="0" cellpadding="5" class="copy_sm_bold_bl">
                            <tr> 
                              <td>Landing Date</td>
                              <td> 
                                <table width="60%" border="0" cellspacing="0" cellpadding="5" class="body">
                                  <tr> 
                                    <td> 
                                      <select name="LMonth">
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
                                      <select name="LDay">
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
                              <td>Landing Time</td>
                              <td> 
                                <select name="LTime">
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
                              <td bgcolor="F5F5CF">AUCTION <br>
                                STOP DATE</td>
                              <td bgcolor="F5F5CF"> 
                                <table width="60%" border="0" cellspacing="0" cellpadding="5" class="body">
                                  <tr> 
                                    <td> 
                                      <select name="StopMonth">
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
                                      <select name="StopDay">
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
                              <td bgcolor="F5F5CF">STOP TIME</td>
                              <td bgcolor="F5F5CF"> 
                                <select name="StopTime">
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
                            <tr align="center"> 
                              <td colspan="4">&nbsp;</td>
                            </tr>
                            <tr align="center"> 
                              <td colspan="4">Vessel operator must call 709.555.5555 
                                within one hour of aution end time to confirm 
                                sale and delivery details.</td>
                            </tr>
                            <tr align="right"> 
                              <td colspan="4"> 
                                <input type="submit" name="Submit" value="Send to Auction">
                              </td>
                            </tr>
                          </table>
                          <br>
                        </td>
                      </tr>
                    </table>
                  </td>
                </tr>
              </table>
              <img src="../images/spacer.gif" width="1" height="10"> </td>
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

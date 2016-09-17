<%@ Language = "VBScript"%>
<!--#include file="auth.asp"-->

<%

' This application was developed for the Newfoundland Fishery through Tavel Limited/Borealis Trading in May/June.2004
' The code base is C# within a .NET structure for the public auction module and ASP for the admin section
' The backend is MSSQL
' This admin section was written by Bernardine Wood/bern@embra.com
' It is dedicated to the memory of my grandparents, Laura Anne Homer & William Elijah Pye 
' who hailed in to this world from the small fishing villages of Baie Verde and Freshwater Cove in NF
' BW/June 14.04
'

%> 

<html>
<head>
<title>Auction Admin: Control Panel</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<style type="text/css">
<!--
.copy_sm_bold_wh {  font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 8pt; font-weight: bolder; color: #FFFFFF}
.copy_smlr_bold_wh { font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 7pt; font-weight: bolder; color: #FFFFFF }
.copy_sm_bold_bl { font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 8pt; font-weight: bolder; color: #666666}
-->
</style>
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
                      <td><font color="#FFFFFF" class="copy_sm_bold_wh"> </font></td>
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
  <tr bgcolor="#FFFFFF" valign="top"> 
    <td> 
      <table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr> 
          <td valign="top"> 
            <table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr> 
                <td width="50%" valign="top"> 
                  <table width="95%" border="0" cellspacing="0" cellpadding="0">
                    <tr> 
                      <td> 
                        <table width="100%" border="0" cellspacing="0" cellpadding="15">
                          <tr align="center"> 
                            <td class="copy_sm_bold_bl" bgcolor="F5F5CF">vessel 
                              management</td>
                          </tr>
                          <tr> 
                            <td class="copy_sm_bold_bl"> 
                              <p><a href="find_vessel_out.asp">Hail Out</a><br>
                                <a href="find_vessel_in.asp">Hail In</a><br>
                                <a href="auctions_final.asp">Enter Purchase Confirmation</a><br>
                                <a href="view_vessels.asp?view=1">See All Active 
                                Vessels/Trips</a><br>
                                <a href="view_vessels.asp?view=all">See all Vessels/Edit 
                                Vessel Records</a><br>
                                <a href="view_vessels.asp?view=2">See Cancelled 
                                Trips</a></p>
                            </td>
                          </tr>
                        </table>
                      </td>
                    </tr>
                    <tr> 
                      <td> 
                        <table width="100%" border="0" cellspacing="0" cellpadding="15">
                          <tr align="center" bgcolor="F5F5CF"> 
                            <td class="copy_sm_bold_bl">auction administration</td>
                          </tr>
                          <tr> 
                            <td class="copy_sm_bold_bl"><a href="view_vessels.asp?view=1">Cancel 
                              a Trip</a><br>
                              <a href="../default.aspx">Enter a Faxed Bid</a><br>
                              <a href="auctions_final.asp">View Completed Auctions</a><br>
                              <a href="/admin/dayactivity/default.aspx">Download Daily Auction Report</a>
                              </td>
                          </tr>
                        </table>
                      </td>
                    </tr>
                  </table>
                </td>
                <td bgcolor="#000000" width="1"><img src="../images/spacer.gif" width="1" height="10"></td>
                <td width="50%" valign="top"> 
                  <table width="95%" border="0" cellspacing="0" cellpadding="0" align="right">
                    <tr> 
                      <td> 
                        <table width="100%" border="0" cellspacing="0" cellpadding="15">
                          <tr align="center" bgcolor="F5F5CF"> 
                            <td class="copy_sm_bold_bl">accounts management</td>
                          </tr>
                          <tr> 
                            <td class="copy_sm_bold_bl"> <a href="processor_demand.asp">Update 
                              Processor Demand</a><br>
                              <a href="processor_accounts.asp">Update Processor 
                              Accounts</a> </td>
                          </tr>
                        </table>
                      </td>
                    </tr>
                    <tr> 
                      <td> 
                        <table width="100%" border="0" cellspacing="0" cellpadding="15">
                          <tr align="center" bgcolor="F5F5CF"> 
                            <td class="copy_sm_bold_bl">records management</td>
                          </tr>
                          <tr> 
                            <td class="copy_sm_bold_bl"> 
                              <p><a href="vessel_form.asp?action=add">add new 
                                vessel</a><br>
                                set ports active/inactive (Phase II)</p>
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
    </td>
  </tr>
  <tr bgcolor="#FFFFFF" align="right"> 
    <td>&nbsp;</td>
  </tr>
  <tr bgcolor="#999999" align="right"> 
    <td> <!--#include file="admin_footer_include.asp" --> </td>
  </tr>
</table>
</body>
</html>

<%@ Page language="c#" Codebehind="default.aspx.cs" AutoEventWireup="false" Inherits="WebApp.Buyers._default" %>
<%@Register tagprefix="uc" tagname="buyerHeader" src="/UserControls/HeaderBanner.ascx" %>
<html>
<head>
<title>Live Fish Auction: Borealis Trading Inc.</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<link rel="stylesheet" href="/styles.css">
<style type="text/css">
<!--
-->
</style>
<script language="JavaScript">
<!--
function MM_preloadImages() { //v3.0
  var d=document; if(d.images){ if(!d.MM_p) d.MM_p=new Array();
    var i,j=d.MM_p.length,a=MM_preloadImages.arguments; for(i=0; i<a.length; i++)
    if (a[i].indexOf("#")!=0){ d.MM_p[j]=new Image; d.MM_p[j++].src=a[i];}}
}

function MM_swapImgRestore() { //v3.0
  var i,x,a=document.MM_sr; for(i=0;a&&i<a.length&&(x=a[i])&&x.oSrc;i++) x.src=x.oSrc;
}

function MM_findObj(n, d) { //v3.0
  var p,i,x;  if(!d) d=document; if((p=n.indexOf("?"))>0&&parent.frames.length) {
    d=parent.frames[n.substring(p+1)].document; n=n.substring(0,p);}
  if(!(x=d[n])&&d.all) x=d.all[n]; for (i=0;!x&&i<d.forms.length;i++) x=d.forms[i][n];
  for(i=0;!x&&d.layers&&i<d.layers.length;i++) x=MM_findObj(n,d.layers[i].document); return x;
}

function MM_swapImage() { //v3.0
  var i,j=0,x,a=MM_swapImage.arguments; document.MM_sr=new Array; for(i=0;i<(a.length-2);i+=3)
   if ((x=MM_findObj(a[i]))!=null){document.MM_sr[j++]=x; if(!x.oSrc) x.oSrc=x.src; x.src=a[i+2];}
}
//-->
</script>
</head>

<body bgcolor="D5DDE5" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0" link="#FFFFFF" vlink="#FFFFFF" alink="#FFFFFF" onLoad="MM_preloadImages('/images/buyer_panel_market_02.jpg','/images/buyer_panel_reports_02.jpg','/images/buyer_panel_sea_02.jpg')">
<table width="698" border="0" cellspacing="0" cellpadding="0" align="center">
  <tr> 
    <td> 
      <table width="600" border="0" cellspacing="0" cellpadding="0" bgcolor="#000000">
        <tr> 
          <td bgcolor="#000000" valign="top"> <img src="/images/splash_01.gif" width="309" height="61"> 
            <table width="100%" border="0" cellspacing="0" cellpadding="0" bgcolor="#000000">
              <tr> 
                <td> 
                  <table width="100%" border="0" cellpadding="10">
                    <tr> 
                      <td>
                      <font color="#FFFFFF" class="copy_sm_bold_wh"><asp:Label ID="lblTimeLeft" Runat="server"/><br>
                        <asp:Label ID="lblLiveAuctions" Runat="server"/> current live auctions</font>
                      </td>
                    </tr>
                  </table>
                </td>
              </tr>
            </table>
          </td>
          <td bgcolor="#000000" valign="top"><img src="/images/splash_02.gif" width="391" height="123"></td>
        </tr>
      </table>
    </td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td> 
      <table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr> 
          <td>
            <table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr> 
                <td> 
                  <table width="500%" border="0" cellspacing="0" cellpadding="10" class="copy_sm_bold_bl">
                    <tr> 
                      <td>Welcome! You are logged in as <asp:Label ID="lblName" Runat="server"/><br>
                        Representing: <asp:Label id="lblProcName" Runat="server"/>, <asp:Label ID="lblProcLocation" Runat="server"/></td>
                    </tr>
                  </table>
                  <table width="500%" border="0" cellspacing="0" cellpadding="0">
                    <tr> 
                      <td valign="top"><a href="/Auctions/default.aspx"><img src="/images/buyer_panel_01.gif" width="334" height="28" name="aa" onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('pic','','/images/buyer_panel_market_02.jpg',1)" border="0"></a><br>
                        <a href="/Buyers/summary.aspx"><img src="/images/buyer_panel_03.gif" width="334" height="26" name="bbr" onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('pic','','/images/buyer_panel_reports_02.jpg',1)" border="0"></a><br>
                        <a href="../supply_demand.asp"><img src="/images/buyer_panel_04.gif" width="334" height="25" name="cnr" onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('pic','','/images/buyer_panel_sea_02.jpg',1)" border="0"></a><br>
                        <a href="/logout.aspx"><img src="/images/buyer_panel_05.gif" width="334" height="71" name="logoff"></a><BR>
                      </td>
                      <td valign="top"><img src="/images/buyer_panel_blnk_02.jpg" width="166" height="150" name="pic"></td>
                    </tr>
                  </table>
                  <table width="500%" border="0" cellspacing="0" cellpadding="0">
                  </table>
                </td>
              </tr>
            </table>
          </td>
          <td width="183" bgcolor="666666" valign="top"> 
            <table width="100%" border="0" cellspacing="0" cellpadding="10">
              <tr align="center" valign="top"> 
                <td> <span class="copy_sm_bold_wh"><font color="#FFFFFF" class="copy_sm_bold_wh"><span class="copy_sm_bold_wh"> 
                  <asp:Label ID="lblToday" Runat="server"/></span> <br>
                  </font></span></td>
              </tr>
              <tr align="left"> 
                <td class="copy_sm_bold_wh">&nbsp;</td>
              </tr>
            </table>
          </td>
        </tr>
      </table>
    </td>
  </tr>
  <tr bgcolor="#999999"> 
    <td>&nbsp;</td>
  </tr>
</table>
</body>
</html>

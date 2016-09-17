<%@ Page language="c#" Codebehind="systemReqs.aspx.cs" AutoEventWireup="false" Inherits="WebApp.systemReqs" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" > 

<%

    string browserName = "<font size=2 color='FF0000'>" + Request.Browser.Browser;
    if(Request.Browser.Browser.Equals("IE")) {
        browserName = "<font size=2 color='Green'>Internet Explorer";
    }
    
    string browserVer = "<font size=2 color='Green'>" + Request.Browser.MajorVersion.ToString();
    if(Request.Browser.MajorVersion < 6) {
        browserVer = "<font size=2 color='FF000'>" + Request.Browser.Version.ToString();
    }
    
    string browserCookies = "<font size=2 color='FF0000'>No";
    if(Request.Browser.Cookies) { 
    
        HttpCookie testCookie = new HttpCookie("SHRIMPAUCTION","TESTCOOKIE");
        Response.SetCookie(testCookie);

        HttpCookieCollection cookies = Request.Cookies;                 
        
        if(cookies.Get("SHRIMPAUCTION") == null) 
        {
            // Doesnt have cookies turned on
			browserCookies = "<font size=2 color='FF0000'>Yes, but not enabled";            
        } 
        else 
        {
            // Remove Test cookie
            testCookie.Expires = System.DateTime.Now;
            cookies.Set(testCookie);
            cookies.Remove("SHRIMPAUCTION");
            browserCookies = "<font size=2 color='Green'>Yes";
        }
    }

    string browserJS = "<font size=2 color='FF0000'>No";
    if(Request.Browser.JavaScript) { 
		browserJS = "<font size=2 color='Green'>Yes";
    }



%>

<html>
  <head>
    <title>Incompatible browser</title>
    <meta name="GENERATOR" Content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" Content="C#">
    <meta name=vs_defaultClientScript content="JavaScript">
    <meta name=vs_targetSchema content="http://schemas.microsoft.com/intellisense/ie5">
<link rel="stylesheet" href="styles.css"body bgcolor="#D5DDE5"s">


  </head>

<body bgcolor="D5DDE5" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0" MS_POSITIONING="FlowLayout">
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
                  Sorry! Our system has detected that your browser does<br>
                  not support the auction scripting on this site.<br>
                  <a href="http://www.microsoft.com/downloads/details.aspx?FamilyID=1e1550cb-5e5d-48f5-b02b-20b602228de6&amp;DisplayLang=en" target="_blank">Click 
                  here to download Internet Explorer 6.0 FREE at Microsoft </a><br>
                  <br>
                  Please note the following:<br>
                  </b></td>
              </tr>
              <tr align="center"> 
                <td>&nbsp; </td>
              </tr>
            </table>
            <table width="80%" border="0" cellspacing="0" cellpadding="20" align="center">
              <tr align="center" valign="top"> 
                <td> 
                  <hr size="1" noshade>
                  <span class="copy_sm_bold_bl">Incompatible browser </span> 
                  <hr size="1" noshade><BR>
                  <table border="1" width="300">
                    <tr> 
                      <td colspan="2"><font size="2">You are running web browser:</font></td>
                    </tr>
                    <tr> 
                      <td><font size="2">Browser Name:</font></td>
                      <td width="50%"><%=browserName%></td>
                    </tr>
                    <tr> 
                      <td><font size="2">Browser Version:</font></td>
                      <td width="50%"><%=browserVer%></td>
                    </tr>
                    <tr> 
                      <td><font size="2">Browser Cookie Support:</font></td>
                      <td width="50%"><%=browserCookies%></td>
                    </tr>
                    <tr> 
                      <td><font size="2">Browser Javascript Support:</font></td>
                      <td width="50%"><%=browserJS%></td>
                    </tr>
                  </table>
                  <br>
                  <p> 
                  <table border="1" width="300">
                    <tr> 
                      <td colspan="2"><font size="2">Acceptable web browser for 
                        using this site:</font></td>
                    </tr>
                    <tr> 
                      <td><font size="2">Browser Name:</font></td>
                      <td width="50%"><font size="2" color='Green'>Internet Explorer</font></td>
                    </tr>
                    <tr> 
                      <td><font size="2">Browser Version:</font></td>
                      <td width="50%"><font size="2" color='Green'>6.0 or greater</font></td>
                    </tr>
                    <tr> 
                      <td><font size="2">Browser Cookie Support:</font></td>
                      <td width="50%"><font size="2" color='Green'>Yes & Enabled</font></td>
                    </tr>
                    <tr> 
                      <td><font size="2">Browser Javascript Support:</font></td>
                      <td width="50%"><font size="2" color='Green'>Yes & Enabled</font></td>
                    </tr>
                  </table>
                </td>
              </tr>
            </table>
            <table width="100%" border="0" cellspacing="0" cellpadding="20">
              <tr align="center"> 
                <td class="copy_sm_bold_bl"><a href="http://www.microsoft.com/downloads/details.aspx?FamilyID=1e1550cb-5e5d-48f5-b02b-20b602228de6&amp;DisplayLang=en" target="_blank">Click 
                  here to download Internet Explorer 6.0 FREE at Microsoft </a><br>
                  <br>
                  <a href="http://www.microsoft.com/downloads/details.aspx?FamilyID=1e1550cb-5e5d-48f5-b02b-20b602228de6&amp;DisplayLang=en" target="_blank"><img src="images/IE_6_v06.gif" width="91" height="34" border="0"></a> 
                </td>
              </tr>
            </table>
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


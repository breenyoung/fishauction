<%

'******************************************
' ASP Authorization Routines
'******************************************


'==========================================
' Constants
'==========================================

Dim LOGIN_URL,RETURNURL_VAR,COOKIE_VAR

LOGIN_URL = "/admin/default.aspx"
RETURNURL_VAR = "ReturnUrl"
COOKIE_VAR = "ADMINAUTH"

'==========================================
' Main Function
'==========================================

Call CheckAuth()

'==========================================
' Auth Functions
'==========================================

sub CheckAuth()

	if IsCookieValid() = false then
		'Response.Write("not present")
		Dim queryString
		queryString = ""
		if Request.QueryString <> "" Then
			queryString = "?" & Request.QueryString
			queryString = Server.URLEncode(queryString)
		end if
		Response.Redirect(LOGIN_URL & "?" & RETURNURL_VAR & "=" & Request.ServerVariables("PATH_INFO") & queryString)
	'else
		'Response.Write("present")
	end if
end sub


function IsCookieValid()

	' Check if cookie expired
	if Request.Cookies(COOKIE_VAR) = "" OR Request.Cookies(COOKIE_VAR) = "EXPIRED" then
		IsCookieValid = false	
	else  	
		IsCookieValid = true
	end if
	
end function	

function GetLoggedInUser()

	if IsCookieValid() then
		GetLoggedInUser = Request.Cookies(COOKIE_VAR)
	end if

end function
%> 


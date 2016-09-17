<%@ Language = "VBScript"%>

<%
	Response.Cookies("ADMINAUTH") = "EXPIRED"
	Response.Redirect("/admin/default.aspx")
%>

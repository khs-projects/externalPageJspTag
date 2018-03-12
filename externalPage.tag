<%--
///// include the following two lines in a jsp page to use this tag //////////
<%@ include file="/WEB-INF/tiles/include-for-forms.jsp"%>
<%@ taglib prefix="mvm" tagdir="/WEB-INF/tags" %>
--%>
<%--
<%@tag import="com.gargoylesoftware.htmlunit.html.DomNode"%>
<%@tag import="com.gargoylesoftware.htmlunit.html.HtmlPage"%>
<%@tag import="com.gargoylesoftware.htmlunit.WebClient"%>
--%>
<%@tag import="javax.xml.parsers.DocumentBuilderFactory"%>
<%@tag import="javax.xml.parsers.DocumentBuilder"%>
<%@tag import="org.dom4j.DocumentFactory"%>
<%@tag import="java.io.StringReader"%>
<%@tag import="org.dom4j.io.DOMReader"%>
<%@tag import="org.w3c.dom.css.DocumentCSS"%>
<%@tag import="org.w3c.dom.DocumentFragment"%>
<%@tag import="org.w3c.dom.Document"%>
<%@tag import="org.w3c.dom.html.HTMLDivElement"%>
<%@tag import="org.w3c.dom.Node"%>
<%@tag import="java.io.OutputStreamWriter"%>
<%@tag import="java.io.BufferedInputStream"%>
<%@tag import="java.io.BufferedWriter"%>
<%@tag import="java.io.StringWriter"%>
<%@tag import="java.io.InputStreamReader"%>
<%@tag import="java.io.PrintWriter"%>
<%@tag import="java.net.HttpURLConnection"%>
<%@tag import="java.net.URL"%>
<%@ attribute name="src" required="true" %>
<%@ attribute name="selector" required="false" %>
<%
String method="GET",parameterString="",url=src,qs=selector==null?"":selector;
URL u = new URL(url);
HttpURLConnection connection = (HttpURLConnection) u.openConnection();
connection.setRequestMethod(method);
connection.setDefaultUseCaches(false);
connection.setInstanceFollowRedirects(true);
connection.setDoOutput(true);
if (parameterString != null && parameterString.trim().length() == 0) {
	connection.setDoOutput(false);
} else {
	connection.setDoOutput(true);
	PrintWriter osw = new PrintWriter(new OutputStreamWriter(connection.getOutputStream()));
	osw.print(parameterString);
	osw.write(-1);
	osw.close();
}
parameterString = parameterString.trim();
InputStreamReader ins = new InputStreamReader(new BufferedInputStream(connection.getInputStream()));
StringWriter sw = new StringWriter();
BufferedWriter bw = new BufferedWriter(sw);
int i;
while ((i = ins.read()) != -1) {
	bw.write(i);
}
bw.flush();
String rtn=pw.toString();
%><%=rtn %>  

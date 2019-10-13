<%@ page errorPage="/WEB-INF/errorPage.jsp"
        import="com.apress.faq.FaqCategories" %>
<html>
<head>
  <title>Java FAQ Welcome Page</title>
</head>
<body>
  <h1>Java FAQ Welcome Page</h1>
  Welcome to the Java FAQ.Click a link below for answers to the given topic.
<p/>
<%!
public String replaceUnderscore(String s){
    return s.replace(" ", "_" );
}
%>

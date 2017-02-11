<%@page import="org.apache.commons.lang3.StringUtils"%>
<%@page import="jease.cms.domain.News"%>
<%@page import="com.ibm.icu.text.SimpleDateFormat"%>
<%@page import="com.ghasemkiani.util.icu.PersianDateFormat"%>
<%@page import="com.ibm.icu.util.ULocale"%>
<%
	News news = (News) request.getAttribute("Node");
	if (session.getAttribute(news.getPath()) != null) {
		news = (News) session.getAttribute(news.getPath());
	}
%>
<div class="News">
<h1 class="Title"><%=news.getTitle()%></h1>
<% if (StringUtils.isNotBlank(news.getTeaser())) { %>
<p class="Teaser"><%=news.getTeaser()%></p>
<% } %>
<div class="Story"><%=news.getStory()%></div>
</div>
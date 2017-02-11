<%@page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="org.apache.commons.lang3.ArrayUtils"%>
<%@page import="org.apache.commons.lang3.StringUtils"%>
<%@page import="org.apache.commons.lang3.StringEscapeUtils"%>
<%@page import="jease.cms.domain.Content"%>
<%@page import="jease.cms.domain.News"%>
<%@page import="jease.cms.domain.Topic"%>
<%@page import="jease.cms.domain.Folder"%>
<%@page import="jease.site.Navigations"%>
<%@page import="com.ghasemkiani.util.icu.PersianCalendar"%>
<%@page import="com.ibm.icu.text.DateFormat"%>
<%@page import="com.ibm.icu.text.SimpleDateFormat"%>
<%@page import="com.ghasemkiani.util.icu.PersianDateFormat"%>
<%@page import="com.ibm.icu.util.ULocale"%>
<%@page import="java.util.TimeZone"%>

<% 
	Content content = (Content) request.getAttribute("Node"); 
	Content root = (Content) request.getAttribute("Root");
	String pname=content.getPath();
    com.ibm.icu.text.SimpleDateFormat sdf=new PersianDateFormat("YYYY/MM/dd HH:MM");
    com.ibm.icu.text.SimpleDateFormat sdn=new PersianDateFormat("YYYY/MM/dd");
    com.ibm.icu.text.SimpleDateFormat sdy=new PersianDateFormat("YYYY");
	request.setAttribute("pname", pname);

%>
<!DOCTYPE html>
<html lang="fa">

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title><%=Navigations.getPageTitle(content)%></title>

    <!-- Bootstrap Core CSS -->
    <link href="<%=request.getContextPath() %>/site/web/persian/assets/css/bootstrap.min.css" rel="stylesheet">

    <!-- Bootstrap RTL Core CSS -->
    <link href="<%=request.getContextPath() %>/site/web/persian/assets/css/bootstrap-rtl.min.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="<%=request.getContextPath() %>/site/web/persian/assets/css/modern-business.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="<%=request.getContextPath() %>/site/web/persian/assets/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

</head>
<body>
<!-- Navigation -->
    <nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
        <div class="container">
            <!-- Brand and toggle get grouped for better mobile display -->
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand"  href="<%=request.getContextPath() %><%=root.getPath()%>"><%=root.getTitle() %></a>
            </div>
            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                <ul class="nav navbar-nav navbar-right">
                    <% for (Content tab : Navigations.getTabs(root)) { %>
                    					<li<%=content.getPath().startsWith(tab.getPath()) ? " class=\"current\"" : ""%>>
                    						<a href="<%=request.getContextPath() %><%=tab.getPath()%>"><%=tab.getTitle()%></a>
                    					</li>
                    				<% } %>
                </ul>
                <div class="nav navbar-nav navbar-left" >
                                <form action="<%=request.getContextPath() %><%=root.getPath()%>" method="get">
                                                    			<input style="margin-top:12px" type="text" name="query" <% if(request.getParameter("query") != null) { %>value="<%= StringEscapeUtils.escapeHtml4(request.getParameter("query")) %>"<% } else { %>value="جستجو..." onfocus="this.value='';"<% } %> />
                                                    			<input type="hidden" name="page" value="/site/service/Search.jsp" />
                                </form>
                                </div>
                 </div>
            <!-- /.navbar-collapse -->
        </div>
        <!-- /.container -->
    </nav>
    <c:if test="${pname.equals('/index.html')}">
        <!-- Header Carousel -->
        <header id="myCarousel" class="carousel slide">
            <!-- Indicators -->
            <ol class="carousel-indicators">
                <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
                <li data-target="#myCarousel" data-slide-to="1"></li>
                <li data-target="#myCarousel" data-slide-to="2"></li>
                <li data-target="#myCarousel" data-slide-to="3"></li>
                <li data-target="#myCarousel" data-slide-to="4"></li>
            </ol>

            <!-- Wrapper for slides -->
            <div class="carousel-inner">
                <div class="item active">
                    <div class="fill" style="background-image:url('<%=request.getContextPath() %>/site/web/persian/assets/img/slide1.jpg');"></div>
                    <div class="carousel-caption">
                        <h2>عنوان ۱</h2>
                    </div>
                </div>
                <div class="item">
                    <div class="fill" style="background-image:url('<%=request.getContextPath() %>/site/web/persian/assets/img/slide2.jpg');"></div>
                    <div class="carousel-caption">
                        <h2>عنوان ۲</h2>
                    </div>
                </div>
                <div class="item">
                    <div class="fill" style="background-image:url('<%=request.getContextPath() %>/site/web/persian/assets/img/slide3.jpg');"></div>
                    <div class="carousel-caption">
                        <h2>عنوان ۳</h2>
                    </div>
                </div>
    	<div class="item">
                    <div class="fill" style="background-image:url('<%=request.getContextPath() %>/site/web/persian/assets/img/slide4.jpg');"></div>
                    <div class="carousel-caption">
                        <h2>عنوان ۴</h2>
                    </div>
                </div>
    <div class="item">
                    <div class="fill" style="background-image:url('<%=request.getContextPath() %>/site/web/persian/assets/img/slide5.jpg');"></div>
                    <div class="carousel-caption">
                        <h2>عنوان ۵</h2>
                    </div>
                </div>
            </div>

            <!-- Controls -->
            <a class="right carousel-control" href="#myCarousel" data-slide="prev">
                <span class="icon-prev"></span>
            </a>
            <a class="left carousel-control" href="#myCarousel" data-slide="next">
                <span class="icon-next"></span>
            </a>
        </header>
    </c:if>
    <div class="container">
    <c:if test="${!pname.equals('/index.html')}">
    <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">
                    <%=root.getTitle() %>

                    </h1>
                    <ol class="breadcrumb">
                    <% for (Content parent : Navigations.getBreadcrumb(root, content)) { %>
                    					<li> <a href="<%=request.getContextPath() %><%=parent.getPath()%>"><%=parent.getTitle()%></a></li>
                    				<% } %>
                    </ol>
                </div>
    </div>
    </c:if>

        <div class="row">
        <div class="col-lg-12">
        <% pageContext.include((String) request.getAttribute("Page.Template")); %>
        <% Content latestChange = Navigations.getLatestContribution(content); %>
        			آخرین ویرایش در
        			<%=sdf.format(latestChange.getLastModified())%>
        			<% if (latestChange.getEditor() != null) { %>
        				توسط <%=latestChange.getEditor().getName()%>
        			<% }%>
        			<br/>
        			<div id="news">
                    	<%
                    		News[] news = Navigations.getNews((Content) content.getParent());
                    		if(ArrayUtils.isNotEmpty(news)) {
                    			for (News item : news) {
                    	%>
                    			<h2><%=item.getTitle()%></h2>
                    			<% if (item.getDate() != null) { %>
                    				<div class="date"><%=String.format("%tF", item.getDate())%></div>
                    			<%} %>
                    			<% if (StringUtils.isBlank(item.getTeaser())) { %>
                    				<%=item.getStory()%>
                    			<% } else { %>
                    				<p><%=item.getTeaser()%><br />
                    				<a href="<%=request.getContextPath() %><%=item.getPath()%>?print">More...</a>
                    				</p>
                    			<% } %>
                    		<% } %>
                    	<% } %>

                    </div>

                </div>
           </div><!-- /.row -->
    <footer>
                <div class="row">
                    <div class="col-lg-12">
                        <p class="text-center" dir="rtl">
                          طراحی شده توسط <a href="https://github.com/ghaseminya">محمدقاسمی‌نیا</a>
                          |
                           <%@include file="/site/service/Copyright.jsp" %>
                        </p>
                    </div>
                </div>
    </footer>
</div>
        <!-- /.container -->

        <!-- jQuery -->
        <script src="<%=request.getContextPath() %>/site/web/persian/assets/js/jquery.js"></script>

        <!-- Bootstrap Core JavaScript -->
        <script src="<%=request.getContextPath() %>/site/web/persian/assets/js/bootstrap.min.js"></script>

        <!-- Script to Activate the Carousel -->
        <script>
        $('.carousel').carousel({
            interval: 5000 //changes the speed
        })
        </script>


</body>
</html>
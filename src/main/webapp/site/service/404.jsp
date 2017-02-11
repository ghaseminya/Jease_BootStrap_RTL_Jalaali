<%@page import="jease.cms.domain.Content"%>
<%@page import="jease.cms.domain.Topic"%>
<%@page import="org.apache.commons.lang3.ArrayUtils"%>
<%@page import="org.apache.commons.lang3.StringUtils"%>
<%@page import="org.apache.commons.lang3.StringEscapeUtils"%>
<%@page import="jease.site.Navigations"%>
<%@page import="com.ibm.icu.text.SimpleDateFormat"%>
<%@page import="com.ghasemkiani.util.icu.PersianDateFormat"%>
<%@page import="com.ibm.icu.util.ULocale"%>
<%@page import="java.util.Date"%>
<%
	String errorPage = jease.Registry.getParameter(jease.Names.JEASE_SITE_ERROR);
	if (errorPage != null) {
		if (errorPage.startsWith("/")) {
			pageContext.forward(errorPage);
		} else {
			pageContext.forward(((Content) request.getAttribute("Root")).getPath() + "/" + errorPage);
		}
		return;
	}
%>
<%
	Content content = (Content) request.getAttribute("Node");
	Content root = (Content) request.getAttribute("Root");
	ULocale  uLocale = new ULocale("fa_IR");
        com.ibm.icu.text.SimpleDateFormat sdy=new PersianDateFormat("YYYY",uLocale);

%>
<!DOCTYPE html>
<html lang="en">

<head>

    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="description" content="">
        <meta name="author" content="">

        <title>جیز | خطای ۴۰۴</title>

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
                        					<li>
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

    <!-- Page Content -->
    <div class="container">

        <!-- Page Heading/Breadcrumbs -->
        <div class="row">
            <div class="col-lg-12">
                <h1 class="page-header">۴۰۴
                    <small>صفحه مورد نظر یافت نشد.</small>
                </h1>
                <ol class="breadcrumb">
                    <li><a href="http://jease.ir">خانه</a>
                    </li>
                    <li class="active">۴۰۴</li>
                </ol>
            </div>
        </div>
        <!-- /.row -->

        <div class="row">

            <div class="col-lg-12">
                <div class="jumbotron">
                    <h1 class="text-center">
                        <span class="error-404">۴۰۴</span>
                    </h1>
                    <p>صفحه مورد نظر شما یافت نشد. در زیر لینک‌های مفیدی برای شما قرارد اده شده است.</p>
                    <ul>

                </div>
            </div>

        </div>

        <hr>

        <!-- Footer -->
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
    <script src="js/jquery.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="js/bootstrap.min.js"></script>

</body>

</html>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<tiles:importAttribute name="cssList"/>
<tiles:importAttribute name="jsList"/>

<c:if test="${empty sessionScope.usernameStart}">
    <c:redirect url="/admin/login" />
</c:if>

<html>
<head>

	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>${title }</title>
	
	<!-- stylesheets-->
	<c:forEach var="cssValue" items="${cssList}">
        <link type="text/css" rel="stylesheet" href="<c:url value="${cssValue}"/>" />
    </c:forEach>

</head>

<body class="nav-md">
	<div class="container body">
		<div class="main_container">
			<div class="col-md-3 left_col">
				<tiles:insertAttribute name="menuLeft"></tiles:insertAttribute>
			</div>
			
			<!-- top navigation -->
			<div class="top_nav">
				<tiles:insertAttribute name="menu"></tiles:insertAttribute>
			</div>
			<!-- /top navigation -->
			
			<!-- page content -->
			<div class="right_col" role="main">
				<tiles:insertAttribute name="content"></tiles:insertAttribute>
			</div>
			<!-- /page content -->
			
			<!-- footer content -->
			<footer>
				<div class="pull-right">
					Gentelella - Bootstrap Admin Template by <a
						href="https://colorlib.com">Colorlib</a>
				</div>
				<div class="clearfix"></div>
			</footer>
			<!-- /footer content -->
		</div>
	</div>
	
	<!-- scripts-->
	<c:forEach var="jsValue" items="${jsList}">
        <script src="<c:url value="${jsValue}"/>"></script>
    </c:forEach>
	
</body>
</html>
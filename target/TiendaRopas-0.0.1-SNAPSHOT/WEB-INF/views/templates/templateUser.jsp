<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ page import="pe.edu.unsch.service.*"%>
<%@ page
	import="org.springframework.web.servlet.support.RequestContextUtils"%>
<%@ page import="org.springframework.context.ApplicationContext"%>

<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="utf-8">
<meta name="robots" content="all,follow">
<meta name="googlebot" content="index,follow,snippet,archive">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="Obaju e-commerce template">
<meta name="author" content="Ondrej Svestka | ondrejsvestka.cz">
<meta name="keywords" content="">

<title>${title}</title>

<meta name="keywords" content="">

<link
	href='http://fonts.googleapis.com/css?family=Roboto:400,500,700,300,100'
	rel='stylesheet' type='text/css'>

<!-- styles -->
<link
	href="${pageContext.request.contextPath }/assets/user/css/font-awesome.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath }/assets/user/css/bootstrap.min.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath }/assets/user/css/animate.min.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath }/assets/user/css/owl.carousel.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath }/assets/user/css/owl.theme.css"
	rel="stylesheet">

<!-- theme stylesheet -->
<link
	href="${pageContext.request.contextPath }/assets/user/css/style.default.css"
	rel="stylesheet" id="theme-stylesheet">

<!-- your stylesheet with modifications -->
<link
	href="${pageContext.request.contextPath }/assets/user/css/custom.css"
	rel="stylesheet">

<script
	src="${pageContext.request.contextPath }/assets/user/js/respond.min.js"></script>

<link rel="shortcut icon" href="favicon.png">



</head>

<body>
	<%
		ApplicationContext applicationContext = RequestContextUtils.getWebApplicationContext(request);
		CategoryService categoryService = (CategoryService) applicationContext.getBean("categoryService");
	%>
	<!-- *** TOPBAR ***
 _________________________________________________________ -->
	<div id="top">
		<div class="container">
			<div class="col-md-6 offer" data-animate="fadeInDown">
				<a href="#" class="btn btn-success btn-sm"
					data-animate-hover="shake">Offer of the day</a> <a href="#">Get
					flat 35% off on orders over $50!</a>
			</div>
			<div class="col-md-6" data-animate="fadeInDown">
				<ul class="menu">
					<li><a href="#" data-toggle="modal" data-target="#login-modal">Login</a>
					</li>
					<li><a href="register.html">Register</a></li>
					<li><a href="${pageContext.request.contextPath }/contact.htm" onclick="">Contact</a></li>
					<li><a href="#">Recently viewed</a></li>
				</ul>
			</div>
		</div>
		<div class="modal fade" id="login-modal" tabindex="-1" role="dialog"
			aria-labelledby="Login" aria-hidden="true">
			<div class="modal-dialog modal-sm">

				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-hidden="true">&times;</button>
						<h4 class="modal-title" id="Login">Customer login</h4>
					</div>
					<div class="modal-body">
						<form action="customer-orders.html" method="post">
							<div class="form-group">
								<input type="text" class="form-control" id="email-modal"
									placeholder="email">
							</div>
							<div class="form-group">
								<input type="password" class="form-control" id="password-modal"
									placeholder="password">
							</div>

							<p class="text-center">
								<button class="btn btn-primary">
									<i class="fa fa-sign-in"></i> Log in
								</button>
							</p>

						</form>

						<p class="text-center text-muted">Not registered yet?</p>
						<p class="text-center text-muted">
							<a href="register.html"><strong>Register now</strong></a>! It is
							easy and done in 1&nbsp;minute and gives you access to special
							discounts and much more!
						</p>

					</div>
				</div>
			</div>
		</div>

	</div>

	<!-- *** TOP BAR END *** -->

	<!-- *** NAVBAR ***
 _________________________________________________________ -->

	<div class="navbar navbar-default yamm" role="navigation" id="navbar">
		<div class="container">
			<div class="navbar-header">

				<a class="navbar-brand home" href="${pageContext.request.contextPath }/home.htm"
					data-animate-hover="bounce"> <img
					src="${pageContext.request.contextPath }/assets/user/img/logo.png"
					alt="Obaju logo" class="hidden-xs"> <img
					src="${pageContext.request.contextPath }/assets/user/img/logo-small.png"
					alt="Obaju logo" class="visible-xs"><span class="sr-only">Obaju
						- go to homepage</span>
				</a>
				<div class="navbar-buttons">
					<button type="button" class="navbar-toggle" data-toggle="collapse"
						data-target="#navigation">
						<span class="sr-only">Toggle navigation</span> <i
							class="fa fa-align-justify"></i>
					</button>
					<button type="button" class="navbar-toggle" data-toggle="collapse"
						data-target="#search">
						<span class="sr-only">Toggle search</span> <i class="fa fa-search"></i>
					</button>
					<a class="btn btn-default navbar-toggle" href="basket.html"> <i
						class="fa fa-shopping-cart"></i> <span class="hidden-xs">3
							items in cart</span>
					</a>
				</div>
			</div>
			<!--/.navbar-header -->

			<div class="navbar-collapse collapse" id="navigation">
				<ul class="nav navbar-nav navbar-left">
					<li ${action eq 'home' ? 'class="active"' : '' }><a href="${pageContext.request.contextPath }/home.htm">Home</a></li>
					<c:forEach var="category1" items="<%=categoryService.findAll()%>">
						<li class="dropdown yamm-fw"><a href="#"
							class="dropdown-toggle" data-toggle="dropdown"
							data-hover="dropdown" data-delay="200">${category1.name }<b
								class="caret"></b></a> <c:if
								test="${category1.categories.size() > 0 }">
								<ul class="dropdown-menu">
									<li>
										<div class="yamm-content">
											<div class="row">
												<c:forEach var="category2" items="${category1.categories }">
													<div class="col-sm-3">
														<h5>${category2.name }</h5>
														<c:if test="${category2.categories.size() > 0 }">
															<ul>
																<c:forEach var="category3"
																	items="${category2.categories }">
																	<li><a
																		href="${pageContext.request.contextPath }/product/category/${category3.idcategory }.htm">${category3.name }</a>
																	</li>
																</c:forEach>
															</ul>
														</c:if>
													</div>
												</c:forEach>
											</div>
										</div> <!-- /.yamm-content -->
									</li>
								</ul>
							</c:if></li>
					</c:forEach>
				</ul>

			</div>
			<!--/.nav-collapse -->

			<div class="navbar-buttons">

				<div class="navbar-collapse collapse right" id="basket-overview">
					<a href="${pageContext.request.contextPath}/cart.htm" class="btn btn-primary navbar-btn"><i
						class="fa fa-shopping-cart"></i><span class="hidden-sm">${sessionScope.cart.size() }
							items in cart</span></a>
				</div>
				<!--/.nav-collapse -->

				<div class="navbar-collapse collapse right" id="search-not-mobile">
					<button type="button" class="btn navbar-btn btn-primary"
						data-toggle="collapse" data-target="#search">
						<span class="sr-only">Toggle search</span> <i class="fa fa-search"></i>
					</button>
				</div>

			</div>

			<div class="collapse clearfix" id="search">

				<form class="navbar-form" role="search">
					<div class="input-group">
						<input type="hidden" id="path" value="${pageContext.request.contextPath }">
						<input type="text" class="form-control" placeholder="Search" id="textName">
						<span class="input-group-btn">

							<button type="submit" class="btn btn-primary" id="btnSearch">
								<i class="fa fa-search"></i>
							</button>

						</span>
					</div>
				</form>

			</div>
			<!--/.nav-collapse -->

		</div>
		<!-- /.container -->
	</div>
	<!-- /#navbar -->

	<!-- *** NAVBAR END *** -->



	<div id="all">

		<div id="content">
			<tiles:insertAttribute name="content"></tiles:insertAttribute>
		</div>
		<!-- /#content -->

		<!-- *** FOOTER ***
 _________________________________________________________ -->
		<div id="footer" data-animate="fadeInUp">
			<div class="container">
				<div class="row">
					<div class="col-md-3 col-sm-6">
						<h4>Pages</h4>

						<ul>
							<li><a href="text.html">About us</a></li>
							<li><a href="text.html">Terms and conditions</a></li>
							<li><a href="faq.html">FAQ</a></li>
							<li><a href="contact.html">Contact us</a></li>
						</ul>

						<hr>

						<h4>User section</h4>

						<ul>
							<li><a href="#" data-toggle="modal"
								data-target="#login-modal">Login</a></li>
							<li><a href="register.html">Regiter</a></li>
						</ul>

						<hr class="hidden-md hidden-lg hidden-sm">

					</div>
					<!-- /.col-md-3 -->

					<div class="col-md-3 col-sm-6">

						<h4>Top categories</h4>

						<h5>Men</h5>

						<ul>
							<li><a href="category.html">T-shirts</a></li>
							<li><a href="category.html">Shirts</a></li>
							<li><a href="category.html">Accessories</a></li>
						</ul>

						<h5>Ladies</h5>
						<ul>
							<!-- <li><a href="category.html">T-shirts</a></li>
							<li><a href="category.html">Skirts</a></li>
							<li><a href="category.html">Pants</a></li>
							<li><a href="category.html">Accessories</a></li> -->
							<%-- <c:forEach var="category" items="<%= categoryService.findAll() %>">
                                <li><a href="${pageContext.request.contextPath }/product/category/${category.idcategory}.htm">${category.name }</a></li>
                            </c:forEach>  --%>
							<%-- <c:forEach var="category1" items="<%= categoryService.findAll() %>">
                            	<li>${category1.name }
                            		<c:if test="${category1.categories.size() > 0 }">
                            			<ul>
                            				<c:forEach var="category2" items="${category1.categories }">
                            					${category2.name }
                            				</c:forEach>
                            			</ul>
                            		</c:if>
                            	</li>
                            </c:forEach> --%>
						</ul>

						<hr class="hidden-md hidden-lg">

					</div>
					<!-- /.col-md-3 -->

					<div class="col-md-3 col-sm-6">

						<h4>Where to find us</h4>

						<p>
							<strong>Obaju Ltd.</strong> <br>13/25 New Avenue <br>New
							Heaven <br>45Y 73J <br>England <br> <strong>Great
								Britain</strong>
						</p>

						<a href="contact.html">Go to contact page</a>

						<hr class="hidden-md hidden-lg">

					</div>
					<!-- /.col-md-3 -->



					<div class="col-md-3 col-sm-6">

						<h4>Get the news</h4>

						<p class="text-muted">Pellentesque habitant morbi tristique
							senectus et netus et malesuada fames ac turpis egestas.</p>

						<form>
							<div class="input-group">

								<input type="text" class="form-control"> <span
									class="input-group-btn">

									<button class="btn btn-default" type="button">Subscribe!</button>

								</span>

							</div>
							<!-- /input-group -->
						</form>

						<hr>

						<h4>Stay in touch</h4>

						<p class="social">
							<a href="#" class="facebook external" data-animate-hover="shake"><i
								class="fa fa-facebook"></i></a> <a href="#" class="twitter external"
								data-animate-hover="shake"><i class="fa fa-twitter"></i></a> <a
								href="#" class="instagram external" data-animate-hover="shake"><i
								class="fa fa-instagram"></i></a> <a href="#" class="gplus external"
								data-animate-hover="shake"><i class="fa fa-google-plus"></i></a>
							<a href="#" class="email external" data-animate-hover="shake"><i
								class="fa fa-envelope"></i></a>
						</p>


					</div>
					<!-- /.col-md-3 -->

				</div>
				<!-- /.row -->

			</div>
			<!-- /.container -->
		</div>
		<!-- /#footer -->

		<!-- *** FOOTER END *** -->




		<!-- *** COPYRIGHT ***
 _________________________________________________________ -->
		<div id="copyright">
			<div class="container">
				<div class="col-md-6">
					<p class="pull-left">� 2015 Your name goes here.</p>

				</div>
				<div class="col-md-6">
					<p class="pull-right">
						Template by <a
							href="https://bootstrapious.com/e-commerce-templates">Bootstrapious</a>
						& <a href="https://fity.cz">Fity</a>
						<!-- Not removing these links is part of the license conditions of the template. Thanks for understanding :) If you want to use the template without the attribution links, you can do so after supporting further themes development at https://bootstrapious.com/donate  -->
					</p>
				</div>
			</div>
		</div>
		<!-- *** COPYRIGHT END *** -->



	</div>
	<!-- /#all -->




	<!-- *** SCRIPTS TO INCLUDE ***
 _________________________________________________________ -->
	<script
		src="${pageContext.request.contextPath }/assets/user/js/jquery-1.11.0.min.js"></script>
	<script
		src="${pageContext.request.contextPath }/assets/user/js/bootstrap.min.js"></script>
	<script
		src="${pageContext.request.contextPath }/assets/user/js/jquery.cookie.js"></script>
	<script
		src="${pageContext.request.contextPath }/assets/user/js/waypoints.min.js"></script>
	<script
		src="${pageContext.request.contextPath }/assets/user/js/modernizr.js"></script>
	<script
		src="${pageContext.request.contextPath }/assets/user/js/bootstrap-hover-dropdown.js"></script>
	<script
		src="${pageContext.request.contextPath }/assets/user/js/owl.carousel.min.js"></script>
	<script
		src="${pageContext.request.contextPath }/assets/user/js/front.js"></script>


<script type="text/javascript">
	$(document).ready(function () {
	    $("#navigation ul li a").click(function () {
	        $("#navigation").removeClass("active");
	        $(this).addClass("active");
	    });
	    
	    var path = $("#path").val();
	    $('#btnSearch').click(function(event) {
	    	//event.preventDefault();
	    	var url = path + "/product/search/json/search";
	    	alert(url);
	    	$.ajax({
	    		url: '<c:url value="/product/search.htm" />',
	    		data: { term: $("#textName").val()},
	    		success: function (data, status) {
	    			window.location.href = '<c:url value="/product/search.htm" />' + '?term=' + $("#textName").val();
	    			alert("ajax 1: " + status + " url: " + url);
	    			$.ajax({ 
	                    url: url, 
	                    data: { term: $("#textName").val()}, 
	                    success: function (data, status) { 
	                    	alert ("Success llamada 2: " + status);
	                        
	                    },
	                    error: function(data,status,er) {
	    	            	alert("error1: "+data+" status1: "+status+" er1: "+er);
	    	            },
	                });
	    		},
	            error: function(data,status,er) {
	            	alert("error: "+data+" status: "+status+" er:"+er);
	            },
	    	});
	    });
	});
</script>

</body>

</html>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="container">

	<div class="col-md-12">
		<ul class="breadcrumb">
			<li><a href="#">Home</a></li>
			<li>Ladies</li>
		</ul>
	</div>

	<div class="col-md-3">
		<!-- *** MENUS AND FILTERS ***
 _________________________________________________________ -->
		<div class="panel panel-default sidebar-menu">

			<div class="panel-heading">
				<h3 class="panel-title">Categories</h3>
			</div>

			<div class="panel-body">
				<ul class="nav nav-pills nav-stacked category-menu">
					<c:forEach var="category1" items="${categories }">
						<li><a href="category.html">${category1.name } <span
								class="badge pull-right">42</span></a> <c:if
								test="${category1.categories.size() > 0 }">
								<ul>
									<c:forEach var="category2" items="${category1.categories }">
										<c:if test="${category2.categories.size() > 0 }">
											<c:forEach var="category3" items="${category2.categories }">
												<li><a
													href="${pageContext.request.contextPath }/product/category/${category3.idcategory }.htm">${category3.name }</a></li>
											</c:forEach>
										</c:if>
									</c:forEach>
								</ul>
							</c:if></li>
					</c:forEach>
				</ul>

			</div>
		</div>

		<div class="panel panel-default sidebar-menu">

			<div class="panel-heading">
				<h3 class="panel-title">
					Brands <a class="btn btn-xs btn-danger pull-right" href="#"><i
						class="fa fa-times-circle"></i> Clear</a>
				</h3>
			</div>

			<div class="panel-body">

				<form>
					<div class="form-group">
						<c:forEach var="brand" items="${brands }">
							<div class="checkbox">
								<label> <input type="checkbox">${brand.name }
									(10)
								</label>
							</div>
						</c:forEach>
					</div>

					<button class="btn btn-default btn-sm btn-primary">
						<i class="fa fa-pencil"></i> Apply
					</button>

				</form>

			</div>
		</div>

		<div class="panel panel-default sidebar-menu">

			<div class="panel-heading">
				<h3 class="panel-title">
					Colours <a class="btn btn-xs btn-danger pull-right" href="#"><i
						class="fa fa-times-circle"></i> Clear</a>
				</h3>
			</div>

			<div class="panel-body">

				<form>
					<div class="form-group">
						<c:forEach var="colour" items="${colours }">
							<div class="checkbox">
								<label> <input type="checkbox"> <span
									class="colour ${colour.name }"></span> ${colour.name } (14)
								</label>
							</div>
						</c:forEach>
					</div>

					<button class="btn btn-default btn-sm btn-primary">
						<i class="fa fa-pencil"></i> Apply
					</button>

				</form>

			</div>
		</div>

		<!-- *** MENUS AND FILTERS END *** -->

		<div class="banner">
			<a href="#"> <img
				src="${pageContext.request.contextPath }/assets/user/img/banner.jpg"
				alt="sales 2014" class="img-responsive">
			</a>
		</div>
	</div>

	<div class="col-md-9">
		<div class="box">
			<h1>Ladies</h1>
			<p>In our Ladies department we offer wide selection of the best
				products we have found and carefully selected worldwide.</p>
		</div>

		<div class="box info-bar">
			<div class="row">
				<div class="col-sm-12 col-md-4 products-showing">
					Showing <strong>12</strong> of <strong>25</strong> products
				</div>

				<div class="col-sm-12 col-md-8  products-number-sort">
					<div class="row">
						<form class="form-inline">
							<div class="col-md-6 col-sm-6">
								<div class="products-number">
									<strong>Show</strong> <a href="#"
										class="btn btn-default btn-sm btn-primary">12</a> <a href="#"
										class="btn btn-default btn-sm">24</a> <a href="#"
										class="btn btn-default btn-sm">All</a> products
								</div>
							</div>
							<div class="col-md-6 col-sm-6">
								<div class="products-sort-by">
									<strong>Sort by</strong> <select name="sort-by"
										class="form-control">
										<option>Price</option>
										<option>Name</option>
										<option>Sales first</option>
									</select>
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>

		<div class="row products">
			<c:forEach var="product" items="${products }">
				<div class="col-md-4 col-sm-6">
					<div class="product">
						<div class="flip-container">
							<div class="flipper">
								<div class="front">
									<a href="detail.html"> <img
										src="${pageContext.request.contextPath }/assets/user/img/${product.urlimage}"
										alt="" class="img-responsive">
									</a>
								</div>
								<div class="back">
									<a
										href="${pageContext.request.contextPath }/product/detail/${product.idproduct}.htm">
										<img
										src="${pageContext.request.contextPath }/assets/user/img/${product.urlimage}"
										alt="" class="img-responsive">
									</a>
								</div>
							</div>
						</div>
						<a href="detail.html" class="invisible"> <img
							src="${pageContext.request.contextPath }/assets/user/img/${product.urlimage}"
							alt="" class="img-responsive">
						</a>
						<div class="text">
							<h3>
								<a
									href="${pageContext.request.contextPath }/product/detail/${product.idproduct}.htm">${product.name}</a>
							</h3>
							<p class="price">$${product.price}</p>
							<p class="buttons">
								<a
									href="${pageContext.request.contextPath }/product/detail/${product.idproduct}.htm"
									class="btn btn-default">View detail</a> <a href="${pageContext.servletContext.contextPath }/cart/buy/${product.idproduct}.htm"
									class="btn btn-primary"><i class="fa fa-shopping-cart"></i>Add
									to cart</a>
							</p>
						</div>
						<!-- /.text -->
					</div>
					<!-- /.product -->
				</div>
			</c:forEach>
		</div>

		<!-- /.products -->

		<div class="pages">

			<p class="loadMore">
				<a href="#" class="btn btn-primary btn-lg"><i
					class="fa fa-chevron-down"></i> Load more</a>
			</p>

			<ul class="pagination">
				<li><a href="#">«</a></li>
				<li class="active"><a href="#">1</a></li>
				<li><a href="#">2</a></li>
				<li><a href="#">3</a></li>
				<li><a href="#">4</a></li>
				<li><a href="#">5</a></li>
				<li><a href="#">»</a></li>
			</ul>
		</div>


	</div>
	<!-- /.col-md-9 -->
</div>
<!-- /.container -->
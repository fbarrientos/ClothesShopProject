
<div class="left_col scroll-view">
	<div class="navbar nav_title" style="border: 0;">
		<a href="index.html" class="site_title"><i class="fa fa-paw"></i>
			<span>Gentellela Alela!</span></a>
	</div>

	<div class="clearfix"></div>

	<!-- menu profile quick info -->
	<div class="profile">
		<div class="profile_pic">
			<img
				src="${pageContext.request.contextPath }/assets/admin/images/img.jpg"
				alt="..." class="img-circle profile_img">
		</div>
		<div class="profile_info">
			<span>Bienvenido,</span>
			<h2>${sessionScope.usernameStart}</h2>
		</div>
	</div>
	<!-- /menu profile quick info -->

	<br />

	<!-- sidebar menu -->
	<div id="sidebar-menu" class="main_menu_side hidden-print main_menu">
		<div class="menu_section">
			<h3>General</h3>
			<ul class="nav side-menu">
				<li><a><i class="fa fa-th-list"></i> Pedidos <span
						class="fa fa-chevron-down"></span></a>
					<ul class="nav child_menu">
						<li><a href="#">Pedidos</a></li>
						<li><a href="#">Facturas</a></li>
						<li><a href="#">Carritos de compra</a></li>
					</ul></li>
				<li><a><i class="fa fa-clone"></i> Cat�logo <span
						class="fa fa-chevron-down"></span></a>
					<ul class="nav child_menu">
						<li><a
							href="${pageContext.request.contextPath }/admin/category">Categor�as</a></li>
						<li><a href="#">Productos</a></li>
						<li><a href="#">Proveedores</a></li>
						<li><a href="#">Descuentos</a></li>
						<li><a href="#">Stocks</a></li>
					</ul></li>
				<li><a><i class="fa fa-globe"></i> Clientes <span
						class="fa fa-chevron-down"></span></a>
					<ul class="nav child_menu">
						<li><a href="#">Clientes</a></li>
						<li><a href="#">Direcciones</a></li>
					</ul></li>
				<li><a><i class="fa fa-phone"></i> Servicio al Cliente <span
						class="fa fa-chevron-down"></span></a>
					<ul class="nav child_menu">
						<li><a href="#">Mensajes de pedidos</a></li>
						<li><a href="#">Devoluciones</a></li>
					</ul></li>
				<li><a><i class="fa fa-bar-chart-o"></i> Estad�sticas<span
						class="fa fa-chevron-down"></span></a>
					<ul class="nav child_menu">
						<li><a href="#">Productos m�s vendidos</a></li>
						<li><a href="#">Cantidades disponibles</a></li>
						<li><a href="#">Mejores clientes</a></li>
						<li><a href="#">Ventas y pedidos</a></li>
					</ul></li>
			</ul>
		</div>

	</div>
	<!-- /sidebar menu -->

	<!-- /menu footer buttons -->
	<div class="sidebar-footer hidden-small">
		<a data-toggle="tooltip" data-placement="top" title="Settings"> <span
			class="glyphicon glyphicon-cog" aria-hidden="true"></span>
		</a> <a data-toggle="tooltip" data-placement="top" title="FullScreen">
			<span class="glyphicon glyphicon-fullscreen" aria-hidden="true"></span>
		</a> <a data-toggle="tooltip" data-placement="top" title="Lock"> <span
			class="glyphicon glyphicon-eye-close" aria-hidden="true"></span>
		</a> <a data-toggle="tooltip" data-placement="top" title="Logout"> <span
			class="glyphicon glyphicon-off" aria-hidden="true"></span>
		</a>
	</div>
	<!-- /menu footer buttons -->
</div>
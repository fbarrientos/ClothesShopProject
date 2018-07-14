<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="">
	<div class="page-title">
		<div class="title_left">
			<h3>
				Administrar categorías <small>Agregar, modificar y eliminar
					categorías</small>
			</h3>
		</div>
	</div>

	<div class="clearfix"></div>

	<div class="row">
		<div class="col-md-12 col-sm-12 col-xs-12">
			<div class="x_panel">
				<div class="x_title">
					<h2>Listado de categorías</h2>
					<input type="hidden" id="path"
						value="${pageContext.request.contextPath }">
					<ul class="nav navbar-right panel_toolbox">
						<li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
						</li>
						<li class="dropdown"><a href="#" class="dropdown-toggle"
							data-toggle="dropdown" role="button" aria-expanded="false"><i
								class="fa fa-wrench"></i></a>
							<ul class="dropdown-menu" role="menu">
								<li><a href="#">Settings 1</a></li>
								<li><a href="#">Settings 2</a></li>
							</ul></li>
						<li><a class="close-link"><i class="fa fa-close"></i></a></li>
					</ul>
					<div class="clearfix"></div>
				</div>
				<div class="x_content">
					<table id="tblCategory" class="table table-striped table-bordered">
						<thead>
							<tr>
								<th>Código</th>
								<th>Categoría</th>
								<th>Estado</th>
								<th>Padre</th>
								<th>Acción</th>
							</tr>
						</thead>
					</table>
				</div>
			</div>
		</div>
	</div>

	<div class="row">
		<div class="col-md-12 col-sm-12 col-xs-12">
			<div class="x_panel">
				<div class="x_title">
					<h2>
						Agregar categoría <small>(Agregar y actualizar categorías)</small>
					</h2>
					<ul class="nav navbar-right panel_toolbox">
						<li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
						</li>
						<li class="dropdown"><a href="#" class="dropdown-toggle"
							data-toggle="dropdown" role="button" aria-expanded="false"><i
								class="fa fa-wrench"></i></a>
							<ul class="dropdown-menu" role="menu">
								<li><a href="#">Settings 1</a></li>
								<li><a href="#">Settings 2</a></li>
							</ul></li>
						<li><a class="close-link"><i class="fa fa-close"></i></a></li>
					</ul>
					<div class="clearfix"></div>
				</div>
				<div class="x_content">

					<form id="formCategory" class="form-horizontal form-label-left" novalidate>

						<div class="form-group">
							<label class="control-label col-md-3 col-sm-3 col-xs-12"
								for="name">Name <span class="required">*</span>
							</label>
							<div class="col-md-6 col-sm-6 col-xs-12">
								<input id="name" class="form-control col-md-7 col-xs-12"
									data-validate-length-range="6" data-validate-words="2"
									name="name" required="required" type="text">
							</div>
						</div>
						<div class="form-group">
							<label class="control-label col-md-3 col-sm-3 col-xs-12"
								for="padre">Categoría padre <span class="required">*</span>
							</label>
							<div class="col-md-6 col-sm-6 col-xs-12">
								<select class="select2_group form-control" id="parentid" name="parentid">
									<option value="-1">SELECCIONE</option>
									<c:forEach var="category1" items="${categories}">
										<optgroup label="${category1.name }">
											<c:if test="${category1.categories.size() > 0 }">
												<c:forEach var="category2" items="${category1.categories }">
													<option value="${category2.idcategory }">${category2.name }</option>
													<c:if test="${category2.categories.size() > 0 }">
														<c:forEach var="category3" items="${category2.categories }">
															<option value="${category3.idcategory }">&nbsp &nbsp ${category3.name }</option>
														</c:forEach>
													</c:if>								
												</c:forEach>
											</c:if>
										</optgroup>
									</c:forEach>
								</select>
							</div>
						</div>
						<div class="form-group">
							<label class="control-label col-md-3 col-sm-3 col-xs-12">Estado
								<span class="required">*</span>
							</label>
							<div class="col-md-6 col-sm-6 col-xs-12">
								<div class="btn-group" data-toggle="buttons">
									<label class="btn btn-default" data-toggle-class="btn-primary"
										data-toggle-passive-class="btn-default"> 
										<input type="radio" name="gender" value="0"> &nbsp; Inactivo &nbsp;
									</label> 
									<label class="btn btn-default" data-toggle-class="btn-primary"
										data-toggle-passive-class="btn-default"> 
										<input type="radio" name="gender" value="1"> Activo
									</label>
									<input type="hidden" id="status" name="status" />
								</div>
							</div>
						</div>
						<div class="ln_solid"></div>
						<div class="form-group">
							<div class="col-md-6 col-md-offset-3">
								<button type="submit" class="btn btn-primary">Cancelar</button>
								<button id="btnSave" type="submit" class="btn btn-success">Guardar</button>
							</div>
						</div>
						<div id="divMessage"></div>
					</form>
				</div>
			</div>
		</div>
	</div>
</div>
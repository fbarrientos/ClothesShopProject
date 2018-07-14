<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	
<%@  taglib  prefix="s" uri="http://www.springframework.org/tags/form" %>

<div class="container">

	<div class="col-md-12">

		<ul class="breadcrumb">
			<li><a href="#">Home</a></li>
			<li>New account / Sign in</li>
		</ul>

	</div>

	<div class="col-md-6">
		<div class="box">
			<h1>New account</h1>

			<p class="lead">Not our registered customer yet?</p>
			<p>With registration with us new world of fashion, fantastic
				discounts and much more opens to you! The whole process will not
				take you more than a minute!</p>
			<p class="text-muted">
				If you have any questions, please feel free to <a
					href="${pageContext.request.contextPath }/contact.htm">contact us</a>, our customer service center is
				working for you 24/7.
			</p>

			<hr>
			
			<s:form action="${pageContext.request.contextPath }/account/register.htm" method="post" commandName="account">
				<div class="form-group">
					<label for="name">Name</label> 
					<s:input path="name" class="form-control" id="name"/>
				</div>
				<div class="form-group">
					<label for="email">Email</label> 
					<s:input path="email" class="form-control" id="email"/>
				</div>
				<div class="form-group">
					<label for="username">Username</label> 
					<s:input path="username" class="form-control" id="username"/>
				</div>
				<div class="form-group">
					<label for="password">Password</label> 
					<s:password path="password" class="form-control" id="password"/>
				</div>
				<div class="text-center">
					<button type="submit" class="btn btn-primary">
						<i class="fa fa-user-md"></i> Register
					</button>
				</div>
			</s:form>
			${message }
		</div>
	</div>
	<div class="col-md-6">
		<div class="box">
			<h1>Login</h1>

			<p class="lead">Already our customer?</p>
			<p class="text-muted">Pellentesque habitant morbi tristique
				senectus et netus et malesuada fames ac turpis egestas. Vestibulum
				tortor quam, feugiat vitae, ultricies eget, tempor sit amet, ante.
				Donec eu libero sit amet quam egestas semper. Aenean ultricies mi
				vitae est. Mauris placerat eleifend leo.</p>

			<hr>

			<form action="${pageContext.request.contextPath}/account/myaccount.htm" method="post">
				<div class="form-group">
					<label for="username">Username</label> <input type="text"
						class="form-control" name="username">
				</div>
				<div class="form-group">
					<label for="password">Password</label> <input type="password"
						class="form-control" name="password">
				</div>
				<div class="text-center">
					<button type="submit" class="btn btn-primary">
						<i class="fa fa-sign-in"></i> Log in
					</button>
				</div>
			</form>
			${error}
		</div>
	</div>

</div>
<!-- /.container -->

<%@ page import="retail.Product" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'product.label', default: 'Product')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-product" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="products" action="list">Continue Shopping</g:link></li>
				<li><g:link class="basket" controller="basket">Basket</g:link></li>
			</ul>
		</div>
		<div id="show-customerOrder" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list product">
				<g:if test="${productInstance?.description}">
					<li class="fieldcontain">
						<span id="description-label" class="property-label"><g:message code="product.description.label" default="Description" /></span>
						<span class="property-value" aria-labelledby="description-label"><g:fieldValue bean="${productInstance}" field="description"/></span>
					</li>
				</g:if>
			
				<g:if test="${productInstance?.name}">
					<li class="fieldcontain">
						<span id="name-label" class="property-label"><g:message code="product.name.label" default="Name" /></span>
						<span class="property-value" aria-labelledby="name-label"><g:fieldValue bean="${productInstance}" field="name"/></span>
					</li>
				</g:if>
			
				<g:if test="${productInstance?.price}">
					<li class="fieldcontain">
						<span id="price-label" class="property-label"><g:message code="product.price.label" default="Price" /></span>
						<span class="property-value" aria-labelledby="price-label">
							<g:formatNumber number="${productInstance.price/100}" type="currency" currencyCode="GBP" />
						</span>
					</li>
				</g:if>
			</ol>
			<g:form controller="basket" action="add" >
				<fieldset class="buttons">
					<g:hiddenField name="sku" value="${productInstance?.sku}" />
					<g:submitButton name="add" class="add_to_cart" value="${message(code: 'default.basket.add.label', default: 'Add to basket')}" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>

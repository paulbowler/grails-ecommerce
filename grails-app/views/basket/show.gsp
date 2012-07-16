<%@ page import="retail.Basket" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'basket.label', default: 'Basket')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-basket" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="products" controller="product">Continue Shopping</g:link></li>
				<g:if test="${basket?.basketItems}">
					<li><g:link class="checkout" controller="checkout">Checkout</g:link></li>
				</g:if>
			</ul>
		</div>
		<div id="list-basketItem" class="content scaffold-list" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<g:if test="${basket?.basketItems}">
			<g:form name="cartForm" action="update">
				<table>
					<thead>
						<tr>
							<th><g:message code="basketItem.product.label" default="Product" /></th>
							<g:sortableColumn property="quantity" title="${message(code: 'basketItem.quantity.label', default: 'Quantity')}" />
							<th>Price</th>
						</tr>
					</thead>
					<tbody>
						<fieldset class="form">
							<g:each in="${basket.basketItems}" status="i" var="basketItem">
								<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
									<td>${fieldValue(bean: basketItem, field: "product.name")}</td>
									<td><g:field type="number" name="sku-${basketItem.product.sku}" min="0" step="1" value="${basketItem.quantity}"/></td>
									<td>
										<g:formatNumber number="${basketItem.quantity * basketItem.product.price/100}" type="currency" currencyCode="GBP" />
									</td>
								</tr>
							</g:each>
						</fieldset>						
					</tbody>
				</table>
				<fieldset class="buttons">
					<g:submitButton name="update" class="update_cart" value="${message(code: 'default.basket.update.label', default: 'Update basket')}" />
				</fieldset>
			</g:form>
			</g:if>
		</div>
	</body>
</html>

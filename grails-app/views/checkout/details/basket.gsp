<%@ page import="retail.Basket" %>

<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'basket.label', default: 'Basket')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="basket" controller="basket">Basket</g:link></li>
			</ul>
		</div>
		<div id="list-basketItem" class="content scaffold-list" role="main">
			<h1>Checkout Basket</h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<g:form name="basketForm" action="details">
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
									<td>${basketItem.quantity}</td>
									<td><g:formatNumber number="${basketItem.quantity * basketItem.product.price/100}" type="currency" currencyCode="GBP" /></td>
								</tr>
							</g:each>
						</fieldset>
					</tbody>
				</table>
				<fieldset class="buttons">
					<g:submitButton name="address" class="next" value="${message(code: 'default.button.next.label', default: 'Delivery Address')}" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>


<%@ page import="retail.CustomerOrder" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'customerOrder.label', default: 'CustomerOrder')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-customerOrder" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="account" controller="account">My Account</g:link></li>
			</ul>
		</div>
		<div id="show-customerOrder" class="content scaffold-show" role="main">
			<h1>Customer Order ${theOrder.id}</h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
						<th><g:message code="Address.line1.label" default="Delivery Address" /></th>
						<th><g:message code="Address.line1.label" default="Invoice Address" /></th>
					</tr>
				</thead>
				<tbody>
					<fieldset class="form">
						<tr class="odd">
							<td>${theOrder.delivery.name}<br/>${theOrder.delivery.line1}<br/>${theOrder.delivery.city}<br/>${theOrder.delivery.county}<br/>
							${theOrder.delivery.postcode}<br/>${theOrder.delivery.country}</td>
							<td>${theOrder.invoice.name}<br/>${theOrder.invoice.line1}<br/>${theOrder.invoice.city}<br/>${theOrder.invoice.county}<br/>
							${theOrder.invoice.postcode}<br/>${theOrder.invoice.country}</td>
						</tr>
					</fieldset>
				</tbody>
			</table>
			<table>
				<thead>
					<tr>
						<th><g:message code="basketItem.product.label" default="Product" /></th>
						<th>Price</th>
						<g:sortableColumn property="quantity" title="${message(code: 'basketItem.quantity.label', default: 'Quantity')}" />
						<th>Total</th>
					</tr>
				</thead>
				<tbody>
					<fieldset class="form">
						<g:each in="${theOrder.items}" status="i" var="item">
							<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
								<td>${fieldValue(bean: item, field: "product.name")}</td>
								<td>${item.price/100}</td>
								<td>${item.quantity}</td>
								<td><g:formatNumber number="${item.totalPrice/100}" type="currency" currencyCode="GBP" /></td>
							</tr>
						</g:each>
						<tr class="odd">
							<td colspan="3">Shipping (${theOrder.shippingMethod.name})</td>
							<td><g:formatNumber number="${theOrder.shippingCost/100}" type="currency" currencyCode="GBP" /></td>
						</tr>
						<tr class="even">
							<td colspan="3">Total amount</td>
							<td><g:formatNumber number="${theOrder.total/100}" type="currency" currencyCode="GBP" /></td>
						</tr>
					</fieldset>
				</tbody>
			</table>
		</div>
	</body>
</html>

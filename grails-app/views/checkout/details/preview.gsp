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
			<h1>Order Summary</h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<g:form name="reviewForm" action="details">
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
								<td>${delivery.name}<br/>${delivery.line1}<br/>${delivery.city}<br/>${delivery.county}<br/>
								${delivery.postcode}<br/>${delivery.country}</td>
								<td>${invoice.name}<br/>${invoice.line1}<br/>${invoice.city}<br/>${invoice.county}<br/>
								${invoice.postcode}<br/>${invoice.country}</td>
							</tr>
						</fieldset>
					</tbody>
				</table>
				<table>
					<thead>
						<tr>
							<th>Product</th>
							<th>Price</th>
							<g:sortableColumn property="quantity" title="Quantity" />
							<th>Total</th>
						</tr>
					</thead>
					<tbody>
						<fieldset class="form">
							<g:each in="${basket.basketItems}" status="i" var="item">
								<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
									<td>${fieldValue(bean: item, field: "product.name")}</td>
									<td>${item.product.price/100}</td>
									<td>${item.quantity}</td>
									<td><g:formatNumber number="${(item.product.price + item.quantity)/100}" type="currency" currencyCode="GBP" /></td>
								</tr>
							</g:each>
							<tr class="odd">
								<td colspan="3">Shipping (${shippingMethod.name})</td>
								<td><g:formatNumber number="${shippingCost/100}" type="currency" currencyCode="GBP" /></td>
							</tr>
							<tr class="even">
								<td colspan="3">Total amount</td>
								<td><g:formatNumber number="${(basket.total + shippingCost)/100}" type="currency" currencyCode="GBP" /></td>
							</tr>
						</fieldset>
					</tbody>
				</table>
				<fieldset class="buttons">
					<g:submitButton name="back" class="back" value="Back to Shipping Options" />
					<g:submitButton name="payment" class="next" value="Payment" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
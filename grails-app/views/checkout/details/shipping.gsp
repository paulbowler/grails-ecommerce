<%@ page import="retail.Basket" %>
<%@ page import="retail.ShippingMethod" %>

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
			</ul>
		</div>
		<div id="list-basketItem" class="content scaffold-list" role="main">
			<h1>Shipping Options</h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<g:form name="shippingForm" action="details">
				<table>
					<thead>
						<tr>
							<th colspan="2"><g:message code="Shipping.name.label" default="Type" /></th>
							<th>Description</th>
							<th>Cost</th>
						</tr>
					</thead>
					<tbody>
						<fieldset class="form">
							<g:set var="selectedShipping" value="${shippingMethod?.id}" />
							<g:each in="${ShippingMethod.list()}" status="i" var="shipping">
								<g:if test="${shippingCosts.containsKey(shipping.id)}">
								<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
									<td width="5%">
										<g:radio name="shipping" value="${shipping.id}" checked="${selectedShipping ? (shipping.id==selectedShipping) : (i==0)}" />
									</td>
									<td>${shipping.name}</td>
									<td>${shipping.description}</td>
									<td><g:formatNumber number="${shippingCosts[shipping.id]/100}" type="currency" currencyCode="GBP" /></td>
								</tr>
								</g:if>
							</g:each>
						</fieldset>
					</tbody>
				</table>
				<fieldset class="buttons">
					<g:submitButton name="back" class="back" value="Back to Delivery Details" />
					<g:submitButton name="preview" class="next" value="${message(code: 'default.button.next.label', default: 'Preview Order')}" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>

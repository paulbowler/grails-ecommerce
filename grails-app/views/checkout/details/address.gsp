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
				<li><g:link class="add_address" event="createAddress">New Address</g:link></li>
			</ul>
		</div>
		<div id="list-basketItem" class="content scaffold-list" role="main">
			<h1>Delivery Details</h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<g:form name="addressForm" action="details">
				<table>
					<thead>
						<tr>
							<th colspan="2"><g:message code="Address.line1.label" default="Delivery Address" /></th>
						</tr>
					</thead>
					<tbody>
						<fieldset class="form">
							<g:set var="selectedDelivery" value="${delivery?.id}" />
							<g:each in="${addresses}" status="i" var="address">
								<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
									<td width="5%">
										<g:radio name="deliveryAddress" value="${address.id}" checked="${selectedDelivery ? (address.id==selectedDelivery) : (i==0)}"/>
									</td>
									<td>${address.name}, ${address.line1}, ${address.city}, ${address.county}, ${address.postcode}. ${address.country}</td>
								</tr>
							</g:each>
						</fieldset>
					</tbody>
				</table>
				<table>
					<thead>
						<tr>
							<th colspan="2"><g:message code="Address.line1.label" default="Invoice Address" /></th>
						</tr>
					</thead>
					<tbody>
						<fieldset class="form">
							<g:set var="selectedInvoice" value="${invoice?.id}" />
							<g:each in="${addresses}" status="i" var="address">
								<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
									<td width="5%">
										<g:radio name="invoiceAddress" value="${address.id}" checked="${selectedInvoice ? (address.id==selectedInvoice) : (i==0)}" />
									</td>
									<td>${address.name}, ${address.line1}, ${address.city}, ${address.county}, ${address.postcode}. ${address.country}</td>
								</tr>
							</g:each>
						</fieldset>
					</tbody>
				</table>
				<fieldset class="buttons">
					<g:submitButton name="back" class="back" value="Back to Basket" />
					<g:submitButton name="shipping" class="next" value="Shipping Options" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>

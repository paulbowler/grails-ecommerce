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
				<li><g:link class="payment" event="createCard">Add Card</g:link></li>
			</ul>
		</div>
		<div id="list-basketItem" class="content scaffold-list" role="main">
			<h1>Payment Details</h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<g:form name="paymentForm" action="details">
				<table>
					<thead>
						<tr>
							<th colspan="2"><g:message code="Shipping.name.label" default="Type" /></th>
							<th>Card Name</yh>
							<th>Card Number</yh>
						</tr>
					</thead>
					<tbody>
						<fieldset class="form">
							<g:each in="${cards}" status="i" var="card">
								<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
									<td width="5%"><g:radio name="card" value="${card.id}" checked="${i == 0}" /></td>
									<td>${card.type}</td>
									<td>${card.name}</td>
									<td>${card.number}</td>
								</tr>
							</g:each>
						</fieldset>
					</tbody>
				</table>
				<fieldset class="buttons">
					<g:submitButton name="back" class="back" value="Back to Order Summary" />
					<g:submitButton name="place" class="next" value="${message(code: 'default.button.next.label', default: 'Place Order')}" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
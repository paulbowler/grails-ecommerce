
<%@ page import="retail.CustomerOrder" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'customerOrder.label', default: 'CustomerOrder')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-customerOrder" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="account" controller="account">My Account</g:link></li>
			</ul>
		</div>
		<div id="list-customerOrder" class="content scaffold-list" role="main">
			<h1>My Orders</h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<th><g:message code="customerOrder.id.label" default="Order Number" /></th>
					
						<g:sortableColumn property="dateCreated" title="${message(code: 'customerOrder.dateCreated.label', default: 'Date Created')}" />
										
						<g:sortableColumn property="total" title="${message(code: 'customerOrder.totle.label', default: 'Amount')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${customerOrderInstanceList}" status="i" var="customerOrderInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${customerOrderInstance.id}">${customerOrderInstance.id}</g:link></td>
					
						<td><g:formatDate date="${customerOrderInstance.dateCreated}" /></td>
										
						<td><g:formatNumber number="${customerOrderInstance.total/100}" type="currency" currencyCode="GBP" /></td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
		</div>
	</body>
</html>

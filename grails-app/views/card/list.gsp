
<%@ page import="retail.Card" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'card.label', default: 'Card')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-card" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
				<li><g:link class="account" controller="account">My Account</g:link></li>
			</ul>
		</div>
		<div id="list-card" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="name" title="${message(code: 'card.name.label', default: 'Name')}" />
					
						<g:sortableColumn property="type" title="${message(code: 'card.type.label', default: 'Type')}" />
					
						<g:sortableColumn property="number" title="${message(code: 'card.number.label', default: 'Number')}" />
					
						<g:sortableColumn property="expiryMonth" title="${message(code: 'card.expiryMonth.label', default: 'Expiry Month')}" />
					
						<g:sortableColumn property="expiryYear" title="${message(code: 'card.expiryYear.label', default: 'Expiry Year')}" />
										
					</tr>
				</thead>
				<tbody>
				<g:each in="${cardInstanceList}" status="i" var="cardInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${cardInstance.id}">${fieldValue(bean: cardInstance, field: "name")}</g:link></td>
					
						<td>${fieldValue(bean: cardInstance, field: "type")}</td>
					
						<td>${fieldValue(bean: cardInstance, field: "number")}</td>
					
						<td>${fieldValue(bean: cardInstance, field: "expiryMonth")}</td>
					
						<td>${fieldValue(bean: cardInstance, field: "expiryYear")}</td>
										
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${cardInstanceTotal}" />
			</div>
		</div>
	</body>
</html>

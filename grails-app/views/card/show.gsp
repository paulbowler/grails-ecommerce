
<%@ page import="retail.Card" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'card.label', default: 'Card')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-card" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
				<li><g:link class="account" controller="account">My Account</g:link></li>
			</ul>
		</div>
		<div id="show-card" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list card">
			
				<g:if test="${cardInstance?.name}">
				<li class="fieldcontain">
					<span id="name-label" class="property-label"><g:message code="card.name.label" default="Name" /></span>
					
						<span class="property-value" aria-labelledby="name-label"><g:fieldValue bean="${cardInstance}" field="name"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${cardInstance?.type}">
				<li class="fieldcontain">
					<span id="type-label" class="property-label"><g:message code="card.type.label" default="Type" /></span>
					
						<span class="property-value" aria-labelledby="type-label"><g:fieldValue bean="${cardInstance}" field="type"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${cardInstance?.number}">
				<li class="fieldcontain">
					<span id="number-label" class="property-label"><g:message code="card.number.label" default="Number" /></span>
					
						<span class="property-value" aria-labelledby="number-label"><g:fieldValue bean="${cardInstance}" field="number"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${cardInstance?.expiryMonth}">
				<li class="fieldcontain">
					<span id="expiryMonth-label" class="property-label"><g:message code="card.expiryMonth.label" default="Expiry Month" /></span>
					
						<span class="property-value" aria-labelledby="expiryMonth-label"><g:fieldValue bean="${cardInstance}" field="expiryMonth"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${cardInstance?.expiryYear}">
				<li class="fieldcontain">
					<span id="expiryYear-label" class="property-label"><g:message code="card.expiryYear.label" default="Expiry Year" /></span>
					
						<span class="property-value" aria-labelledby="expiryYear-label"><g:fieldValue bean="${cardInstance}" field="expiryYear"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${cardInstance?.id}" />
					<g:link class="edit" action="edit" id="${cardInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>

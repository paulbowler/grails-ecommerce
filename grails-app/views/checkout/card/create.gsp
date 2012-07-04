<%@ page import="retail.Card" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'card.label', default: 'Card')}" />
		<title><g:message code="default.create.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#create-card" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
			</ul>
		</div>
		<div id="create-card" class="content scaffold-create" role="main">
			<h1><g:message code="default.create.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<g:hasErrors bean="${cardInstance}">
				<ul class="errors" role="alert">
					<g:eachError bean="${cardInstance}" var="error">
						<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
					</g:eachError>
				</ul>
			</g:hasErrors>
			<g:form action="card" >
				<fieldset class="form">
					<div class="fieldcontain ${hasErrors(bean: cardInstance, field: 'name', 'error')} ">
						<label for="type">
							<g:message code="card.name.label" default="Name" />
						</label>
						<g:textField name="name" value="${cardInstance?.name}"/>
					</div>
					
					<div class="fieldcontain ${hasErrors(bean: cardInstance, field: 'type', 'error')} ">
						<label for="type">
							<g:message code="card.type.label" default="Type" />
						</label>
						<g:textField name="type" value="${cardInstance?.type}"/>
					</div>

					<div class="fieldcontain ${hasErrors(bean: cardInstance, field: 'number', 'error')} ">
						<label for="number">
							<g:message code="card.number.label" default="Number" />
						</label>
						<g:textField name="number" value="${cardInstance?.number}"/>
					</div>

					<div class="fieldcontain ${hasErrors(bean: cardInstance, field: 'expiryMonth', 'error')} ">
						<label for="expiryMonth">
							<g:message code="card.expiryMonth.label" default="Expiry Month" />
						</label>
						<g:textField name="expiryMonth" value="${cardInstance?.expiryMonth}"/>
					</div>

					<div class="fieldcontain ${hasErrors(bean: cardInstance, field: 'expiryYear', 'error')} ">
						<label for="expiryYear">
							<g:message code="card.expiryYear.label" default="Expiry Year" />
						</label>
						<g:textField name="expiryYear" value="${cardInstance?.expiryYear}"/>
					</div>

				</fieldset>
				<fieldset class="buttons">
					<g:submitButton name="save" class="payment" value="Save Card" />
					<g:submitButton name="cancel" class="cancel" value="${message(code: 'default.button.cancel.label', default: 'Cancel')}" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>

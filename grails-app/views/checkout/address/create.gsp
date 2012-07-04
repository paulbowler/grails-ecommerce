<%@ page import="retail.Address" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'address.label', default: 'Address')}" />
		<title><g:message code="default.create.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#create-address" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
			</ul>
		</div>
		<div id="create-address" class="content scaffold-create" role="main">
			<h1><g:message code="default.create.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<g:hasErrors bean="${addressInstance}">
				<ul class="errors" role="alert">
					<g:eachError bean="${addressInstance}" var="error">
						<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
					</g:eachError>
				</ul>
			</g:hasErrors>
			<g:form action="address" >
				<fieldset class="form">

					<div class="fieldcontain ${hasErrors(bean: addressInstance, field: 'name', 'error')} ">
						<label for="line1">
							<g:message code="address.name.label" default="Name" />		
						</label>
						<g:textField name="name" value="${addressInstance?.name}"/>
					</div>

					<div class="fieldcontain ${hasErrors(bean: addressInstance, field: 'line1', 'error')} ">
						<label for="line1">
							<g:message code="address.line1.label" default="Line1" />		
						</label>
						<g:textField name="line1" value="${addressInstance?.line1}"/>
					</div>

					<div class="fieldcontain ${hasErrors(bean: addressInstance, field: 'line2', 'error')} ">
						<label for="line2">
							<g:message code="address.line2.label" default="Line2" />		
						</label>
						<g:textField name="line2" value="${addressInstance?.line2}"/>
					</div>

					<div class="fieldcontain ${hasErrors(bean: addressInstance, field: 'city', 'error')} ">
						<label for="city">
							<g:message code="address.city.label" default="City" />		
						</label>
						<g:textField name="city" value="${addressInstance?.city}"/>
					</div>

					<div class="fieldcontain ${hasErrors(bean: addressInstance, field: 'county', 'error')} ">
						<label for="county">
							<g:message code="address.county.label" default="County" />		
						</label>
						<g:textField name="county" value="${addressInstance?.county}"/>
					</div>

					<div class="fieldcontain ${hasErrors(bean: addressInstance, field: 'postcode', 'error')} ">
						<label for="postcode">
							<g:message code="address.postcode.label" default="Postcode" />		
						</label>
						<g:textField name="postcode" value="${addressInstance?.postcode}"/>
					</div>

					<div class="fieldcontain ${hasErrors(bean: addressInstance, field: 'country', 'error')} ">
						<label for="country">
							<g:message code="address.country.label" default="Country" />		
						</label>
						<g:textField name="country" value="${addressInstance?.country}"/>
					</div>

				</fieldset>
				<fieldset class="buttons">
					<g:submitButton name="save" class="add_address" value="${message(code: 'default.button.save.label', default: 'Save Address')}" />
					<g:submitButton name="cancel" class="cancel" value="${message(code: 'default.button.cancel.label', default: 'Cancel')}" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>

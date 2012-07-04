<%@ page import="retail.Card" %>



<div class="fieldcontain ${hasErrors(bean: cardInstance, field: 'name', 'error')} required">
	<label for="name">
		<g:message code="card.name.label" default="Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="name" maxlength="150" required="" value="${cardInstance?.name}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: cardInstance, field: 'type', 'error')} required">
	<label for="type">
		<g:message code="card.type.label" default="Type" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="type" maxlength="15" required="" value="${cardInstance?.type}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: cardInstance, field: 'number', 'error')} required">
	<label for="number">
		<g:message code="card.number.label" default="Number" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="number" maxlength="15" required="" value="${cardInstance?.number}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: cardInstance, field: 'expiryMonth', 'error')} required">
	<label for="expiryMonth">
		<g:message code="card.expiryMonth.label" default="Expiry Month" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="expiryMonth" maxlength="2" required="" value="${cardInstance?.expiryMonth}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: cardInstance, field: 'expiryYear', 'error')} required">
	<label for="expiryYear">
		<g:message code="card.expiryYear.label" default="Expiry Year" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="expiryYear" maxlength="4" required="" value="${cardInstance?.expiryYear}"/>
</div>


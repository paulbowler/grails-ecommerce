<%@ page import="retail.Address" %>



<div class="fieldcontain ${hasErrors(bean: addressInstance, field: 'name', 'error')} required">
	<label for="name">
		<g:message code="address.name.label" default="Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="name" maxlength="150" required="" value="${addressInstance?.name}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: addressInstance, field: 'line1', 'error')} required">
	<label for="line1">
		<g:message code="address.line1.label" default="Line1" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="line1" maxlength="150" required="" value="${addressInstance?.line1}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: addressInstance, field: 'line2', 'error')} ">
	<label for="line2">
		<g:message code="address.line2.label" default="Line2" />
		
	</label>
	<g:textField name="line2" maxlength="150" value="${addressInstance?.line2}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: addressInstance, field: 'city', 'error')} required">
	<label for="city">
		<g:message code="address.city.label" default="City" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="city" maxlength="150" required="" value="${addressInstance?.city}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: addressInstance, field: 'county', 'error')} required">
	<label for="county">
		<g:message code="address.county.label" default="County" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="county" maxlength="150" required="" value="${addressInstance?.county}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: addressInstance, field: 'postcode', 'error')} required">
	<label for="postcode">
		<g:message code="address.postcode.label" default="Postcode" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="postcode" maxlength="9" required="" value="${addressInstance?.postcode}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: addressInstance, field: 'country', 'error')} required">
	<label for="country">
		<g:message code="address.country.label" default="Country" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="country" maxlength="150" required="" value="${addressInstance?.country}"/>
</div>


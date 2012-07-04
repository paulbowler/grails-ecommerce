<%@ page import="retail.Shipping" %>



<div class="fieldcontain ${hasErrors(bean: shippingInstance, field: 'name', 'error')} ">
	<label for="name">
		<g:message code="shipping.name.label" default="Name" />
		
	</label>
	<g:textField name="name" value="${shippingInstance?.name}"/>
</div>


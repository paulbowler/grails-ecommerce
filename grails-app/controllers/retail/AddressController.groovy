package retail

import org.springframework.dao.DataIntegrityViolationException
import grails.plugins.springsecurity.Secured

class AddressController {
	def springSecurityService

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

	@Secured(['ROLE_USER'])
    def list() {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        def addressInstanceList = Address.findAllByUser(springSecurityService.currentUser, params)
        [addressInstanceList: addressInstanceList, addressInstanceTotal: addressInstanceList.size()]
    }

	@Secured(['ROLE_USER'])
    def create() {
    	params.user = springSecurityService.currentUser
        [addressInstance: new Address(params)]
    }

	@Secured(['ROLE_USER'])
    def save() {
    	params.user = springSecurityService.currentUser
        def addressInstance = new Address(params)
        if (!addressInstance.save(flush: true)) {
            render(view: "create", model: [addressInstance: addressInstance])
            return
        }

		flash.message = message(code: 'default.created.message', args: [message(code: 'address.label', default: 'Address'), addressInstance.id])
        redirect(action: "show", id: addressInstance.id)
    }

	@Secured(['ROLE_USER'])
    def show() {
    	params.user = springSecurityService.currentUser
        def addressInstance = Address.findByUserAndId(params.user, params.id)
        if (!addressInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'address.label', default: 'Address'), params.id])
            redirect(action: "list")
            return
        }

        [addressInstance: addressInstance]
    }

	@Secured(['ROLE_USER'])
    def edit() {
    	params.user = springSecurityService.currentUser
        def addressInstance = Address.findByUserAndId(params.user, params.id)
        if (!addressInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'address.label', default: 'Address'), params.id])
            redirect(action: "list")
            return
        }

        [addressInstance: addressInstance]
    }

	@Secured(['ROLE_USER'])
    def update() {
    	params.user = springSecurityService.currentUser
        def addressInstance = Address.findByUserAndId(params.user, params.id)
        if (!addressInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'address.label', default: 'Address'), params.id])
            redirect(action: "list")
            return
        }

        if (params.version) {
            def version = params.version.toLong()
            if (addressInstance.version > version) {
                addressInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'address.label', default: 'Address')] as Object[],
                          "Another user has updated this Address while you were editing")
                render(view: "edit", model: [addressInstance: addressInstance])
                return
            }
        }

        addressInstance.properties = params

        if (!addressInstance.save(flush: true)) {
            render(view: "edit", model: [addressInstance: addressInstance])
            return
        }

		flash.message = message(code: 'default.updated.message', args: [message(code: 'address.label', default: 'Address'), addressInstance.id])
        redirect(action: "show", id: addressInstance.id)
    }

	@Secured(['ROLE_USER'])
    def delete() {
    	params.user = springSecurityService.currentUser
        def addressInstance = Address.findByUserAndId(params.user, params.id)
        if (!addressInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'address.label', default: 'Address'), params.id])
            redirect(action: "list")
            return
        }

        try {
            addressInstance.delete(flush: true)
			flash.message = message(code: 'default.deleted.message', args: [message(code: 'address.label', default: 'Address'), params.id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'address.label', default: 'Address'), params.id])
            redirect(action: "show", id: params.id)
        }
    }
}

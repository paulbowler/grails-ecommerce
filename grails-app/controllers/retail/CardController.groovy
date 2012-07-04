package retail

import org.springframework.dao.DataIntegrityViolationException
import grails.plugins.springsecurity.Secured

class CardController {
	def springSecurityService

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

	@Secured(['ROLE_USER'])
    def list() {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        def cardInstanceList = Card.findAllByUser(springSecurityService.currentUser, params)
        [cardInstanceList: cardInstanceList, cardInstanceTotal: cardInstanceList.size()]
    }

	@Secured(['ROLE_USER'])
    def create() {
    	params.user = springSecurityService.currentUser
        [cardInstance: new Card(params)]
    }

	@Secured(['ROLE_USER'])
    def save() {
    	params.user = springSecurityService.currentUser
        def cardInstance = new Card(params)
        if (!cardInstance.save(flush: true)) {
            render(view: "create", model: [cardInstance: cardInstance])
            return
        }

		flash.message = message(code: 'default.created.message', args: [message(code: 'card.label', default: 'Card'), cardInstance.id])
        redirect(action: "show", id: cardInstance.id)
    }

	@Secured(['ROLE_USER'])
    def show() {
    	params.user = springSecurityService.currentUser
        def cardInstance = Card.findByUserAndId(params.user, params.id)
        if (!cardInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'card.label', default: 'Card'), params.id])
            redirect(action: "list")
            return
        }

        [cardInstance: cardInstance]
    }

	@Secured(['ROLE_USER'])
    def edit() {
    	params.user = springSecurityService.currentUser
        def cardInstance = Card.findByUserAndId(params.user, params.id)
        if (!cardInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'card.label', default: 'Card'), params.id])
            redirect(action: "list")
            return
        }

        [cardInstance: cardInstance]
    }

	@Secured(['ROLE_USER'])
    def update() {
    	params.user = springSecurityService.currentUser
        def cardInstance = Card.findByUserAndId(params.user, params.id)
        if (!cardInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'card.label', default: 'Card'), params.id])
            redirect(action: "list")
            return
        }

        if (params.version) {
            def version = params.version.toLong()
            if (cardInstance.version > version) {
                cardInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'card.label', default: 'Card')] as Object[],
                          "Another user has updated this Card while you were editing")
                render(view: "edit", model: [cardInstance: cardInstance])
                return
            }
        }

        cardInstance.properties = params

        if (!cardInstance.save(flush: true)) {
            render(view: "edit", model: [cardInstance: cardInstance])
            return
        }

		flash.message = message(code: 'default.updated.message', args: [message(code: 'card.label', default: 'Card'), cardInstance.id])
        redirect(action: "show", id: cardInstance.id)
    }

	@Secured(['ROLE_USER'])
    def delete() {
    	params.user = springSecurityService.currentUser
        def cardInstance = Card.findByUserAndId(params.user, params.id)
        if (!cardInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'card.label', default: 'Card'), params.id])
            redirect(action: "list")
            return
        }

        try {
            cardInstance.delete(flush: true)
			flash.message = message(code: 'default.deleted.message', args: [message(code: 'card.label', default: 'Card'), params.id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'card.label', default: 'Card'), params.id])
            redirect(action: "show", id: params.id)
        }
    }
}

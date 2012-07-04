package retail

import grails.plugins.springsecurity.Secured

class CustomerOrderController {
	def springSecurityService

    def index() {
        redirect(action: "list")
    }

    @Secured(['ROLE_USER'])
    def list() {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [customerOrderInstanceList: CustomerOrder.findAllByUser(springSecurityService.currentUser)]
    }

	@Secured(['ROLE_USER'])
    def show() {
        def customerOrderInstance = CustomerOrder.findByIdAndUser(params.id, springSecurityService.currentUser)
        if (!customerOrderInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'customerOrder.label', default: 'CustomerOrder'), params.id])
            redirect(action: "list")
            return
        }
        [theOrder: customerOrderInstance]
    }
}

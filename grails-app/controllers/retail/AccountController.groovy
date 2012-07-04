package retail

import grails.plugins.springsecurity.Secured

class AccountController {
	def springSecurityService

    @Secured(['ROLE_USER'])
    def index() {
    }
}

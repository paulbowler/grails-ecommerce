package retail

import grails.plugins.springsecurity.Secured

class CheckoutController {
	def basketService
	def shippingCalculatorService
	def springSecurityService
  
	def index() {
        redirect(action: "details")
    }
    
    @Secured(['ROLE_USER'])
    def detailsFlow = {
    	empty() {
    		action {
    			def basket = basketService.findOrCreateBasket(session)
        		if (!basket.basketItems) return emptyBasket()
        	}
        	on("emptyBasket").to("emptyBasket")
        	on("success").to("basket")
    	}
    	basket() {
    		onEntry {
    			def basket = basketService.findOrCreateBasket(session)
        		[basket: basket]
        	}
        	on("address").to("hasAddress")
    	}
    	hasAddress() {
    		action {
    			if (!Address.findAllByUser(springSecurityService.currentUser)) return error()
        	}
    		on("success").to "address"
        	on("error").to "createAddress"
    	}
    	address() {
    		onEntry {
    			def addresses = Address.findAllByUser(springSecurityService.currentUser)
        		[addresses: addresses]
        	}
        	on("back").to("basket")
        	on("shipping") {
        		flow.delivery = Address.get(params.deliveryAddress)
        		flow.invoice = Address.get(params.invoiceAddress)
        	}.to("shipping")
        	on("createAddress").to("createAddress")
    	}
    	createAddress {
        	subflow(action: "address")
        	on("done").to "address"
        	on("cancel").to "addressCancelDestination"
    	}
    	addressCancelDestination() {
    		action {
    			if (!Address.findAllByUser(springSecurityService.currentUser)) return basket()
        	}
    		on("success").to "address"
        	on("basket").to "basket"
    	}
    	shipping() {
    		onEntry {
    			def shippingCosts = shippingCalculatorService.getShippingCosts(flow.basket, flow.delivery)
        		[shippingCosts: shippingCosts]
        	}
        	on("back").to("address")
        	on("preview") {
        		flow.shippingMethod = ShippingMethod.get(params.shipping)
        		flow.shippingCost = shippingCalculatorService.getShippingMethodCost(flow.shippingMethod, flow.basket, flow.delivery)
        	}.to("preview")
    	}
    	preview() {
        	on("back").to("shipping")
        	on("payment").to("hasCard")
    	}
    	hasCard() {
    		action {
    			if (!Card.findAllByUser(springSecurityService.currentUser)) return error()
        	}
    		on("success").to "payment"
        	on("error").to "createCard"
    	}
    	createCard {
        	subflow(action: "card")
        	on("done").to "payment"
        	on("cancel").to "cardCancelDestination"
    	}
    	cardCancelDestination() {
    		action {
    			if (!Card.findAllByUser(springSecurityService.currentUser)) return preview()
        	}
    		on("success").to "payment"
        	on("preview").to "preview"
    	}
    	payment()  {
    		onEntry {
    			def cards = Card.findAllByUser(springSecurityService.currentUser)
        		[cards: cards]
        	}
        	on("back").to("preview")
        	on("createCard").to("createCard")
        	on("place").to("place")
    	}
    	place()  {
    		action {
        		def theOrder = basketService.basketToOrder(springSecurityService.currentUser, flow.delivery,
        			flow.invoice, flow.basket, flow.shippingMethod, flow.shippingCost).save()
        	}
        	on("success") {
        		session["myBasketId"] = null
        	}.to "complete"
        	on("error").to "payment"
    	}
    	emptyBasket()
    	complete()
    }
    
    @Secured(['ROLE_USER'])
    def addressFlow = {
    	create() {
        	on("save").to("save")
        	on("cancel").to("cancel")
    	}
    	save() {
    		action {
    			params.user = springSecurityService.currentUser
        		def address = new Address(params)
        		flow.addressInstance = address
        		if(!address.validate()) return error()
                address.save()
    		}
        	on("error").to "create"
    		on("success").to "done"
    	}
    	cancel()
    	done()
    }
    
    @Secured(['ROLE_USER'])
    def cardFlow = {
    	create() {
        	on("save").to("save")
        	on("cancel").to("cancel")
    	}
    	save() {
    		action {
    			params.user = springSecurityService.currentUser
        		def card = new Card(params)
        		flow.cardInstance = card
        		if(!card.validate()) return error()
                card.save()
    		}
        	on("error").to "create"
    		on("success").to "done"
    	}
    	cancel()
    	done()
    }
}

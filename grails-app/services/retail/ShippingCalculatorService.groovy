package retail

class ShippingCalculatorService {

    def getShippingCosts(Basket basket, Address address) {
		def items = 0
		basket.basketItems.each() {
			items += it.quantity
		}
		def shippingCosts = [:]
		
		ShippingMethod.list().each {
			def cost = getShippingMethodCost(it, basket, address)
			if (cost != null) {
				shippingCosts[(it.id)] = cost
			}
		}
		return shippingCosts
    }
    
    def getShippingMethodCost(ShippingMethod method, Basket basket, Address address) {
    	def items = 0
		basket.basketItems.each() {
			items += it.quantity
		}
		switch(method.code){
			case "express":
				return 4000*items
			case "first":
				return 2000*items
			case "saver":
				return 3500
			case "free":
			if (address.country == 'UK') {
				return 0
			}
		}
       return null
    }
}

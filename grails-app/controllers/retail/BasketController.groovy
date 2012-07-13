package retail

import org.springframework.dao.DataIntegrityViolationException

class BasketController {
	def BasketService basketService

    def index() {
        redirect(action: "show", params: params)
    }
    
    def add() {
    	def myBasket = basketService.findOrCreateBasket(session)
    	
    	// Add the product to the basket
    	if (params.sku) {
    		def product = Product.findBySku(params.sku)
    		if (product) {
    			// Only add to the basket if not already there
    			if (!BasketItem.findByBasketAndProduct(myBasket, product)) {
    				def basketItem = new BasketItem(basket: myBasket, product: product, quantity: 1)
    				myBasket.addToBasketItems(basketItem).save()
    				flash.message = "The item has been added to your basket."
    			} else {
    				flash.message = "This product is already in your basket."
    			}
    		}
    	}
    	redirect(action: "show")
    }

    def show() {
        def myBasket = basketService.findOrCreateBasket(session)
        [basket: myBasket]
    }
    
    def update() {
    	def myBasket = basketService.findOrCreateBasket(session)
    	params.each {
    		if(it.key.isNumber()) {
    			def product = Product.get(it.key)
    			if (product) {
    				def basketItem = BasketItem.findByBasketAndProduct(myBasket, product)
    				if (basketItem) {
    					def qty = it.value.toInteger()
    					if (qty == 0) {
    						basketItem.delete()
    					} else { 
    						basketItem.quantity = qty
    						basketItem.save()
    					}
    					flash.message = "Basket has been updated."
    				}
    			}
    		}
    	}
    	redirect(action: "show")
    }

}

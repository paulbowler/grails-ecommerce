package retail

class BasketService {

    def Basket findOrCreateBasket(mySession) {
    	def myBasket
    	def myBasketId = mySession["myBasketId"]
    	// If there is no basket in the session create a new one
    	if (!myBasketId) {
    		myBasket = new Basket().save()
    		mySession["myBasketId"] = myBasket.id
    	} else {
    		myBasket = Basket.get(myBasketId)
    		// If the basket no longer exists create a new one
    		if (!myBasket) {
    			myBasket = new Basket().save()
    			mySession["myBasketId"] = myBasket.id
    		}
    	}
    	return myBasket
    }
    
    def basketToOrder(user, delivery, invoice, basket, shippingMethod, cost) {
    	def customerOrder = new CustomerOrder(user: user, delivery: delivery, invoice: invoice, shippingMethod: shippingMethod, shippingCost: cost).save()
    	basket.basketItems.each { basketItem ->
    		def orderItem = new CustomerOrderItem(customerOrder: customerOrder, product: basketItem.product,
    								quantity: basketItem.quantity, price: basketItem.product.price).save()
    		customerOrder.addToItems(orderItem).save()
    	}
    	return customerOrder
    }
}

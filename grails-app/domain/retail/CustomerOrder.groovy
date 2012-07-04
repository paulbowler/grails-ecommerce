package retail

class CustomerOrder implements Serializable {
	Date dateCreated
    Date lastUpdated

	User user
	Address delivery
	Address invoice
	ShippingMethod shippingMethod
	BigDecimal shippingCost
	
	static hasMany = [items: CustomerOrderItem, statuses: CustomerOrderStatus]

    static constraints = {
    }
    
    def getTotal() {
    	def total = 0
    	if (items) {
    		items?.each { item ->
    			total += item.totalPrice
    		}
    	}
    	if (shippingCost) {
    		total += shippingCost
    	}
    	return total
    }
}

package retail

class CustomerOrderItem implements Serializable {
	Date dateCreated
    Date lastUpdated
    
	CustomerOrder customerOrder
	Product product
	Integer quantity
	BigDecimal price

    static constraints = {
    }
    
    def getTotalPrice() {
    	return quantity * price
    }
}

package retail

class BasketItem implements Serializable {
	Date dateCreated
    Date lastUpdated
    
	Basket basket
	Product product
	Integer quantity
	
    static constraints = {
    }
}

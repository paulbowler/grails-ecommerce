package retail

class Basket implements Serializable {
	Date dateCreated
    Date lastUpdated
    
	static hasMany = [basketItems: BasketItem]

    static constraints = {
    }
    
    def getTotal() {
    	def total = 0
    	if (basketItems) {
    		basketItems?.each { item ->
    			total += item.product.price
    		}
    	}
    	return total
    }
    
    static mapping = {
    	basketItems cascade: "all-delete-orphan"
	}

}

package retail

class Product implements Serializable {
	Date dateCreated
    Date lastUpdated
   
	String sku
	String name
	String description
	BigDecimal price
		
	static searchable = true
	
    static constraints = {
    }
    
}

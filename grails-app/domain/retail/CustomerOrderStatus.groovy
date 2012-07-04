package retail

class CustomerOrderStatus implements Serializable {
	Date dateCreated
    Date lastUpdated
    
    CustomerOrder customerOrder
    String status
    String detail

    static constraints = {
    }
}

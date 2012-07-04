package retail

class Card implements Serializable {

	User user
	String name
	String type
	String number
	String expiryMonth
	String expiryYear

    static constraints = {
    	name nullable: false, blank: false, size: 3..150
    	type nullable: false, blank: false, size: 3..15
    	number nullable: false, blank: false
    	expiryMonth nullable: false, blank: false, size: 2..2
    	expiryYear nullable: false, blank: false, size: 4..4
    }
}

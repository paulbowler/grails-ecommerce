package retail

class Address implements Serializable {
	Date dateCreated
    Date lastUpdated

	User user
	String name
	String line1
	String line2
	String city
	String county
	String postcode
	String country

    static constraints = {
    	name nullable: false, blank: false, size: 5..150
    	line1 nullable: false, blank: false, size: 5..150
    	line2 nullable: true, blank: true, size: 5..150
    	city nullable: false, blank: false, size: 3..150
    	county nullable: false, blank: false, size: 4..150
    	postcode nullable: false, blank: false, size: 8..9
    	country nullable: false, blank: false, size: 2..150
    }
}

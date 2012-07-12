import retail.*

class BootStrap {
    def init = { servletContext ->
        //new Product(sku: 10001, name: "Grand Piano", description: "A very lovely grand piano", price: 499900).save(failOnError: true)
        //new Product(sku: 10002, name: "French Flute", description: "A shiny silver flute", price: 199500).save(failOnError: true)
        //new Product(sku: 10003, name: "German Bassoon", description: "A mellow German bassoon", price: 299900).save(failOnError: true)
        
        new ShippingMethod(code: "express", name: "Next day", description: "Special next-day delivery if ordered before 2pm").save(failOnError: true)
        new ShippingMethod(code: "first", name: "First Class", description: "Standard first class delivery in 2-4 days").save(failOnError: true)
        new ShippingMethod(code: "saver", name: "Super Saver", description: "Super saver delivery in 4-6 days").save(failOnError: true)
        new ShippingMethod(code: "free", name: "Free", description: "Free delivery in 7-10 days").save(failOnError: true)
        
        def adminRole = new Role(authority: 'ROLE_ADMIN').save(flush: true)
      	def userRole = new Role(authority: 'ROLE_USER').save(flush: true)
      	
      	def testUser = new User(username: 'paul', enabled: true, password: 'password')
     	testUser.save(flush: true)
     	
      	new Address(user: testUser, name: "Fred Bloggs", line1: "1 High Street",
      		city: "Winchester", county: "Hampshire", postcode: "SO23 1AA", country: "UK").save(failOnError: true)
      		
      	new Card(user: testUser, name: "Fred Bloggs", type: "Amex", number: "12345678", expiryMonth: "12", expiryYear: "2013").save(failOnError: true)

      	UserRole.create testUser, userRole, true

      	assert User.count() == 1
      	assert Role.count() == 2
      	assert UserRole.count() == 1

    }

    def destroy = {
    }
}
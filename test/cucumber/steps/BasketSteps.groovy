import static cucumber.runtime.groovy.EN.*
import static groovy.util.GroovyTestCase.assertNotNull
import static groovy.util.GroovyTestCase.assertNull
import static groovy.util.GroovyTestCase.assertEquals
import cucumber.runtime.PendingException
import cucumber.table.DataTable
import retail.BasketController
import retail.Product

BasketController basketController = new BasketController()
def model

Given(~'^I have an empty basket\$') { ->
}
When(~'^I view my basket\$') { ->
    model = basketController.show()
}
Then(~'^I see (\\d+) items? in my basket\$') { int items ->
	assertNotNull model.basket
	assertNull model.basket.basketItems
}

Given(~'^the following items are available:\$') { DataTable items ->
	def products = items.asList(Product)
    products.each { item ->
    	new Product(sku: item.sku, name: item.name, description: item.description, price: item.price).save(failOnError: true)
    }
}
When(~'^I add product with SKU (.*) to my basket$') { String sku ->
	basketController.params.sku = sku
    basketController.add()
    assertEquals basketController.flash.message, "The item has been added to your basket."
}
Then(~'^my basket contains the product with SKU (.*), name (.*), price (\\d+) and quantity (\\d+)\$') { String sku, String name, int price, int quantity ->
    model = basketController.show()
    def item = model.basket.basketItems.findAll{ item -> item.product.sku == sku }
    assertEquals item.size(), 1
    assertEquals item.product.name[0], name
    assertEquals item.product.price[0], price
    assertEquals item.quantity[0], 1
}

When(~'^I update the quantity of product with SKU (.*) to (\\d+)\$') { String sku, int quantity ->
    basketController.params.id = quantity
    basketController.update()
    assertEquals basketController.flash.message, "Basket has been updated."
}
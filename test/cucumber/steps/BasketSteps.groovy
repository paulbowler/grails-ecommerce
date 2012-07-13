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
def products

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
	products = items.asList(Product)
    products.each { item ->
    	new Product(sku: item.sku, name: item.name, description: item.description, price: item.price).save(failOnError: true)
    }
}
When(~'^I add product with ID (\\d+) to my basket$') { int id ->
	basketController.params.productId = id
    basketController.addProductToBasket()
    assertEquals basketController.flash.message, "The item has been added to your basket."
}
Then(~'^my basket contains the product with ID (\\d+)\$') { int id ->
    model = basketController.show()
    assert model.basket.basketItems.findAll{ item -> item.product.id == id }.size() == 1
}
Then(~'^my basket contains the product with ID (\\d+), name (.*), price (\\d+) and quantity (\\d+)\$') { int id, String name, int price, int quantity ->
    model = basketController.show()
    def item = model.basket.basketItems.findAll{ item -> item.product.id == id }
    assertEquals item.size(), 1
    assertEquals item.product.name[0], name
    assertEquals item.product.price[0], price
    assertEquals item.quantity[0], 1
}

When(~'^I update the quantity of product with ID (\\d+) to (\\d+)\$') { int id, int quantity ->
    basketController.params.id = quantity
    basketController.update()
    assertEquals basketController.flash.message, "Basket has been updated."
}
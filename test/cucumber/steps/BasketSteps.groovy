import static cucumber.runtime.groovy.EN.*
import static groovy.util.GroovyTestCase.assertNotNull
import static groovy.util.GroovyTestCase.assertEquals
import cucumber.runtime.PendingException
import cucumber.table.DataTable
import retail.BasketController
import retail.Product

BasketController basketController
def model
def products

Given(~'^I have an empty basket\$') { ->
    basketController = new BasketController()
}
When(~'^I view my basket\$') { ->
    model = basketController.show()
}
Then(~'^I see (\\d+) items in my basket\$') { int items ->
	assert model.basket.id == 1
	assert items == (model.basket.basketItems?.count() ?: 0)
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
    assertNotNull model.basket
    assert model.basket.total != 0
}

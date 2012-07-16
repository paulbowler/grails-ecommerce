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
	assertEquals items, (model.basket.basketItems?.size() ?: 0)
}

Given(~'^the following items are available for purchase:\$') { DataTable items ->
	def products = items.asList(Product)
    products.each { item ->
    	new Product(sku: item.sku, name: item.name, description: item.description, price: item.price).save(failOnError: true)
    }
}

When(~'^I add product with SKU (.*) to my basket$') { String sku ->
	basketController.response.reset()
	basketController.params.sku = sku
	model = basketController.add()
}

Then(~'^my basket contains (\\d+) (.*) with SKU (.*) costing (\\d+) units$') { int quantity, String name, String sku, int price  ->
    def item = model.basket.basketItems.findAll{ item -> item.product.sku == sku }
    assertEquals 1, item.size()
    assertEquals name, item.product.name[0]
    assertEquals price, item.total[0]
    assertEquals quantity, item.quantity[0]
}

Then(~'^the flash message reads "(.*)"\$') { String message ->
    assertEquals message, basketController.flash.message
}

When(~'^I update the quantity of product with SKU (.*) to (\\d+)\$') { String sku, int quantity ->
	basketController.response.reset()
    basketController.params."sku-${sku}" = quantity
    model = basketController.update()
}
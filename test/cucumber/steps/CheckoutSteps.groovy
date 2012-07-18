import static cucumber.runtime.groovy.EN.*
import static groovy.util.GroovyTestCase.assertNotNull
import static groovy.util.GroovyTestCase.assertNull
import static groovy.util.GroovyTestCase.assertEquals
import cucumber.runtime.PendingException
import cucumber.table.DataTable
import retail.BasketController
import retail.CheckoutController
import retail.Product

BasketController basketController = new BasketController()
CheckoutController checkoutController = new CheckoutController()
def model

When(~'^I checkout my basket$') { ->
    model = checkoutController.index()
}
Then(~'^I see the (.*) page\$') { String page ->
    assertNull model
}
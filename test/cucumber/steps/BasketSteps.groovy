import static cucumber.runtime.groovy.EN.*
import cucumber.runtime.PendingException

import retail.BasketController

BasketController basketController
def model

Given(~'^I have an empty basket\$') { ->
    basketController = new BasketController()
}
When(~'^I view my basket\$') { ->
    // Express the Regexp above with the code you wish you had
    model = basketController.show()
}
Then(~'^I see (\\d+) items in my basket\$') { int items ->
	// Express the Regexp above with the code you wish you had
	assert items == (model.basket.basketItems?.count() ?: 0)
}
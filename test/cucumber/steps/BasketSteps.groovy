import static cucumber.runtime.groovy.EN.*
import pages.basket.ShowBasketPage

Given(~'^I have zero items in my basket$') { ->
    to ShowBasketPage
    at ShowBasketPage
}
When(~'^I view my basket$') { ->
    // Express the Regexp above with the code you wish you had
    assert false
}
Then(~'^I see zero items in my basket$') { ->
    // Express the Regexp above with the code you wish you had
   assers false
}
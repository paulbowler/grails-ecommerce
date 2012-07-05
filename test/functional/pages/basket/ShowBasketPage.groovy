package pages.basket

import geb.Page

class ShowBasketPage extends Page {
    static url = "basket/show"

    static at = {
        title ==~ /Show Basket/
    }

    static content = {
    }
}
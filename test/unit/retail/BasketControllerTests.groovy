package retail



import org.junit.*
import grails.test.mixin.*

@TestFor(BasketController)
@Mock(Basket)
class BasketControllerTests {


    def populateValidParams(params) {
      assert params != null
      // TODO: Populate valid properties like...
      //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/basket/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.basketInstanceList.size() == 0
        assert model.basketInstanceTotal == 0
    }

    void testCreate() {
       def model = controller.create()

       assert model.basketInstance != null
    }

    void testSave() {
        controller.save()

        assert model.basketInstance != null
        assert view == '/basket/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/basket/show/1'
        assert controller.flash.message != null
        assert Basket.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/basket/list'


        populateValidParams(params)
        def basket = new Basket(params)

        assert basket.save() != null

        params.id = basket.id

        def model = controller.show()

        assert model.basketInstance == basket
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/basket/list'


        populateValidParams(params)
        def basket = new Basket(params)

        assert basket.save() != null

        params.id = basket.id

        def model = controller.edit()

        assert model.basketInstance == basket
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/basket/list'

        response.reset()


        populateValidParams(params)
        def basket = new Basket(params)

        assert basket.save() != null

        // test invalid parameters in update
        params.id = basket.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/basket/edit"
        assert model.basketInstance != null

        basket.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/basket/show/$basket.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        basket.clearErrors()

        populateValidParams(params)
        params.id = basket.id
        params.version = -1
        controller.update()

        assert view == "/basket/edit"
        assert model.basketInstance != null
        assert model.basketInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/basket/list'

        response.reset()

        populateValidParams(params)
        def basket = new Basket(params)

        assert basket.save() != null
        assert Basket.count() == 1

        params.id = basket.id

        controller.delete()

        assert Basket.count() == 0
        assert Basket.get(basket.id) == null
        assert response.redirectedUrl == '/basket/list'
    }
}

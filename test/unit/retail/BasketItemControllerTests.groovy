package retail



import org.junit.*
import grails.test.mixin.*

@TestFor(BasketItemController)
@Mock(BasketItem)
class BasketItemControllerTests {


    def populateValidParams(params) {
      assert params != null
      // TODO: Populate valid properties like...
      //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/basketItem/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.basketItemInstanceList.size() == 0
        assert model.basketItemInstanceTotal == 0
    }

    void testCreate() {
       def model = controller.create()

       assert model.basketItemInstance != null
    }

    void testSave() {
        controller.save()

        assert model.basketItemInstance != null
        assert view == '/basketItem/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/basketItem/show/1'
        assert controller.flash.message != null
        assert BasketItem.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/basketItem/list'


        populateValidParams(params)
        def basketItem = new BasketItem(params)

        assert basketItem.save() != null

        params.id = basketItem.id

        def model = controller.show()

        assert model.basketItemInstance == basketItem
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/basketItem/list'


        populateValidParams(params)
        def basketItem = new BasketItem(params)

        assert basketItem.save() != null

        params.id = basketItem.id

        def model = controller.edit()

        assert model.basketItemInstance == basketItem
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/basketItem/list'

        response.reset()


        populateValidParams(params)
        def basketItem = new BasketItem(params)

        assert basketItem.save() != null

        // test invalid parameters in update
        params.id = basketItem.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/basketItem/edit"
        assert model.basketItemInstance != null

        basketItem.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/basketItem/show/$basketItem.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        basketItem.clearErrors()

        populateValidParams(params)
        params.id = basketItem.id
        params.version = -1
        controller.update()

        assert view == "/basketItem/edit"
        assert model.basketItemInstance != null
        assert model.basketItemInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/basketItem/list'

        response.reset()

        populateValidParams(params)
        def basketItem = new BasketItem(params)

        assert basketItem.save() != null
        assert BasketItem.count() == 1

        params.id = basketItem.id

        controller.delete()

        assert BasketItem.count() == 0
        assert BasketItem.get(basketItem.id) == null
        assert response.redirectedUrl == '/basketItem/list'
    }
}

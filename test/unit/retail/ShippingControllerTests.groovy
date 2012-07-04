package retail



import org.junit.*
import grails.test.mixin.*

@TestFor(ShippingController)
@Mock(Shipping)
class ShippingControllerTests {


    def populateValidParams(params) {
      assert params != null
      // TODO: Populate valid properties like...
      //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/shipping/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.shippingInstanceList.size() == 0
        assert model.shippingInstanceTotal == 0
    }

    void testCreate() {
       def model = controller.create()

       assert model.shippingInstance != null
    }

    void testSave() {
        controller.save()

        assert model.shippingInstance != null
        assert view == '/shipping/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/shipping/show/1'
        assert controller.flash.message != null
        assert Shipping.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/shipping/list'


        populateValidParams(params)
        def shipping = new Shipping(params)

        assert shipping.save() != null

        params.id = shipping.id

        def model = controller.show()

        assert model.shippingInstance == shipping
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/shipping/list'


        populateValidParams(params)
        def shipping = new Shipping(params)

        assert shipping.save() != null

        params.id = shipping.id

        def model = controller.edit()

        assert model.shippingInstance == shipping
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/shipping/list'

        response.reset()


        populateValidParams(params)
        def shipping = new Shipping(params)

        assert shipping.save() != null

        // test invalid parameters in update
        params.id = shipping.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/shipping/edit"
        assert model.shippingInstance != null

        shipping.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/shipping/show/$shipping.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        shipping.clearErrors()

        populateValidParams(params)
        params.id = shipping.id
        params.version = -1
        controller.update()

        assert view == "/shipping/edit"
        assert model.shippingInstance != null
        assert model.shippingInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/shipping/list'

        response.reset()

        populateValidParams(params)
        def shipping = new Shipping(params)

        assert shipping.save() != null
        assert Shipping.count() == 1

        params.id = shipping.id

        controller.delete()

        assert Shipping.count() == 0
        assert Shipping.get(shipping.id) == null
        assert response.redirectedUrl == '/shipping/list'
    }
}

package retail



import org.junit.*
import grails.test.mixin.*

@TestFor(ProductPriceController)
@Mock(ProductPrice)
class ProductPriceControllerTests {


    def populateValidParams(params) {
      assert params != null
      // TODO: Populate valid properties like...
      //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/productPrice/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.productPriceInstanceList.size() == 0
        assert model.productPriceInstanceTotal == 0
    }

    void testCreate() {
       def model = controller.create()

       assert model.productPriceInstance != null
    }

    void testSave() {
        controller.save()

        assert model.productPriceInstance != null
        assert view == '/productPrice/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/productPrice/show/1'
        assert controller.flash.message != null
        assert ProductPrice.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/productPrice/list'


        populateValidParams(params)
        def productPrice = new ProductPrice(params)

        assert productPrice.save() != null

        params.id = productPrice.id

        def model = controller.show()

        assert model.productPriceInstance == productPrice
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/productPrice/list'


        populateValidParams(params)
        def productPrice = new ProductPrice(params)

        assert productPrice.save() != null

        params.id = productPrice.id

        def model = controller.edit()

        assert model.productPriceInstance == productPrice
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/productPrice/list'

        response.reset()


        populateValidParams(params)
        def productPrice = new ProductPrice(params)

        assert productPrice.save() != null

        // test invalid parameters in update
        params.id = productPrice.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/productPrice/edit"
        assert model.productPriceInstance != null

        productPrice.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/productPrice/show/$productPrice.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        productPrice.clearErrors()

        populateValidParams(params)
        params.id = productPrice.id
        params.version = -1
        controller.update()

        assert view == "/productPrice/edit"
        assert model.productPriceInstance != null
        assert model.productPriceInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/productPrice/list'

        response.reset()

        populateValidParams(params)
        def productPrice = new ProductPrice(params)

        assert productPrice.save() != null
        assert ProductPrice.count() == 1

        params.id = productPrice.id

        controller.delete()

        assert ProductPrice.count() == 0
        assert ProductPrice.get(productPrice.id) == null
        assert response.redirectedUrl == '/productPrice/list'
    }
}

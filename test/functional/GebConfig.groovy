import org.openqa.selenium.htmlunit.HtmlUnitDriver
import org.openqa.selenium.firefox.FirefoxDriver

driver = { 
	def driver = new HtmlUnitDriver()
	driver.javascriptEnabled = true
	driver
}

environments {
	firefox {
		driver = { new FirefoxDriver() }
	}
}
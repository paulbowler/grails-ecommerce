grails.project.class.dir = "target/classes"
grails.project.test.class.dir = "target/test-classes"
grails.project.test.reports.dir = "target/test-reports"
grails.project.target.level = 1.6
//grails.project.war.file = "target/${appName}-${appVersion}.war"

grails.project.dependency.resolution = {
    // inherit Grails' default dependencies
    inherits("global") {
        // uncomment to disable ehcache
        // excludes 'ehcache'
    }
    log "warn" // log level of Ivy resolver, either 'error', 'warn', 'info', 'debug' or 'verbose'
    repositories {
        grailsCentral()
        // uncomment the below to enable remote dependency resolution
        // from public Maven repositories
        //mavenCentral()
        //mavenLocal()
        //mavenRepo "http://snapshots.repository.codehaus.org"
        //mavenRepo "http://repository.codehaus.org"
        //mavenRepo "http://download.java.net/maven/2/"
        //mavenRepo "http://repository.jboss.com/maven2/"
    }
    dependencies {
        test "org.codehaus.geb:geb-junit4:0.7.0"
        test "org.seleniumhq.selenium:selenium-support:2.6.0"
		test "org.seleniumhq.selenium:selenium-firefox-driver:2.9.0"
		test("org.seleniumhq.selenium:selenium-htmlunit-driver:2.24.1") {
			exclude 'xml-apis'
		}
    }

    plugins {
        build(":tomcat:$grailsVersion",
              ":release:1.0.0") {
            export = false
        }
        compile ":mail:1.0"
		compile ":jquery:1.7.2"
		compile ":jquery-ui:1.8.15"
		compile ":famfamfam:1.0.1"
        compile ":spring-security-core:1.2.7"
        compile ":spring-security-ui:0.2"
        compile ":webflow:2.0.0"
        compile ":searchable:0.6.3"
        test ":cucumber:0.6.0"
        test ":geb:0.7.0"
    }
}

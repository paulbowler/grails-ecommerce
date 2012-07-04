class UrlMappings {

	static mappings = {
		"/resource/$path**"(controller: 'script', action: 'parse')
		"/$controller/$action?/$id?"{
			constraints {
				// apply constraints here
			}
		}

		"/"(controller:"product", action:"list")
		"500"(view:'/error')
	}
}

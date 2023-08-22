module main

import net.http
import json

struct Story {
	quote  string
	author string
}

fn main() {
	resp := http.get('http://half-life-api.herokuapp.com/') or {
		println("Couldn't connect to the API.")
		println('Try checking your internet connection.')
		return
	}
	story := json.decode([]Story, resp.body) or {
		println('Failed to parse the Json.')
		println("Please, open a issue on the project's Gitlab.")
		return
	}
	println("'${story[0].quote}' - ${story[0].author}")
}

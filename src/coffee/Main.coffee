StageRenderer = require "core/StageRenderer"
SceneTraveler = require "core/scenes/SceneTraveler"
HomeScene = require "HomeScene"

#---------------------------------------------------------- Class Main

class Main
	
	@init = ()->
		StageRenderer.onUpdate.add(SceneTraveler.update)
		StageRenderer.onResize.add(SceneTraveler.resize)
		SceneTraveler.to(new HomeScene())
		return

	document.addEventListener('DOMContentLoaded', ()->
		Main.init()
		return
	)

module.exports = Main
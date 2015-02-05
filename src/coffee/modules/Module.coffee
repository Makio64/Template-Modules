# 
# Abstract Module
# 
# @author David Ronai / Makiopolis.com / @Makio64 
# 

Scene = require('core/scenes/Scene')
SceneTraveler = require('core/scenes/SceneTraveler')
StageRenderer = require('core/StageRenderer')

class Module extends Scene

	# for individual test, add himself if no current scene
	@testModule:()->
		if(!SceneTraveler.currentScene)
			scene = new @()
			SceneTraveler.to(scene)
			StageRenderer.onUpdate.add(SceneTraveler.update)
			StageRenderer.onResize.add(SceneTraveler.resize)

module.exports = Module

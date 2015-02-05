# 
# Abstract Scene
# 
# @author David Ronai / Makiopolis.com / @Makio64 
# 

SceneTraveler = require('./SceneTraveler')

class Scene

	constructor:()->
		return

	update:(dt)->
		return

	resize:()->
		return

	transitionIn:()->
		@onTransitionInComplete()
		return

	transitionOut:()->
		@onTransitionOutComplete()
		return

	onTransitionInComplete:()->
		return

	onTransitionOutComplete:()->
		SceneTraveler.onTransitionOutComplete()
		return

	dispose:()->
		return

module.exports = Scene

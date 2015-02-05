# 
# Stage2d for pixi.js with every basics you need
#
# @author David Ronai / Makiopolis.com / @Makio64 
# 
class Stage2d

	@stage 		= null
	@renderer	= null
	@isInit 	= false

	@init:(options)->

		if(@isInit)
			return

		PIXI.dontSayHello = true
		console.log('PIXI',PIXI.VERSION)

		view = options.view||null
		transparent = options.transparent||false
		antialias = options.antialias||false
		preserveDrawingBuffer = options.antialias||false
		@renderer = new PIXI.autoDetectRenderer(window.innerWidth, window.innerHeight,view,antialias,transparent,preserveDrawingBuffer)
		@stage = new PIXI.Stage()
		document.body.appendChild( @renderer.view )
		return

	@addChild:(o)->
		@stage.addChild(o)
		return

	@removeChild:(o)->
		@stage.addChild(o)
		return

	@render:()->
		@renderer.render ( @stage )
		return

	@resize:()->
		if @renderer
			@renderer.resize( window.innerWidth, window.innerHeight )
		return

module.exports = Stage2d

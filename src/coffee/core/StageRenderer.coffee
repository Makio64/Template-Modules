Stage3d = require "core/Stage3d"
Stage2d = require "core/Stage2d"
Signal 	= require "signals"

#---------------------------------------------------------- Class StageRenderer

class StageRenderer

	@dt 			= 0
	@lastTime 		= 0
	@pause 			= false

	@onResize 	= new Signal()
	@onUpdate 	= new Signal()
	@onBlur 	= new Signal()
	@onFocus 	= new Signal()

	@init:()->
		@pause = false

		window.onblur = (e)=>
			@pause = true
			cancelAnimationFrame(@update)
			@onBlur.dispatch()
			return

		window.onfocus = ()=>
			if(@pause)
				requestAnimationFrame(@update)
			@lastTime = Date.now()
			@pause = false
			@onFocus.dispatch()
			return

		window.onresize = ()=>
			width 	= window.innerWidth
			height 	= window.innerHeight
			@onResize.dispatch()
			return
		
		if window.PIXI != undefined
			Stage2d.init({transparent:false,antialias:false, background:0xFF0000})

		if window.THREE != undefined
			Stage3d.init({transparent:false,antialias:false, background:0x0000FF})
		
		@lastTime = Date.now()

		requestAnimationFrame( @update )

		return

	@update:()=>
		t = Date.now()
		dt = t - @lastTime
		@lastTime = t

		if @pause then return

		# update logic here
		@onUpdate.dispatch(dt)
		
		# render frame
		if window.PIXI
			Stage2d.render()

		if window.THREE
			Stage3d.render()

		requestAnimationFrame( @update )
		return

	@init()

module.exports = StageRenderer
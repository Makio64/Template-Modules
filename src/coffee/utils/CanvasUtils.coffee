class CanvasUtils 

	constructor:()->
		return

	@init:()->
		@isInit = true
		@canvas = document.createElement('canvas')
		@context = @canvas.getContext('2d')	
	# @init()

	@measureText:(text,font,padding)->
		@context.save()
		@context.fillStyle = font.color
		@context.font = font.size + 'px ' + font.type
		# @context.shadowColor = "#000"
		# @context.shadowOffsetX = 0
		# @context.shadowOffsetY = 0
		# @context.shadowBlur = 10

		textWidth = @context.measureText(text).width
		w = textWidth + ( padding * 2 )
		h = font.size + ( padding * 2 )
		@context.restore()

		return {w:Math.ceil(w),h:Math.ceil(h)}

	@fromImage:(image)->
		canvas 			= document.createElement('canvas')
		canvas.width 	= image.width
		canvas.height 	= image.height
		context 		= canvas.getContext('2d')
		context.width 	= image.width
		context.height 	= image.height
		context.drawImage(image, 0, 0)
		return canvas

	@dataFromImage:(image)->
		return CanvasUtils.fromImage(image).getContext('2d').getImageData(0, 0, image.width, image.height)

module.exports = CanvasUtils
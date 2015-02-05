# 
# Manage Shaders
# 
# @usage Shaders.load('name')
# @author David Ronai / Makiopolis.com / @Makio64 
# 

class Shaders

	@shaders = {}
	@shaderChunks = {}
	@onLoaded   		= ()->
	@queue 				= 0
	@vertexSuffix 		= '-vx.glsl'
	@fragmentSuffix  	= '-fs.glsl'
	@shaderPath 		= 'glsl/'
	@chunkPath			= 'glsl/'

	@load:( name )->
		@loadFile(name)
		return


	@loadFile:( name )=>
		@queue += 2
		req = new XMLHttpRequest()
		req.onload = ()=>
			@onShaderLoaded( name, 'vx', req )
		req.open( 'get', @shaderPath + name + @vertexSuffix, true )
		req.send()

		req2 = new XMLHttpRequest()
		req2.onload = ()=>
			@onShaderLoaded( name, 'fs', req2 )
		req2.open( 'get', @shaderPath + name + @fragmentSuffix, true )
		req2.send()
		return


	@onShaderLoaded = (name, type, req)=>

		if(@chunkLoaded(req.responseText))
			@registerShader(name,type,req)
		else
			setTimeout(100,@onShaderLoaded(name,type,req))

		return


	@chunkLoaded = (text)=>
		r = /\$(\w+)/gi
		 
		chunks = text.match( r )

		if(chunks == null) 
			return true

		chunksAlreadyLoaded = true

		for c in chunks
			if(@shaderChunks[c] == undefined || @shaderChunks[c] == null)
				chunksAlreadyLoaded = false
				@loadChunk(c)

		return chunksAlreadyLoaded


	@loadChunk = (name)=>
		req = new XMLHttpRequest()
		req.onload = ()=>
			@onChunkLoaded( name, req )
		req.open( 'get', @chunkPath + name + '.glsl', true )
		req.send()
		return


	@registerShader = (name, type, req)=>
		console.log('haha')
		if(!@shaders[name])
			@shaders[name] = {}
		@shaders[name][type] = req.responseText
		@queue--

		if (@queue == 0 && @onLoaded)
			@onLoaded()

	@parse = (shader)=>

		return

	@get = (id)=>
		return @shaders[id]

module.exports = Shaders
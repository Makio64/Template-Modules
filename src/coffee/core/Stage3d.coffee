# 
# Stage3d for three.js with every basics you need
#
# @author David Ronai / Makiopolis.com / @Makio64 
# 
class Stage3d


	@camera 	= null
	@scene 		= null
	@renderer 	= null
	@isInit		= false


	@init = (options)=>

		if(@isInit)
			return

		w = window.innerWidth
		h = window.innerHeight

		@camera = new THREE.PerspectiveCamera( 20, w / h, 1, 10000 )
		@camera.position.z = 100

		@scene = new THREE.Scene()
		@scene.add( new THREE.AmbientLight(color:0xFFFFFF) )

		transparent = options.transparent||false
		antialias = options.antialias||false

		@renderer = new THREE.WebGLRenderer({alpha:transparent,antialias:antialias})
		@renderer.setSize( w, h )

		document.body.appendChild(@renderer.domElement)
		return


	@add = (obj)=>
		@scene.add(obj)
		return


	@remove = (obj)=>
		@scene.remove(obj)
		return


	@removeAll = ()=>
		while @scene.children.length>0
			@scene.remove(@scene.children[0])
		return


	@render = ()=>
		Stage3d.renderer.render(@scene, @camera)
		return


	@resize = ()=>
		if @renderer
			@camera.aspect = window.innerWidth / window.innerHeight
			@camera.updateProjectionMatrix()
			@renderer.setSize( window.innerWidth, window.innerHeight )
		return

module.exports = Stage3d

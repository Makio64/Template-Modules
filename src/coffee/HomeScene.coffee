Scene 			= require('./core/scenes/Scene')
SceneTraveler 	= require('./core/scenes/SceneTraveler')
Stage3d 		= require('./core/Stage3d')

class HomeScene extends Scene

	constructor:()->
		w = 10
		h = 10
		for x in [0...w] by 1
			for y in [0...h] by 1
				geo = new THREE.BoxGeometry(10,10,10)
				material = new THREE.MeshBasicMaterial({color:0xffffff,wireframe:true})
				mesh = new THREE.Mesh(geo,material)
				mesh.position.set( x-w/2, y-w/2, 0 ) 
				mesh.position.multiplyScalar(10)
				Stage3d.add(mesh)
		
		# @loadScene1()
		# @loadScene2()
		@loadScene3()
		return

	loadScene1:()=>
		require.ensure(['./modules/001/Main'], (require)=>
			scene = require('./modules/001/Main')
			SceneTraveler.to(new scene())
		)
		return

	loadScene2:()=>
		require.ensure(['./modules/002/Main'], (require)=>
			scene = require('./modules/002/Main')
			SceneTraveler.to(new scene())
		)
		return

	loadScene3:()=>
		require.ensure(['./modules/003/Main'], (require)=>
			scene = require('./modules/003/Main')
			SceneTraveler.to(new scene())
		)
		return

module.exports = HomeScene
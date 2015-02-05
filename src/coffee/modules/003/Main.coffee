Stage3d 		= require('core/Stage3d')
Module 			= require('modules/Module')

class Main extends Module

	constructor:()->
		super()
		console.log('003')
		geometry = new THREE.SphereGeometry(2,8,8)
		material = new THREE.MeshBasicMaterial({color:0x0000FF,wireframe:true})
		@mesh = new THREE.Mesh(geometry,material)
		Stage3d.add(@mesh)
		return

	update:(dt)->
		@mesh.rotation.y += 0.01
		return

	@testModule()

module.exports = Main
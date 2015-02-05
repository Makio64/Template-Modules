Stage3d 		= require('core/Stage3d')
Module 			= require('modules/Module')

class Main extends Module

	constructor:()->
		super()
		console.log('002')
		geometry = new THREE.SphereGeometry(7,10,10)
		material = new THREE.MeshBasicMaterial({color:0x00FF00,wireframe:true})
		@mesh = new THREE.Mesh(geometry,material)
		Stage3d.add(@mesh)
		return

	update:(dt)->
		@mesh.rotation.z += 0.01
		return

	@testModule()

module.exports = Main
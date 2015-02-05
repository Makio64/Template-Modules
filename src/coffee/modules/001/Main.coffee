Stage3d 		= require('core/Stage3d')
Module 			= require('modules/Module')

class Main extends Module

	constructor:()->
		super()
		console.log('001')
		geometry = new THREE.BoxGeometry(7,7,7)
		material = new THREE.MeshBasicMaterial({color:0xFF0000,wireframe:true})
		@mesh = new THREE.Mesh(geometry,material)
		Stage3d.add(@mesh)
		return

	update:(dt)->
		@mesh.rotation.x+=.01
		return

	@testModule()

module.exports = Main
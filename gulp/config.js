var src 	= './src/';
var build 	= './build/';
var dist 	= './dist/';
var static 	= './static/';

module.exports = 
{
	port : 9000,
	path : 
	{
		build : build,
		src : src ,
		dist : dist,
		static : static,
		jade : src+'jade/',
		coffee : src+'coffee/',
		stylus : src+'stylus/',
		glsl : src+'glsl/'
	}
};